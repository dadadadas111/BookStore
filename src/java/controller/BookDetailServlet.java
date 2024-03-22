package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dal.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;
import model.User;

public class BookDetailServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int bookId = Integer.parseInt(request.getParameter("id"));
            String view = request.getParameter("view");
            User user = (User) request.getSession().getAttribute("user");

            Book book = (new BookDAO()).get(bookId);

            request.setAttribute("book", book);

            if (user != null && "admin".equals(user.getRole()) && "admin".equals(view)) {

                request.setAttribute("page", "admin");

                request.getRequestDispatcher("admin_book.jsp").forward(request, response);

            } else if (user != null && "admin".equals(user.getRole()) && "update".equals(view)) {
                
                int price = Integer.parseInt(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                
                BookDAO dao = new BookDAO();
                
                dao.updateBook(bookId, price, quantity);
                
                
                
                response.sendRedirect("/Project/book-detail?id=" + bookId);
                
                
                
            } else {
                request.setAttribute("page", "books");
                BookDAO dao = new BookDAO();
                
                if (user != null ){
                    boolean canReview = dao.canReview(bookId, user.getId());
                    request.setAttribute("canReview", canReview);
                }

                request.getRequestDispatcher("book-detail.jsp").forward(request, response);
            }

        } catch (Exception e) {
            System.out.println(e);
            response.sendRedirect("/Project/books");

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String comment = request.getParameter("comment");
        String rating = request.getParameter("rating");

        if (comment != null) {
            User user = (User) request.getSession().getAttribute("user");
            if (user == null) {
                response.sendRedirect("/Project/login");
            }

            int bookId = Integer.parseInt(request.getParameter("id"));

            int rating_num = Integer.parseInt(rating);
            (new BookDAO()).addComment(bookId, user.getId(), rating_num, comment);

            response.sendRedirect("/Project/book-detail?id=" + bookId);
        } else {
            processRequest(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
