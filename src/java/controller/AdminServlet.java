/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AuthorDAO;
import dal.BookDAO;
import dal.CategoryDAO;
import dal.PublisherDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import model.Book;
import model.User;

@MultipartConfig
public class AdminServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User u = (User) request.getSession().getAttribute("user");

        if (u == null || !"admin".equals(u.getRole())) {
            response.sendRedirect("/Project/home");
        } else {
            request.setAttribute("page", "admin");

            request.setAttribute("Categories", (new CategoryDAO()).getAll());
            request.setAttribute("Authors", (new AuthorDAO()).getAll());
            request.setAttribute("Publishers", (new PublisherDAO()).getAll());

            request.getRequestDispatcher("admin.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (null != action) {
            switch (action) {
                case "add-book": {
                    String title = request.getParameter("title");
                    String author = request.getParameter("author");
                    String publisher = request.getParameter("publisher");
                    String category = request.getParameter("category");
                    String releaseDate = request.getParameter("releaseDate");
                    String price = request.getParameter("price");
                    String quantity = request.getParameter("quantity");
                    BookDAO dao = new BookDAO();
                    dao.addBook(title, Integer.parseInt(author), Integer.parseInt(publisher), releaseDate, Integer.parseInt(price), Integer.parseInt(quantity));
                    Book book = dao.getLast();
                    dao.addBookCategory(book.getBookID(), Integer.parseInt(category));
                    Part filePart = request.getPart("upload");
                    String check = request.getParameter("check");
                    System.out.println("check is " + check);
                    if (filePart != null && check.equals("ok")) {

                        System.out.println("file part is " + filePart);

                        String fileName = "book" + book.getBookID() + ".jpg";
                        System.out.println("file name is " + fileName);

                        String uploadDir = "D:\\learning_material\\PRJ301\\Project\\web\\image";

                        // Create the directory if it doesn't exist
                        Path uploadPath = Path.of(uploadDir);
                        System.out.println("upload path is " + uploadPath);

                        if (!Files.exists(uploadPath)) {
                            Files.createDirectories(uploadPath);
                        }

                        Path filePath = uploadPath.resolve(fileName);

                        File file = new File(filePath.toAbsolutePath().toString());

                        if (file.exists()) {
                            file.delete();
                        }

                        System.out.println(filePath.toAbsolutePath().toString());

                        filePart.write(filePath.toAbsolutePath().toString());
                        // Copy the file content from the input stream to the local file

                    }
                    response.sendRedirect("/Project/admin");
                    break;
                }
                case "delete-book": {
                    int id = Integer.parseInt(request.getParameter("id"));
                    BookDAO dao = new BookDAO();
                    dao.deleteBook(id);
                    response.sendRedirect("/Project/admin");
                    break;
                }
                
                case "update-book": {
                    int id = Integer.parseInt(request.getParameter("id"));
                    response.sendRedirect("/Project/book-detail?id=" + id + "&view=admin");
                    break;
                }
                case ("add-category"): {
                    String name = request.getParameter("info");
                    CategoryDAO dao = new CategoryDAO();
                    dao.addCategory(name);
                    response.sendRedirect("/Project/admin");
                    break;
                }
                case ("add-author"): {
                    String name = request.getParameter("info");
                    AuthorDAO dao = new AuthorDAO();
                    dao.addAuthor(name);
                    response.sendRedirect("/Project/admin");
                    break;
                }
                case ("add-publisher"): {
                    String name = request.getParameter("info");
                    PublisherDAO dao = new PublisherDAO();
                    dao.addPublisher(name);
                    response.sendRedirect("/Project/admin");
                    break;
                }
                default:
                    break;
            }
        } else {
            processRequest(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
