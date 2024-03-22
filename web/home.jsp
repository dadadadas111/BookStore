<%-- 
    Document   : home
    Created on : Feb 5, 2024, 4:42:30 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>Home</title>
<div class="preloader">
    <div class="preloader-inner">
        <div class="preloader-icon">
            <span></span>
            <span></span>
        </div>
    </div>
</div>
<%@ include file="pages/header.jsp" %>

<main>
    <!-- Hero Section -->
    <section class="jumbotron text-center bg-transparent" 
             style="background-image: url('image/welcome.jpg'); background-size: cover; background-repeat: no-repeat">
        <div class="container "   >
            <h1 class="jumbotron-heading text-muted" style="text-shadow:
                -1px -1px 0 white,
                1px -1px 0 white,
                -1px  1px 0 white,
                1px  1px 0 white;
                color: black;" >Welcome to Our Bookstore</h1>
            <p class="lead text-muted">Discover a wide range of books that cater to your interests.</p>
            <p>
                <a href="/Project/books" class="btn btn-primary my-2">Explore Books</a>
            </p>
        </div>
    </section>

    <!-- Featured Books Section -->
    <section class="container my-5">
        <h2 class="text-center mb-4">New Books</h2>
        <div class="row">
            <div class="col-md-12 row">

                <c:forEach items="${newBooks}" var="c">

                    <!-- Example Book Card (Repeat for each featured book) -->
                    <div class="col-md-3">
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
                <!-- Repeat for other featured books -->
            </div>
        </div>
    </section>
    
    <section class="container my-5">
        <h2 class="text-center mb-4">Hot Books</h2>
        <div class="row">
            <div class="col-md-12 row">

                <c:forEach items="${hotBooks}" var="c">

                    <!-- Example Book Card (Repeat for each featured book) -->
                    <div class="col-md-3">
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
                <!-- Repeat for other featured books -->
            </div>
        </div>
    </section>
    <section class="container my-5">
        <h2 class="text-center mb-4">Popular Books</h2>
        <div class="row">
            <div class="col-md-12 row">

                <c:forEach items="${popularBooks}" var="c">

                    <!-- Example Book Card (Repeat for each featured book) -->
                    <div class="col-md-3">
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
                <!-- Repeat for other featured books -->
            </div>
        </div>
    </section>
</main>
<script src="style/script.js"></script>


<%@ include file="pages/footer.jsp" %>

