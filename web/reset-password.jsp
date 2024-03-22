<%-- 
    Document   : login
    Created on : Feb 6, 2024, 4:04:09 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reset Password</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!-- Custom styles -->
        <link rel="stylesheet" href="./style/style.css"/>
        <link rel="stylesheet" href="./style/loginstyle.css"/>
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

        <div id="blob"></div>
        <div id="blur">
            <div class="container">
                <div class="d-flex justify-content-center h-100">
                    <div class="card">
                        <div class="card-header">
                            <h3>Reset Password</h3>
                        </div>
                        <div class="card-body">
                            <c:if test="${requestScope.done == null}" >
                                <form action="reset-password" method="post">
                                    <div class="input-group form-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                                        </div>
                                        <input name="email" type="text" class="form-control" placeholder="email" value="${sessionScope.email}" required>

                                    </div>
                                    <c:if test="${sessionScope.code == null}"  >
                                        <% if (request.getAttribute("notExistEmail") != null) { %>
                                        <p style="color:red"> Email not existed. Try again.</p>
                                        <% } %>
                                        <div class="form-group">

                                            <input  type="submit" value="Send" class="btn float-right login_btn">
                                            <br><!-- comment -->
                                            <br><!-- comment -->

                                        </div>
                                    </c:if>

                                    <c:if test="${sessionScope.code != null}"  >
                                        <div class="input-group form-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                                            </div>

                                            <input name="code" type="text" class="form-control" placeholder="Reset code" required>

                                        </div>
                                        <div class="input-group form-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                            </div>
                                            <input name="password" type="password" class="form-control" placeholder="new password" required>

                                        </div>

                                        <% if (request.getAttribute("isWrongCode") != null) { %>
                                        <p style="color:red"> Incorrect reset code. Try again.</p>
                                        <% } %>

                                        <div class="form-group">

                                            <input  type="submit" value="Change" class="btn float-right login_btn">
                                        </div>
                                    </c:if>

                                </form>
                            </c:if>
                            <c:if test="${requestScope.done != null}">
                                <div class="d-flex justify-content-center links">
                                    RESET PASSWORD SUCCESSFULLY. 
                                </div>
                                <div class="form-group">

                                    <button class="btn float-right login_btn"><a href="/Project/login">Log in</a></button>
                                </div>
                            </c:if>

                        </div>
                        <div class="card-footer">
                            <div class="d-flex justify-content-center links">
                                Don't have an account?<a href="/Project/signup">Sign Up</a>
                            </div>
                            <div class="d-flex justify-content-center">
                                Already have an account?<a href="/Project/login">Log in</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

        <script src="./style/login.js" ></script>
        <script src="./style/script.js" ></script>

    </body>

</html>

