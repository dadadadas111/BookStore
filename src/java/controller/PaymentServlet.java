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
import model.CartItem;
import model.User;

public class PaymentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<CartItem> cart = (ArrayList<CartItem>) request.getSession().getAttribute("cart");

        int total = 0;

        if (cart != null) {
            for (CartItem c : cart) {
                int quantity = Integer.parseInt(request.getParameter("item" + c.getBook().getBookID() ));               
                c.setQuantity(quantity);
                
                
                total += c.getBook().getPrice() * c.getQuantity();
            }
        }

        request.setAttribute("order_total", total);
        request.setAttribute("page", "checkout");
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String zip = request.getParameter("zip");
        String state = request.getParameter("state");
        String county = request.getParameter("county");
        String country = request.getParameter("country");
        
        OrderDAO dao = new OrderDAO();
        
        User user = (User)request.getSession().getAttribute("user");
        ArrayList<CartItem> cart = (ArrayList<CartItem>) request.getSession().getAttribute("cart");

        
        if (user != null && cart != null){
            dao.addOrder(user.getId());
            
            int orderId = dao.getLast().getOrderID();
            
            for (CartItem cartItem : cart) {
                int bookId = cartItem.getBook().getBookID();
                int quantity = cartItem.getQuantity();
                int price = cartItem.getBook().getPrice();
                
                dao.addOrderDetail(orderId, bookId, quantity, price);
            }
            System.out.println("street is " + street);
            System.out.println("city is " + city);
            System.out.println("zip is " + zip);
            System.out.println("state is " + state);
            System.out.println("county is " + county);
            System.out.println("country is " + country);
            
            dao.updateAddress(orderId, street, city, zip, state, county, country);
            
            request.getSession().removeAttribute("cart");
            
            response.sendRedirect("/Project/order");
            
            
        }
        
        
        
        response.sendRedirect("/Project/order");
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
