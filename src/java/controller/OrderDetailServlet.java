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
import model.OrderDetail;

public class OrderDetailServlet extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        
        String id = request.getParameter("id");
        
        
        OrderDAO dao = new OrderDAO();
        
        try {
            Order order = dao.get(Integer.parseInt(id));
            ArrayList<OrderDetail> order_detail = dao.getOrderDetails(Integer.parseInt(id));
            
            System.out.println(order_detail);
            request.setAttribute("order", order);
            request.setAttribute("list", order_detail);
            
            
            
        } catch (Exception e) {
            response.sendRedirect("/Project/home");
        }
        
        
        
        
        
        request.getRequestDispatcher("order-detail.jsp").forward(request, response);
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.setAttribute("page", "order-detail");
        
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.setAttribute("page", "admin");
        
        String status = request.getParameter("status");
        String id = request.getParameter("id");
        
        try {
            int s = Integer.parseInt(status);
            int i = Integer.parseInt(id);
            
            OrderDAO dao = new OrderDAO();
            
            dao.updateStatus(i, s);
            
            response.sendRedirect("/Project/order?view=admin");
            
        } catch (Exception e) {
        }
        
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
