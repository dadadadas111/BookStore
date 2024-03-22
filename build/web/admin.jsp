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
        <title>Admin Page</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="style/bookdetail.css">
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
        <main class="container mt-5">
            <h2>Admin Panel</h2>
            <div class="row mt-4">
                <div class="col-md-12">
                    <br>
                    <h2 class="col-md-12">Book Action</h2>
                </div>

                <!-- Add Book -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Add Book</h5>
                            <p class="card-text">Add a new book to the inventory.</p>
                            <a class="btn btn-primary" onclick="showForm('add-book')" >Go</a>
                        </div>
                    </div>
                </div>

                <!-- Delete Book -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Delete Book</h5>
                            <p class="card-text">Remove a book from the inventory.</p>
                            <a onclick="showForm('delete-book')" class="btn btn-danger">Go</a>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Update Book</h5>
                            <p class="card-text">Update a book from the inventory.</p>
                            <a onclick="showForm('update-book')" class="btn btn-warning">Go</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <br>
                    <h2 class="col-md-12">Information Action</h2>
                </div>

                <!-- Add Category -->
                <div class="col-md-4 mt-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Add Category</h5>
                            <p class="card-text">Add a new category for books.</p>
                            <a onclick="showForm('add-category')" class="btn btn-primary">Go</a>
                        </div>
                    </div>
                </div>

                <!-- Add Author -->
                <div class="col-md-4 mt-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Add Author</h5>
                            <p class="card-text">Add a new author for books.</p>
                            <a onclick="showForm('add-author')" class="btn btn-primary">Go</a>
                        </div>
                    </div>
                </div>

                <!-- Add Publisher -->
                <div class="col-md-4 mt-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Add Publisher</h5>
                            <p class="card-text">Add a new publisher for books.</p>
                            <a onclick="showForm('add-publisher')" class="btn btn-primary">Go</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <br>
                    <h2 class="col-md-12">Order Action</h2>
                </div>

                <!-- View Orders -->
                <div class="col-md-4 mt-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">View Orders</h5>
                            <p class="card-text">View a list of orders.</p>
                            <a target="_blank" href="/Project/order?view=admin" class="btn btn-info">Go</a>
                        </div>
                    </div>
                </div>
            </div>

            <br><!-- comment -->
            <br><!-- comment -->
            <br><!-- comment -->
            <br><!-- comment -->


            <form action="admin" method="post" class="row form" id="add-book" style="display:none;"  enctype="multipart/form-data">
                <input type="text" name="action" value="add-book" hidden>

                <h2 class="col-md-12">Add Book</h2>
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="title">Title:</label>
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>
                    <div class="form-group">
                        <label for="author">Author:</label>
                        <select class="form-control" name="author" id="author">
                            <c:forEach items="${requestScope.Authors}" var="c">
                                <option value="${c.getAuthorID()}" ${requestScope.author == c.getAuthorID() ? "selected" : "" }>${c.getAuthorName()}</option>
                            </c:forEach>

                        </select>
                    </div>
                    <div class="form-group">
                        <label for="publisher">Publisher:</label>
                        <select class="form-control" name="publisher" id="publisher">

                            <c:forEach items="${requestScope.Publishers}" var="c">
                                <option value="${c.getPublisherID()}" ${requestScope.publisher == c.getPublisherID() ? "selected" : "" } >${c.getPublisherName()}</option>
                            </c:forEach>
                            <!-- Add more authors as needed -->
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="category">Category:</label>
                        <select class="form-control" name="category" id="category">

                            <c:forEach items="${requestScope.Categories}" var="c">
                                <option value="${c.getCategoryID()}" ${requestScope.category == c.getCategoryID() ? "selected" : "" }>${c.getCategoryName()}</option>
                            </c:forEach>
                            <!-- Add more authors as needed -->
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="releaseDate">Release Date:</label>
                        <input type="date" class="form-control" id="releaseDate" name="releaseDate" required>
                    </div>
                    <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="number" class="form-control" id="price" name="price" min="1" required>
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity:</label>
                        <input type="number" class="form-control" id="quantity" name="quantity" min="1" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Add Book</button>
                </div>

                <div class="col-md-4">
                    <div class="profile-img-container">
                        <img id="image" src="image/book-cover.jpg" alt="Book Cover" class="img-fluid rounded shadow">

                    </div>
                    <!-- Edit Profile Image Button -->
                    <label for="files" class="btn btn-primary mt-3">Edit Book Cover</label>


                    <input hidden name="upload" accept="image/*" type="file" id="files" />
                    <input hidden type="text" value="none" id="check" name="check">
                </div>

            </form>

            <form action="admin" method="post" class="row form" id="delete-book" style="display:none;" >
                <input type="text" name="action" value="delete-book" hidden>

                <h2 class="col-md-12">Delete Book</h2>
                <p class="col-md-12" >(Should be used to delete book that nobody buy only)</p>
                
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="title">BookID to Delete</label>
                        <input type="number" class="form-control" id="title" name="id" required>
                        <br><!-- comment -->
                        <input class="btn btn-danger" type="submit" value="Delete">
                    </div>
                </div>
            </form>
            
            <form action="admin" target="_blank" method="post" class="row form" id="update-book" style="display:none;" >
                <input type="text" name="action" value="update-book" hidden>

                <h2 class="col-md-12">Update Book</h2>
                
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="title">BookID to Update</label>
                        <input type="number" class="form-control" id="title" name="id" required>
                        <br><!-- comment -->
                        <input class="btn btn-warning" type="submit" value="Update">
                    </div>
                </div>
            </form>
            
            
            <form action="admin" method="post" class="row form" id="add-category" style="display:none;" >
                <input type="text" name="action" value="add-category" hidden>

                <h2 class="col-md-12">Add new Category</h2>
                <p class="col-md-12" >(Should add category with distinct name)</p>
                
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="title">Category name</label>
                        <input type="text" class="form-control" id="title" name="info" required>
                        <br><!-- comment -->
                        <input class="btn btn-info" type="submit" value="Add">
                    </div>
                </div>
            </form>
            
            <form action="admin" method="post" class="row form" id="add-author" style="display:none;" >
                <input type="text" name="action" value="add-author" hidden>

                <h2 class="col-md-12">Add new author</h2>
                <p class="col-md-12" >(Should add author with distinct name)</p>
                
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="title">Author name</label>
                        <input type="text" class="form-control" id="title" name="info" required>
                        <br><!-- comment -->
                        <input class="btn btn-info" type="submit" value="Add">
                    </div>
                </div>
            </form>
            
            <form action="admin" method="post" class="row form" id="add-publisher" style="display:none;" >
                <input type="text" name="action" value="add-publisher" hidden>

                <h2 class="col-md-12">Add new publisher</h2>
                <p class="col-md-12" >(Should add publisher with distinct name)</p>
                
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="title">Publisher name</label>
                        <input type="text" class="form-control" id="title" name="info" required>
                        <br><!-- comment -->
                        <input class="btn btn-info" type="submit" value="Add">
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
        <script>

                                function showForm(id) {
                                    hideForm()
                                    const form = document.getElementById(id);
                                    form.style.display = "flex";

                                    scrollToBot();

                                }

                                function scrollToBot() {
                                    window.scrollTo({
                                        top: document.body.scrollHeight,
                                        behavior: 'smooth'
                                    });
                                }
                                
                                function hideForm(){
                                    const form = document.querySelectorAll("form");
                                    
                                    for( let i = 0; i < form.length; i++){
                                        form[i].style.display = "none";
                                    }
                                    
                                }


                                document.getElementById('files').onchange = function () {
                                    var src = URL.createObjectURL(this.files[0])
                                    document.getElementById('image').src = src
                                    console.log(document.getElementById('path'))
                                    console.log(src)
                                    document.getElementById("check").value = "ok";
                                    console.log('check', document.getElementById("check").value)
                                }

        </script>

    </body>

</html>

