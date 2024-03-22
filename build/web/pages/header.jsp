<%-- 
    Document   : header
    Created on : Feb 5, 2024, 4:40:16 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Bookstore E-commerce</title>
        <script defer src="./style/theme.js"></script>
        <!-- CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="./style/style.css" >
        <c:if test="${page eq 'checkout' or page eq 'order-detail'}">
            <link rel="stylesheet" href="style/checkout.css"/>  
        </c:if>

    </head>

    <header class="bg-transparent">

        <div class="search-bar">
            <!-- Your search bar HTML goes here -->
            <form action="books" method="post">
                <input name="name" type="text" placeholder="Search...">
                <button type="submit">Search</button>
            </form>

        </div>




        <div class="cart-section">
            <!-- Cart icon with item count -->
            <div class="cart-icon">
                <a href="/Project/cart" class="nav-item">
                    <svg 
                        xmlns="http://www.w3.org/2000/svg" 
                        viewBox="0 0 560 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path
                        fill="currentColor"
                        class="fa-primary"
                        d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"/></svg>

                </a>
            </div>
        </div>

        <% if ( request.getSession().getAttribute("user") == null) { %>
        <a class="login" href="/Project/login"  >Log in</a>
        <% } else { %>
        <div class="user-section">
            <!-- User avatar with username -->
            <div class="user-avatar">
                <img src="./image/user${sessionScope.user.getId()}.jpg" alt="User Avatar">
            </div>
            <a class="login" href="/Project/login?action=logout"  >Log out</a>
            <% } %>
        </div>

    </header>
    <!-- Navbar -->
    <nav class="navbar">
        <ul class="navbar-nav">
            <li class="logo">
                <a href="#" class="nav-link">
                    <span class="link-text logo-text">PRJ301</span>
                    <svg
                        aria-hidden="true"
                        focusable="false"
                        data-prefix="fad"
                        data-icon="angle-double-right"
                        role="img"
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 448 512"
                        class="svg-inline--fa fa-angle-double-right fa-w-14 fa-5x"
                        >
                    <g class="fa-group">
                    <path
                        fill="currentColor"
                        d="M224 273L88.37 409a23.78 23.78 0 0 1-33.8 0L32 386.36a23.94 23.94 0 0 1 0-33.89l96.13-96.37L32 159.73a23.94 23.94 0 0 1 0-33.89l22.44-22.79a23.78 23.78 0 0 1 33.8 0L223.88 239a23.94 23.94 0 0 1 .1 34z"
                        class="fa-secondary"
                        ></path>
                    <path
                        fill="currentColor"
                        d="M415.89 273L280.34 409a23.77 23.77 0 0 1-33.79 0L224 386.26a23.94 23.94 0 0 1 0-33.89L320.11 256l-96-96.47a23.94 23.94 0 0 1 0-33.89l22.52-22.59a23.77 23.77 0 0 1 33.79 0L416 239a24 24 0 0 1-.11 34z"
                        class="fa-primary"
                        ></path>
                    </g>
                    </svg>
                </a>
            </li>

            <li class="nav-item" >
                <a href="/Project/home" class="nav-link ${requestScope.page == "home"? "active": "" }">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" >
                    <path 
                        fill="currentColor"
                        class="fa-primary"
                        d="M543.8 287.6c17 0 32-14 32-32.1c1-9-3-17-11-24L512 185V64c0-17.7-14.3-32-32-32H448c-17.7 0-32 14.3-32 32v36.7L309.5 7c-6-5-14-7-21-7s-15 1-22 8L10 231.5c-7 7-10 15-10 24c0 18 14 32.1 32 32.1h32v69.7c-.1 .9-.1 1.8-.1 2.8V472c0 22.1 17.9 40 40 40h16c1.2 0 2.4-.1 3.6-.2c1.5 .1 3 .2 4.5 .2H160h24c22.1 0 40-17.9 40-40V448 384c0-17.7 14.3-32 32-32h64c17.7 0 32 14.3 32 32v64 24c0 22.1 17.9 40 40 40h24 32.5c1.4 0 2.8 0 4.2-.1c1.1 .1 2.2 .1 3.3 .1h16c22.1 0 40-17.9 40-40V455.8c.3-2.6 .5-5.3 .5-8.1l-.7-160.2h32z"/>
                    </svg>
                    <span class="link-text">Home</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="/Project/books" class="nav-link ${requestScope.page == "books"? "active": ""} ">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                    <path
                        fill="currentColor"
                        class="fa-primary"
                        d="M96 0C43 0 0 43 0 96V416c0 53 43 96 96 96H384h32c17.7 0 32-14.3 32-32s-14.3-32-32-32V384c17.7 0 32-14.3 32-32V32c0-17.7-14.3-32-32-32H384 96zm0 384H352v64H96c-17.7 0-32-14.3-32-32s14.3-32 32-32zm32-240c0-8.8 7.2-16 16-16H336c8.8 0 16 7.2 16 16s-7.2 16-16 16H144c-8.8 0-16-7.2-16-16zm16 48H336c8.8 0 16 7.2 16 16s-7.2 16-16 16H144c-8.8 0-16-7.2-16-16s7.2-16 16-16z"/>
                    </svg>

                    <span class="link-text">Books</span>
                </a>
            </li>

            <c:if test="${sessionScope.user != null}">
                <li class="nav-item">
                    <a href="/Project/profile" class="nav-link ${requestScope.page == "profile" ? "active": ""}">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                        <path 
                            fill="currentColor"
                            class="fa-primary"
                            d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"/></svg>
                        <span class="link-text">Profile</span>
                    </a>
                </li>
            </c:if>


            <c:if test="${sessionScope.user != null}">
                <li class="nav-item">
                    <a href="/Project/order" class="nav-link ${requestScope.page == "order" || requestScope.page == "order-detail" ? "active": ""}">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                        <path 
                            fill="currentColor"
                            class="fa-primary"
                            d="M40 48C26.7 48 16 58.7 16 72v48c0 13.3 10.7 24 24 24H88c13.3 0 24-10.7 24-24V72c0-13.3-10.7-24-24-24H40zM192 64c-17.7 0-32 14.3-32 32s14.3 32 32 32H480c17.7 0 32-14.3 32-32s-14.3-32-32-32H192zm0 160c-17.7 0-32 14.3-32 32s14.3 32 32 32H480c17.7 0 32-14.3 32-32s-14.3-32-32-32H192zm0 160c-17.7 0-32 14.3-32 32s14.3 32 32 32H480c17.7 0 32-14.3 32-32s-14.3-32-32-32H192zM16 232v48c0 13.3 10.7 24 24 24H88c13.3 0 24-10.7 24-24V232c0-13.3-10.7-24-24-24H40c-13.3 0-24 10.7-24 24zM40 368c-13.3 0-24 10.7-24 24v48c0 13.3 10.7 24 24 24H88c13.3 0 24-10.7 24-24V392c0-13.3-10.7-24-24-24H40z"/>
                        <span class="link-text">Orders</span>
                    </a>
                </li>
            </c:if>


            <c:if test="${sessionScope.user != null && sessionScope.user.getRole() eq 'admin' }">
                <li class="nav-item">
                    <a href="/Project/admin" class="nav-link ${requestScope.page == "admin" ? "active": ""}">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                        <path 
                            fill="currentColor"
                            class="fa-primary"
                            d="M96 128a128 128 0 1 0 256 0A128 128 0 1 0 96 128zm94.5 200.2l18.6 31L175.8 483.1l-36-146.9c-2-8.1-9.8-13.4-17.9-11.3C51.9 342.4 0 405.8 0 481.3c0 17 13.8 30.7 30.7 30.7H162.5c0 0 0 0 .1 0H168 280h5.5c0 0 0 0 .1 0H417.3c17 0 30.7-13.8 30.7-30.7c0-75.5-51.9-138.9-121.9-156.4c-8.1-2-15.9 3.3-17.9 11.3l-36 146.9L238.9 359.2l18.6-31c6.4-10.7-1.3-24.2-13.7-24.2H224 204.3c-12.4 0-20.1 13.6-13.7 24.2z"/></svg>
                        <span class="link-text">Admin</span>
                    </a>
                </li>
            </c:if>




            <li class="nav-item" id="themeButton">
                <a class="nav-link">
                    <svg
                        class="theme-icon"
                        id="darkIcon"
                        aria-hidden="true"
                        focusable="false"
                        data-prefix="fad"
                        data-icon="moon-stars"
                        role="img"
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 512 512"
                        class="svg-inline--fa fa-moon-stars fa-w-16 fa-7x"
                        >
                    <g class="fa-group">
                    <path
                        fill="currentColor"
                        d="M320 32L304 0l-16 32-32 16 32 16 16 32 16-32 32-16zm138.7 149.3L432 128l-26.7 53.3L352 208l53.3 26.7L432 288l26.7-53.3L512 208z"
                        class="fa-secondary"
                        ></path>
                    <path
                        fill="currentColor"
                        d="M332.2 426.4c8.1-1.6 13.9 8 8.6 14.5a191.18 191.18 0 0 1-149 71.1C85.8 512 0 426 0 320c0-120 108.7-210.6 227-188.8 8.2 1.6 10.1 12.6 2.8 16.7a150.3 150.3 0 0 0-76.1 130.8c0 94 85.4 165.4 178.5 147.7z"
                        class="fa-primary"
                        ></path>
                    </g>
                    </svg>

                    <svg
                        class="theme-icon"
                        id="lightIcon"
                        aria-hidden="true"
                        focusable="false"
                        data-prefix="fad"
                        data-icon="sun"
                        role="img"
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 512 512"
                        class="svg-inline--fa fa-sun fa-w-16 fa-7x"
                        >
                    <g class="fa-group">
                    <path
                        fill="currentColor"
                        d="M502.42 240.5l-94.7-47.3 33.5-100.4c4.5-13.6-8.4-26.5-21.9-21.9l-100.4 33.5-47.41-94.8a17.31 17.31 0 0 0-31 0l-47.3 94.7L92.7 70.8c-13.6-4.5-26.5 8.4-21.9 21.9l33.5 100.4-94.7 47.4a17.31 17.31 0 0 0 0 31l94.7 47.3-33.5 100.5c-4.5 13.6 8.4 26.5 21.9 21.9l100.41-33.5 47.3 94.7a17.31 17.31 0 0 0 31 0l47.31-94.7 100.4 33.5c13.6 4.5 26.5-8.4 21.9-21.9l-33.5-100.4 94.7-47.3a17.33 17.33 0 0 0 .2-31.1zm-155.9 106c-49.91 49.9-131.11 49.9-181 0a128.13 128.13 0 0 1 0-181c49.9-49.9 131.1-49.9 181 0a128.13 128.13 0 0 1 0 181z"
                        class="fa-secondary"
                        ></path>
                    <path
                        fill="currentColor"
                        d="M352 256a96 96 0 1 1-96-96 96.15 96.15 0 0 1 96 96z"
                        class="fa-primary"
                        ></path>
                    </g>
                    </svg>

                    <svg
                        class="theme-icon"
                        id="solarIcon"
                        aria-hidden="true"
                        focusable="false"
                        data-prefix="fad"
                        data-icon="sunglasses"
                        role="img"
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 576 512"
                        class="svg-inline--fa fa-sunglasses fa-w-18 fa-7x"
                        >
                    <g class="fa-group">
                    <path
                        fill="currentColor"
                        d="M574.09 280.38L528.75 98.66a87.94 87.94 0 0 0-113.19-62.14l-15.25 5.08a16 16 0 0 0-10.12 20.25L395.25 77a16 16 0 0 0 20.22 10.13l13.19-4.39c10.87-3.63 23-3.57 33.15 1.73a39.59 39.59 0 0 1 20.38 25.81l38.47 153.83a276.7 276.7 0 0 0-81.22-12.47c-34.75 0-74 7-114.85 26.75h-73.18c-40.85-19.75-80.07-26.75-114.85-26.75a276.75 276.75 0 0 0-81.22 12.45l38.47-153.8a39.61 39.61 0 0 1 20.38-25.82c10.15-5.29 22.28-5.34 33.15-1.73l13.16 4.39A16 16 0 0 0 180.75 77l5.06-15.19a16 16 0 0 0-10.12-20.21l-15.25-5.08A87.95 87.95 0 0 0 47.25 98.65L1.91 280.38A75.35 75.35 0 0 0 0 295.86v70.25C0 429 51.59 480 115.19 480h37.12c60.28 0 110.38-45.94 114.88-105.37l2.93-38.63h35.76l2.93 38.63c4.5 59.43 54.6 105.37 114.88 105.37h37.12C524.41 480 576 429 576 366.13v-70.25a62.67 62.67 0 0 0-1.91-15.5zM203.38 369.8c-2 25.9-24.41 46.2-51.07 46.2h-37.12C87 416 64 393.63 64 366.11v-37.55a217.35 217.35 0 0 1 72.59-12.9 196.51 196.51 0 0 1 69.91 12.9zM512 366.13c0 27.5-23 49.87-51.19 49.87h-37.12c-26.69 0-49.1-20.3-51.07-46.2l-3.12-41.24a196.55 196.55 0 0 1 69.94-12.9A217.41 217.41 0 0 1 512 328.58z"
                        class="fa-secondary"
                        ></path>
                    <path
                        fill="currentColor"
                        d="M64.19 367.9c0-.61-.19-1.18-.19-1.8 0 27.53 23 49.9 51.19 49.9h37.12c26.66 0 49.1-20.3 51.07-46.2l3.12-41.24c-14-5.29-28.31-8.38-42.78-10.42zm404-50l-95.83 47.91.3 4c2 25.9 24.38 46.2 51.07 46.2h37.12C489 416 512 393.63 512 366.13v-37.55a227.76 227.76 0 0 0-43.85-10.66z"
                        class="fa-primary"
                        ></path>
                    </g>
                    </svg>
                    <span class="link-text">Themify</span>
                </a>
            </li>
        </ul>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </nav>

    <button id="scrollToTopBtn" onclick="scrollToTop()"><i class="fas fa-angle-double-up"></i></button>
    <script>

        var scrollToTopBtn = document.getElementById("scrollToTopBtn");

        window.onscroll = function () {
            scrollFunction();
        };

        function scrollFunction() {
            if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
                scrollToTopBtn.style.display = "block";
            } else {
                scrollToTopBtn.style.display = "none";
            }
        }

// When the user clicks on the button, scroll to the top of the document
        function scrollToTop() {
            var currentPosition = document.documentElement.scrollTop || document.body.scrollTop;

            if (currentPosition > 0) {
                window.requestAnimationFrame(scrollToTop);
                window.scrollTo(0, currentPosition - currentPosition / 10);
            }
        }

        function scrollToBot() {
            var currentPosition = document.documentElement.scrollTop || document.body.scrollTop;

            if (currentPosition < 100) {
                window.requestAnimationFrame(scrollToBot);
                window.scrollTo(100, currentPosition - currentPosition / 10);
            }
        }

    </script>

