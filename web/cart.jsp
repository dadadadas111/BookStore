<%-- 
    Document   : cart.jsp
    Created on : Mar 3, 2024, 12:21:19 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Shopping Cart</title>
        <!-- Bootstrap CSS link -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <form action="checkout" method="get">
            <main class="container mt-5">
                <h2>Your Shopping Cart</h2>

                <c:if test="${sessionScope.cart == null or sessionScope.cart.size() == 0}">
                    <h5 style="color:red;"> There are no products in cart yet. </h5>
                </c:if>
                <c:if test="${sessionScope.cart != null and sessionScope.cart.size() != 0}">
                    <table class="table cart">
                        <thead>
                            <tr>
                                <th scope="col">Product</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Price</th>
                                <th scope="col">Action</th>

                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach items="${sessionScope.cart}" var="c">
                                <tr >
                                    <td onclick="window.location.href = '/Project/book-detail?id=${c.getBook().getBookID()}';" style="cursor: pointer;" class="trow">${c.getBook().getTitle()}</td>
                                    <td>
                                        <div class="input-group input" data-id="${c.getBook().getBookID()}" >

                                            <input id="quantity-${c.getBook().getBookID()}" name="item${c.getBook().getBookID()}" type="number" min="1" max="${c.getBook().getQuantity()}" class="form-control text-center" style="width: 3px;" value="${c.getQuantity()}">

                                        </div>
                                    </td>
                                    <td id="price-${c.getBook().getBookID()}">$${c.getBook().getPrice()}</td>
                                    <td><a href="/Project/cart?remove=${c.getBook().getBookID()}" class="btn btn-danger">Remove</a></td>
                                </tr>
                            </c:forEach>


                        </tbody>
                    </table>

                    <!-- Total and Checkout Section -->
                    <div class="d-flex justify-content-end">
                        <div class="total-section">
                            <p><strong>Total: $<span id="cart-total">${cart_total}</span></strong></p>
                            <input type="submit" value="Checkout" class="btn btn-primary"></input>
                        </div>
                    </div>
                </c:if>

            </main>
        </form>


        <!-- Bootstrap JS and Popper.js scripts (required for Bootstrap functionality) -->
        <footer>
            <%@include file="pages/footer.jsp" %>  
        </footer>



        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Custom script for product listing -->
        <script>


                                        recalculateTotal();
                                        document.querySelectorAll('.input').forEach(function (input) {
                                            input.addEventListener('change', function () {
                                                // Recalculate total when quantity changes
                                                recalculateTotal();
                                            });
                                        });

                                        function recalculateTotal() {
                                            // Get all quantity input fields
                                            var quantityInputs = document.querySelectorAll('.input');

                                            // Calculate the total based on the quantity and price of each item
                                            var total = 0;
                                            quantityInputs.forEach(function (input) {
                                                var bookId = input.getAttribute("data-id");
                                                console.log(bookId);
                                                var quantity = parseInt(document.getElementById(`quantity-` + bookId).value);
                                                var price = parseInt(document.getElementById(`price-` + bookId).textContent.substring(1)); // Extract price without '$'
                                                total += quantity * price;
                                            });

                                            // Update the total in the DOM
                                            document.getElementById('cart-total').innerHTML = total; // Display total with two decimal places
                                        }

        </script>
        <script src="./style/script.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

