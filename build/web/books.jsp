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
        <main class="container">
            <form action="books" method="get">
                <div class="row">
                    <c:if test="${name != null}" >
                        <div class="col-md-12">

                            <h2><i>Search result for '${requestScope.name}'</i></h2>
                        </div>

                    </c:if>

                    <!-- Product listing on the left side -->
                    <div class="col-md-9">
                        <h2 class="text-center">Product Listing</h2>

                        <!-- Sorting options -->
                        <!-- Product cards will be dynamically added here -->
                        <div id="productList">
                            <div class="row">
                                <c:if test="${books.size() == 0}" >
                                    <h3 style="color:red;"><i>There are no books with the required options.</i></h3>
                                    <h3 style="color:red;"><i>Try again with different options.</i></h3>
                                </c:if>

                                <c:forEach items="${requestScope.books}" var="c">

                                    <!-- Example Book Card (Repeat for each featured book) -->
                                    <div class="col-md-4">
                                        <div class="card product-card">
                                            <img src="image/book${c.getBookID()}.jpg" class="card-img-top" alt="Book Cover">
                                            <div class="card-body ">
                                                <h5 class="card-title">${c.getTitle()}</h5>
                                                <span>
                                                    <p class="card-text float-left">By: ${c.getAuthorName()}</p>
                                                    <p class="card-text float-right">$${c.getPrice()}</p>
                                                </span>



                                            </div>
                                            <!-- Add to Cart Button -->

                                            <span>

                                                <a ${c.getQuantity() == 0 ? "hidden":""} target="_blank" href="/Project/cart?add-id=${c.getBookID()}" class="btn btn-primary float-left"><i class="fas fa-shopping-cart"  ></i></a>
                                                <a href="/Project/book-detail?id=${c.getBookID()}" class="btn btn-primary float-right"><i class="fas fa-search"></i></a> 
                                            </span>



                                        </div>
                                    </div>
                                    <!-- Repeat for other featured books -->


                                </c:forEach>


                            </div>

                            <div aria-label="Page navigation">
                                <ul class="pagination justify-content-center" id="pagination">

                                    <c:forEach begin="1" end="${size / 6 + ((size % 6 == 0) ? 0 : 1)}" var="i" >
                                        <li class="page-item ${i == index ? "active": ""}"><input type="submit" name="index" value="${i}" class="page-link"></li>
                                        </c:forEach>
                                </ul>
                            </div>

                        </div>


                    </div>
                    <!-- Filters on the right side -->
                    <div class="col-md-3">


                        <div class="filters">

                            <c:if test="${name != null}" >
                                <input name="name" value="${requestScope.name}" hidden> 
                            </c:if>

                            <h4>Filters</h4>
                            <label>Sort By:</label>
                            <div class="btn-group">
                                <input name="sort" type="submit" class="btn btn-success ${sort eq "Popular" ? "active": ""}" value="Popular"></input>
                                <input name="sort" type="submit" class="btn btn-success ${sort eq "New" ? "active": ""}" value="New"></input>
                                <input name="sort" type="submit" class="btn btn-success ${sort eq "High Rated" ? "active": ""}" value="High Rated"></input>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown"
                                            aria-haspopup="true" aria-expanded="false">
                                        Price
                                    </button>
                                    <div class="dropdown-menu">
                                        <input name="sort" type="submit" class="dropdown-item ${sort eq "Low to High" ? "active": ""}" value="Low to High" ></input>
                                        <input name="sort" type="submit" class="dropdown-item ${sort eq "High to Low" ? "active": ""}" value="High to Low"></input>
                                    </div>
                                </div>
                            </div>
                            <hr color="red">
                            <label>Category:</label>
                            <select class="form-control" name="category">
                                <option value="%%">All Categories</option>

                                <c:forEach items="${requestScope.Categories}" var="c">
                                    <option value="${c.getCategoryID()}" ${requestScope.category == c.getCategoryID() ? "selected" : "" }>${c.getCategoryName()}</option>
                                </c:forEach>
                                <!-- Add more categories as needed -->
                            </select>
                            <hr color="red">
                            <label>Author:</label>
                            <select class="form-control" name="author">
                                <option value="%%">All Authors</option>
                                <c:forEach items="${requestScope.Authors}" var="c">
                                    <option value="${c.getAuthorID()}" ${requestScope.author == c.getAuthorID() ? "selected" : "" }>${c.getAuthorName()}</option>
                                </c:forEach>
                                <!-- Add more authors as needed -->
                            </select>
                            <hr color="red">
                            <label>Publisher:</label>
                            <select class="form-control" name="publisher">
                                <option value="%%" selected>All Publishers</option>
                                <c:forEach items="${requestScope.Publishers}" var="c">
                                    <option value="${c.getPublisherID()}" ${requestScope.publisher == c.getPublisherID() ? "selected" : "" } >${c.getPublisherName()}</option>
                                </c:forEach>
                                <!-- Add more authors as needed -->
                            </select>
                            <hr color="red">

                            <input type="submit" value="Apply Filters" class="btn btn-primary"></input>
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

    </body>

</html>

