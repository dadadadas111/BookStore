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
        <title>Orders Listing</title>
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

            <h2>Your Orders</h2>
            <table class="table cart">
                <thead>
                    <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">Order Date</th>
                        <th scope="col">Total Amount</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach items="${orders}" var="c" > 
                        <tr onclick="window.location.href = '/Project/order-detail?id=${c.getOrderID()}'" style="cursor: pointer;" class="trow">
                            <th scope="row">${c.getOrderID()}</th>
                            <td>${c.getOrderDate()}</td>
                            <td>$${c.getTotal()}</td>
                            <td>${c.getStatus()}</td>
                        </tr>  
                    </c:forEach>
                    

                </tbody>
            </table>



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

