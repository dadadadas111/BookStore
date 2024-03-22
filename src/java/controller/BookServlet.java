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
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Book;

public class BookServlet extends HttpServlet {
    
    private String sort;
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String raw_index = request.getParameter("index");
        int index = 1;
        sort = request.getParameter("sort") != null ? request.getParameter("sort"): sort; 
      
        
        if (category != null && !"%%".equals(category)){
            request.setAttribute("category", Integer.valueOf(category));
        }
        if (author != null && !"%%".equals(author)){
            request.setAttribute("author", Integer.valueOf(author));
        }
        if (publisher != null && !"%%".equals(publisher)){
            request.setAttribute("publisher", Integer.valueOf(publisher));
        }
        if (raw_index != null){
            index = Integer.parseInt(raw_index);
        }
        
        request.setAttribute("name", name);
        
        category = category == null ? "%%": category;
        author = author == null ? "%%": author;
        publisher = publisher == null ? "%%": publisher;
        name = name == null ? "%%": name;
        
        
        request.setAttribute("sort", sort);
        
        
        
        
        BookDAO dao = new BookDAO();
        List<Book> list = dao.getFilteredBook(name, author, publisher, category, sort, 6 *(index-1), 6);
        List<Book> realList = dao.getFilteredBook(name, author, publisher, category, sort, 0, 1000);
        
        
        request.setAttribute("size", realList.size());
        request.setAttribute("books", list);
        request.setAttribute("index", index);
        
        
               
        request.setAttribute("page", "books");       
        request.setAttribute("Categories", (new CategoryDAO()).getAll());
        request.setAttribute("Authors", (new AuthorDAO()).getAll());
        request.setAttribute("Publishers", (new PublisherDAO()).getAll());
        
        request.getRequestDispatcher("books.jsp").forward(request, response);
        
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
