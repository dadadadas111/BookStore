<%-- 
    Document   : books
    Created on : Feb 6, 2024, 5:30:14 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Listing</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="style/bookdetail.css">
    </head>

    <body>
        <div class="preloader">
            <div class="preloader-inner">
                <div class="preloader-icon">
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <%@include file="pages/header.jsp" %>
        <main class="container mt-5">
            <form action="book-detail" method="post">
                <div class="row g-4">
                    <div class="col-md-4">
                        <img id="book-cover" src="image/book${book.getBookID()}.jpg" alt="Book Cover" class="img-fluid rounded shadow img-magnifier-container">

                    </div>
                    <div class="col-md-8">
                        <div class="card border-0 shadow">
                            <div class="card-body row">
                                <h3 class="col-md-12" style="text-align: center;">  ${requestScope.book.getTitle()}  </h3>
                                <hr color="violet" class="col-md-11">
                                <div class="col-md-6">
                                    <p>By: ${requestScope.book.getAuthorName()}</p>
                                    <p>Genre: ${requestScope.book.getCategories()}</p>

                                </div>
                                <div class="col-md-6">
                                    <p>Price ($) : <input type="number" name="price" min="1" value="${requestScope.book.getPrice()}"></p>
                                    <p>Quantity: <input type="number" name="quantity" value="${requestScope.book.getQuantity()}"></p>
                                </div>
                                <hr color="violet" class="col-md-11">

                                <div class="d-flex justify-content-between align-items-center col-md-12">
                                    <div>
                                        <span class="h5">Rating:</span>
                                        <span class="text-warning">&#9733;</span> <span>${book.getRating()}</span> (${book.getNumberOfReviews()} reviews)
                                    </div>

                                </div>

                                <hr class="col-md-11">

                                <input name="view" value="update" hidden>
                                <input name="id" value="${requestScope.book.getBookID()}" hidden>
                                <input type="submit" class="btn btn-primary col-md-4" value="Update">

                            </div>
                        </div>

                        <hr>
                        <div class="comment-section">
                            <h4>Comments</h4>
                            <br>
                            <br>

                            <c:forEach items="${book.getReviews()}" var="c">
                                <div class="comment">
                                    <span class="text-muted">
                                        <div class="user-avatar">
                                            <img src="./image/user${c.getUserID()}.jpg" alt="User Avatar"> ${c.getUserName()}

                                        </div>
                                    </span>
                                    <br>
                                    <p class="text-warning">
                                        <c:forEach begin="1" end="${c.getRating()}">
                                            &#9733;
                                        </c:forEach>
                                    </p>
                                    <p>${c.getComment()}</p>

                                    <hr color="violet">
                                </div>
                            </c:forEach>



                        </div>
                    </div>
                </div>
            </form>

        </main>
        <footer>
            <%@include file="pages/footer.jsp" %>  
        </footer>



        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

        <!-- Custom script for product listing -->
        <script src="./style/script.js" ></script>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>

    </body>

</html>

