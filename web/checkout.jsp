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
        <title>Check Out</title>
        <!-- Bootstrap CSS link -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style/checkout.css"/>
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
        <form action="checkout" method="post">
            <main class="container mt-5">
                <h2>Your Address</h2>
                <div class="form-group">
                    <input type="street" 
                           class="form-control" 
                           id="autocomplete" 
                           placeholder="Street"
                           name="street"
                           required>

                    <input type="city" 
                           class="form-control" 
                           id="inputCity" 
                           placeholder="City"
                           name="city"
                           required>

                    <input type="state" 
                           class="form-control" 
                           id="inputState" 
                           placeholder="State"
                           name="state"
                           required>

                    <input type="zip" 
                           class="form-control" 
                           id="inputZip" 
                           placeholder="Zip"
                           name="zip"
                           required>

                    <input type="county" 
                           class="form-control" 
                           id="inputCounty" 
                           placeholder="County"
                           name="county"
                           required>

                    <input type="country" 
                           class="form-control" 
                           id="inputCountry" 
                           placeholder="Country"
                           name="country"
                           required>
                </div>

                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <hr >
                <h2>Your Order Detail</h2>
                <table class="table cart">
                    <thead>
                        <tr>
                            <th scope="col">Product</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">Total</th>

                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${sessionScope.cart}" var="c">
                            <tr>
                                <td>${c.getBook().getTitle()}</td>
                                <td> ${c.getQuantity()} </td>
                                <td id="price-${c.getBook().getBookID()}">$${c.getBook().getPrice()}</td>
                                <td>$${c.getBook().getPrice() * c.getQuantity() }</td>
                            </tr>
                        </c:forEach>


                    </tbody>
                </table>

                <h2 class="mt-4 mb-3">Payment Method</h2>

                <div class="form-check">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="delivery" value="delivery" checked>
                    <label class="form-check-label" for="delivery">
                        Pay on delivery
                    </label>
                </div>


                <div class="form-check " >
                    <input class="form-check-input" type="radio" name="paymentMethod" id="creditCard" value="creditCard" disabled  >
                    <label class="form-check-label tooltip" for="creditCard">
                        Credit Card
                        <span class="tooltiptext">This method is not available at the moment</span>
                    </label>
                </div>

                <div class="form-check">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="paypal" value="paypal" disabled>
                    <label class="form-check-label tooltip" for="paypal">
                        PayPal
                        <span class="tooltiptext">This method is not available at the moment</span>
                    </label>
                </div>


                <!-- Total and Checkout Section -->
                <div class="d-flex justify-content-end">
                    <div class="total-section">
                        <p><strong>Total: $${order_total}</strong></p>
                        <input type="submit" value="Checkout" class="btn btn-primary" ${sessionScope.user != null ? "" : "disabled='true' "}>
                        <c:if test="${sessionScope.user == null}">
                            <p>You must <a href="/Project/login" target="_blank">log in</a> before checkout</p>
                        </c:if>
                    </div>
                </div>
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
<script src="./style/script.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

