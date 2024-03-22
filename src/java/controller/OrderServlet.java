/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Order;
import model.User;

public class OrderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        User user = (User) request.getSession().getAttribute("user");
        
        String view = request.getParameter("view");
        
        
        
        if ("admin".equals(view) && user != null && "admin".equals(user.getRole()) ){
            
            OrderDAO dao = new OrderDAO();
            ArrayList<Order> error = dao.getByStatus(0);
            ArrayList<Order> processing = dao.getByStatus(1);
            ArrayList<Order> packing = dao.getByStatus(2);
            ArrayList<Order> shipping = dao.getByStatus(3);
            ArrayList<Order> finished = dao.getByStatus(4);
            ArrayList month = dao.countOrdersInMonth();
            ArrayList week = dao.countOrdersInWeek();
            ArrayList year = dao.countOrdersInYear();
            
            request.setAttribute("error", error); 
            request.setAttribute("processing", processing); 
            request.setAttribute("packing", packing); 
            request.setAttribute("shipping", shipping); 
            request.setAttribute("finished", finished); 
            request.setAttribute("chartMonth", month); 
            request.setAttribute("chartWeek", week); 
            request.setAttribute("chartYear", year); 
            
            
            
            request.getRequestDispatcher("admin_order.jsp").forward(request, response);
        }

        request.setAttribute("page", "order");


        OrderDAO dao = new OrderDAO();

        if (user != null) {
            
            ArrayList<Order> list = dao.getByUser(user.getId());

            request.setAttribute("orders", list);
        }

        request.getRequestDispatcher("order.jsp").forward(request, response);
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
