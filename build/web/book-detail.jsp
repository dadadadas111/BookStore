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
            <c:if test="${book != null}">
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
                                    <p>Price:  $ ${requestScope.book.getPrice()}</p>

                                </div>
                                <div class="col-md-6">
                                    <p>Genre: ${requestScope.book.getCategories()}</p>
                                    <p>Quantity: ${requestScope.book.getQuantity()}</p>
                                </div>
                                <hr color="violet" class="col-md-11">

                                <div class="d-flex justify-content-between align-items-center col-md-12">
                                    <div>
                                        <span class="h5">Rating:</span>
                                        <span class="text-warning">&#9733;</span> <span>${book.getRating()}</span> (${book.getNumberOfReviews()} reviews)
                                    </div>

                                </div>

                                <hr class="col-md-11">

                                <a target="_blank" href="/Project/cart?add-id=${book.getBookID()}" class="btn btn-primary col-md-4" ${book.getQuantity() == 0 ? "hidden":""}>Add To Cart</a>

                            </div>
                        </div>

                        <hr>
                        <div class="comment-section">
                            <h4>Comments</h4>
                            <br>
                            <c:if test="${sessionScope.user != null}">
                                <c:if test="${canReview eq true}">
                                    <div>
                                        <a href="#" class="btn btn-sm btn-outline-primary float-right" data-toggle="modal" data-target="#reviewModal">Write a Review</a>
                                    </div>
                                </c:if>

                            </c:if>



                            <!-- Review Modal -->
                            <div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="reviewModalLabel" aria-hidden="true">
                                <form action="book-detail" method="get">
                                    <input name="id" value="${book.getBookID()}" hidden>
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="reviewModalLabel">Write a Review</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <!-- Rating Input -->
                                                <div class="form-group">
                                                    <label for="rating">Rating:</label>
                                                    <select style="color: goldenrod;" id="rating" name="rating" class="form-control" required>
                                                        <option value="1">&#9733;</option>
                                                        <option value="2">&#9733;&#9733;</option>
                                                        <option value="3">&#9733;&#9733;&#9733;</option>
                                                        <option value="4">&#9733;&#9733;&#9733;&#9733;</option>
                                                        <option value="5" selected>&#9733;&#9733;&#9733;&#9733;&#9733;</option>
                                                    </select>
                                                </div>
                                                <!-- Review Text Input -->
                                                <div class="form-group">
                                                    <label for="reviewText">Review:</label>
                                                    <textarea id="reviewText" name="comment" class="form-control" rows="3" required></textarea>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <input type="submit" class="btn btn-primary" value="Submit Review">
                                            </div>
                                        </div>
                                    </div>
                                </form>

                            </div>
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
            </c:if>
            <c:if test="${book == null}">
                <h2 style="color: red;">This book is deleted or not existing.</h2>
            </c:if>

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

