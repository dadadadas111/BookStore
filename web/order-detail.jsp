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
        <title>Order Detail</title>
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
        <form action="order-detail" method="post" id="form">
            <main class="container mt-5">
                <h2>Address</h2>
                <div class="form-group">
                    <input type="street" 
                           class="form-control" 
                           id="autocomplete" 
                           value="${order.getAddress()[0]}"
                           name="street"
                           disabled>

                    <input type="city" 
                           class="form-control" 
                           id="inputCity" 
                           value="${order.getAddress()[1]}"
                           name="city"
                           disabled>

                    <input type="state" 
                           class="form-control" 
                           id="inputState" 
                           value="${order.getAddress()[2]}"
                           name="state"
                           disabled>

                    <input type="zip" 
                           class="form-control" 
                           id="inputZip" 
                           value="${order.getAddress()[3]}"
                           name="zip"
                           disabled>

                    <input type="county" 
                           class="form-control" 
                           id="inputCounty" 
                           value="${order.getAddress()[4]}"
                           name="county"
                           disabled>

                    <input type="country" 
                           class="form-control" 
                           id="inputCountry" 
                           value="${order.getAddress()[5]}"
                           name="country"
                           disabled>
                </div>

                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <hr >
                <h2>Order Detail</h2>
                <table class="table cart">
                    <thead>
                        <tr>
                            <th scope="col">Product id</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">Total</th>

                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${list}" var="c">
                            <tr >
                                <td onclick="window.location.href = '/Project/book-detail?id=${c.getBookID()}';" style="cursor: pointer;" class="trow">${c.getBookID()}</td>
                                <td> ${c.getQuantity()} </td>
                                <td>$${c.getPrice()}</td>
                                <td>$${c.getPrice() * c.getQuantity() }</td>
                            </tr>
                        </c:forEach>


                    </tbody>
                </table>

                <!-- Total -->
                <div class="d-flex justify-content-end">
                    <div class="total-section">
                        <p><strong>Total: $${order.getTotal()}</strong></p>
                    </div>
                </div>


                <h2 class="mt-4 mb-3">Ordered On: <span style="color:violet">${order.getOrderDate()}</span></h2>
                <h2 class="mt-4 mb-3">Payment Method: <span style="color:violet">Pay on Delivery</span></h2>
                <h2 class="mt-4 mb-3">Current Status: <span style="color:violet">${order.getStatus()}</span></h2>

                <c:if test="${sessionScope.user.getRole() eq 'admin'}">
                    
                    <h2 class="mt-4 mb-3">Update Status: <select name="status" id="status">
                            <option value="0" ${order.getStatus() eq 'error' ? "selected": ""}>error</option>
                            <option value="1" ${order.getStatus() eq 'processing' ? "selected": ""} >processing</option>
                            <option value="2" ${order.getStatus() eq 'packing' ? "selected": ""}>packing</option>
                            <option value="3" ${order.getStatus() eq 'shipping' ? "selected": ""}>shipping</option>
                            <option value="4" ${order.getStatus() eq 'finished' ? "selected": ""}>finished</option>
                        </select></h2>
                </c:if>
                <input name="id" value="${order.getOrderID()}" hidden>







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
                                    const status = document.getElementById("status");
                                    status.addEventListener("change", () => {
                                        const form = document.getElementById("form");
                                        form.submit();

                                    })

        </script>
        <script src="./style/script.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

