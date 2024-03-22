<%-- 
    Document   : home
    Created on : Feb 5, 2024, 4:42:30 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>User Profile</title>
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
    <link rel="stylesheet" href="style/profile.css"/>
    <script src="style/profile.js"></script>
    <form action="profile" method="post"  enctype="multipart/form-data" >
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-12 text-center">
                    <!-- Profile Picture Container -->
                    <div class="profile-img-container">
                        <img id="image" src="image/user${sessionScope.user.getId()}.jpg" alt="User Image">

                    </div>
                    <!-- Edit Profile Image Button -->
                    <label for="files" class="btn btn-primary mt-3">Edit Profile Image</label>


                    <input hidden name="upload" accept="image/*" type="file" id="files" />
                    <input hidden type="text" value="none" id="check" name="check">

                </div>
            </div>
            <div class="container mt-5">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <!-- User Information Section -->
                        <h2><input type="text" name="fullname" value="${requestScope.userDetail.getFullName()}"></h2>

                        <br><br><!-- comment -->
                        <div class="row text-left">
                            <!-- Left Column -->
                            <div class="col-md-6">
                                <table color="black">
                                    <tr>
                                        <td><p><strong>Username: </strong></p></td>
                                        <td><p><input type="text" name="username" value="${sessionScope.user.getUsername()}" disabled></p></td>
                                    </tr>
                                    <tr>

                                        <td><p><strong>Email:</strong></p></td>
                                        <td><p><input type="email" name="email" value="${sessionScope.user.getEmail()}" disabled></p></td>
                                    </tr>
                                    <tr>
                                        <td><p><strong>Phone Number:</strong></p></td>
                                        <td><p><input type="number" name="phonenumber" value="${requestScope.userDetail.getPhoneNumber()}"></p></td>
                                    </tr>
                                    <tr>
                                        <td><p><strong>Gender:</strong></p></td>
                                        <td><p><select name="gender">

                                                    <option value="male"  ${requestScope.userDetail.getGender().equals("male") ? "selected" : "" }>Male</option>
                                                    <option value="female" ${requestScope.userDetail.getGender().equals("female") ? "selected" : "" }>Female</option>
                                                    <option value="other" ${requestScope.userDetail.getGender().equals("other") ? "selected" : "" }>Other</option>

                                                </select></p></td>
                                    </tr>
                                </table>


                                <p> </p>
                            </div>

                            <!-- Right Column -->
                            <div class="col-md-6">

                                <p><strong>Registered Year:</strong> ${sessionScope.user.getRegistrationDate().substring(0,10)}</p>
                                <p><strong>Number of Orders:</strong> ${requestScope.userDetail.getNumberOfOrders()}</p>
                                <p><strong>Books Bought:</strong> ${requestScope.userDetail.getBooksBought()}</p>
                                <p><strong>Number of Reviews:</strong> ${requestScope.userDetail.getNumberOfReviews()}</p>
                            </div>
                        </div>

                        <!-- Edit Profile Button -->
                        <input type="submit" name="submit" value="Save" class="btn btn-primary mt-3">
                    </div>
                </div>
            </div>

        </div>
    </form>
</main>
<script src="style/script.js"></script>



<%@ include file="pages/footer.jsp" %>

