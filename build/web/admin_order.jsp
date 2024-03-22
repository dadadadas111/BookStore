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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <style>
            .order-list {
                display: none;
                margin-top: 20px;
            }
        </style>

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

            <h2 class="mt-3 mb-4">Order Statistic</h2>
            <!-- Select element for choosing time period -->
            <label for="timePeriod">Select Time Period:</label>
            <select id="timePeriod" onchange="updateChart()">
                <option value="week">This Week</option>
                <option value="month">This Month</option>
                <option value="year">This Year</option>
            </select>

            <!-- Canvas for displaying chart -->
            <canvas id="ordersChart" width="400" height="200"></canvas>

            <script>
                // Sample data for orders
                const ordersData = {
                labels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ],
                        datasets: [{
                        label: 'Number of Orders',
                                data: [
                <c:forEach items="${chartWeek}" var="c">
                    ${c},
                </c:forEach>
                                ],
                                backgroundColor: 'rgba(0, 99, 132, 0.2)',
                                borderColor: 'rgba(0, 99, 132, 1)',
                                borderWidth: 3
                        }]
                };
                // Configure chart options
                const chartOptions = {
                scales: {
                y: {
                grid: {
                color: 'gray' // Change the color of the y-axis grid lines
                },
                        beginAtZero: true,
                        ticks: {
                        stepSize: 1, // Ensure ticks are displayed in integer increments
                                callback: function(value, index, values) {
                                return Number.isInteger(value) && value % 5 == 0 ? value : ''; // Display integer values only
                                },
                        }
                },
                        x: {
                        grid: {
                        color: 'gray' // Change the color of the x-axis grid lines
                        }

                        }
                }
                };
                // Get chart canvas element
                const ordersChartCanvas = document.getElementById('ordersChart').getContext('2d');
                // Create the initial chart
                const ordersChart = new Chart(ordersChartCanvas, {
                type: 'line',
                        data: ordersData,
                        options: chartOptions
                });
                // Function to update the chart based on selected time period
                function updateChart() {
                const timePeriod = document.getElementById('timePeriod').value;
                // Update chart data and labels based on selected time period (sample code)
                // You will need to replace this with your actual data retrieval logic
                let newData = [];
                let newLabels = [];
                if (timePeriod === 'week') {
                newData = [
                <c:forEach items="${chartWeek}" var="c">
                    ${c},
                </c:forEach>
                ];
                newLabels = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ];
                } else if (timePeriod === 'month') {
                newData = [
                <c:forEach items="${chartMonth}" var="c">
                    ${c},
                </c:forEach>
                ];
                newLabels = [
                <c:forEach begin="1" end="${chartMonth.size()}" var="c">
                    ${c},
                </c:forEach>
                ];
                } else if (timePeriod === 'year') {
                newData = [<c:forEach items="${chartYear}" var="c">
                    ${c},
                </c:forEach>];
                newLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                }

                // Update chart data and redraw
                ordersChart.data.labels = newLabels;
                ordersChart.data.datasets[0].data = newData;
                ordersChart.update();
                }
            </script>

            <h2 class="mt-3 mb-4">Order Status Toggle</h2>

            <div class="btn-group mb-4">
                <button class="btn btn-primary" onclick="showOrders('error')">Error</button>
                <button class="btn btn-primary" onclick="showOrders('processing')">Processing</button>
                <button class="btn btn-primary" onclick="showOrders('packing')">Packing</button>
                <button class="btn btn-primary" onclick="showOrders('shipping')">Shipping</button>
                <button class="btn btn-primary" onclick="showOrders('finished')">Finished</button>
            </div>

            <div id="errorOrders" class="order-list">
                <h3>Error Orders</h3>
                <!-- Display error orders here -->
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

                        <c:forEach items="${error}" var="c" > 
                            <tr onclick="window.location.href = '/Project/order-detail?id=${c.getOrderID()}&view=admin'" style="cursor: pointer;" class="trow">
                                <th scope="row">${c.getOrderID()}</th>
                                <td>${c.getOrderDate()}</td>
                                <td>$${c.getTotal()}</td>
                                <td>${c.getStatus()}</td>
                            </tr>  
                        </c:forEach>


                    </tbody>
                </table>
            </div>

            <div id="processingOrders" class="order-list">
                <h3>Processing Orders</h3>
                <!-- Display processing orders here -->
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

                        <c:forEach items="${processing}" var="c" > 
                            <tr onclick="window.location.href = '/Project/order-detail?id=${c.getOrderID()}&view=admin'" style="cursor: pointer;" class="trow">
                                <th scope="row">${c.getOrderID()}</th>
                                <td>${c.getOrderDate()}</td>
                                <td>$${c.getTotal()}</td>
                                <td>${c.getStatus()}</td>
                            </tr>  
                        </c:forEach>


                    </tbody>
                </table>
            </div>

            <div id="packingOrders" class="order-list">
                <h3>Packing Orders</h3>
                <!-- Display packing orders here --><table class="table cart">
                    <thead>
                        <tr>
                            <th scope="col">Order ID</th>
                            <th scope="col">Order Date</th>
                            <th scope="col">Total Amount</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${packing}" var="c" > 
                            <tr onclick="window.location.href = '/Project/order-detail?id=${c.getOrderID()}&view=admin'" style="cursor: pointer;" class="trow">
                                <th scope="row">${c.getOrderID()}</th>
                                <td>${c.getOrderDate()}</td>
                                <td>$${c.getTotal()}</td>
                                <td>${c.getStatus()}</td>
                            </tr>  
                        </c:forEach>


                    </tbody>
                </table>

            </div>

            <div id="shippingOrders" class="order-list">
                <h3>Shipping Orders</h3>
                <!-- Display shipping orders here -->
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

                        <c:forEach items="${shipping}" var="c" > 
                            <tr onclick="window.location.href = '/Project/order-detail?id=${c.getOrderID()}&view=admin'" style="cursor: pointer;" class="trow">
                                <th scope="row">${c.getOrderID()}</th>
                                <td>${c.getOrderDate()}</td>
                                <td>$${c.getTotal()}</td>
                                <td>${c.getStatus()}</td>
                            </tr>  
                        </c:forEach>


                    </tbody>
                </table>
            </div>

            <div id="finishedOrders" class="order-list">
                <h3>Finished Orders</h3>
                <!-- Display finished orders here -->
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

                        <c:forEach items="${finished}" var="c" > 
                            <tr onclick="window.location.href = '/Project/order-detail?id=${c.getOrderID()}&view=admin'" style="cursor: pointer;" class="trow">
                                <th scope="row">${c.getOrderID()}</th>
                                <td>${c.getOrderDate()}</td>
                                <td>$${c.getTotal()}</td>
                                <td>${c.getStatus()}</td>
                            </tr>  
                        </c:forEach>


                    </tbody>
                </table>
            </div>

            <script>
                function showOrders(status) {
                // Hide all order lists

                var orderLists = document.getElementsByClassName('order-list');
                for (var i = 0; i < orderLists.length; i++) {
                orderLists[i].style.display = 'none';
                }

                // Show the selected order list
                var selectedOrderList = document.getElementById(status + 'Orders');
                if (selectedOrderList) {
                selectedOrderList.style.display = 'block';
                }
                }
            </script>




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

