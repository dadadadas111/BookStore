/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Book;

public class HomeServlet extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.setAttribute("page", "home");
        
        BookDAO dao = new BookDAO();
        
        List<Book> newBooks = dao.getFilteredBook("%%", "%%", "%%", "%%", "New", 0, 4);
        List<Book> hotBooks = dao.getFilteredBook("%%", "%%", "%%", "%%", "High Rated", 0, 4);
        List<Book> popularBooks = dao.getFilteredBook("%%", "%%", "%%", "%%", "Popular", 0, 4);
        
        
        request.setAttribute("newBooks", newBooks);
        request.setAttribute("hotBooks", hotBooks);
        request.setAttribute("popularBooks", popularBooks);
        
        request.getRequestDispatcher("home.jsp").forward(request, response);
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
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
