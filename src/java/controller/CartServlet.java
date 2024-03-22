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
import model.CartItem;

public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String raw_bookId = request.getParameter("add-id");
        System.out.println("Book Id is " + raw_bookId);
        BookDAO dao = new BookDAO();

        if (raw_bookId != null && raw_bookId.length() > 0) {
            int bookId = Integer.parseInt(raw_bookId);

            ArrayList<CartItem> cart = (ArrayList<CartItem>) request.getSession().getAttribute("cart");

            if (cart == null) {
                cart = new ArrayList<>();
            }

            request.getSession().removeAttribute("cart");
            boolean added = false;
            //System.out.println("cart is ");
            for (CartItem cartItem : cart) {
          
                if (cartItem.getBook().getBookID() == bookId) {
                    added = true;

                    int quantity = cartItem.getQuantity() + 1;

                    if (quantity > cartItem.getBook().getQuantity()) {
                        response.sendRedirect("/Project/home");
                    } else {
                        cartItem.setQuantity(quantity);
                    }
                }

            }

            if (added == false) {
                cart.add(new CartItem(dao.get(bookId), 1));
            }
            request.getSession().setAttribute("cart", cart);

        }
        
        
        
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String remove = request.getParameter("remove");
        if (remove != null) {
            int id = Integer.parseInt(remove);
            ArrayList<CartItem> cart = (ArrayList<CartItem>) request.getSession().getAttribute("cart");
            if (cart == null) {
                processRequest(request, response);
            } else {
                for (CartItem cartItem : cart) {
                    if (cartItem.getBook().getBookID() == id) {
                        cart.remove(cartItem);
                        request.getSession().setAttribute("cart", cart);
                        processRequest(request, response);
                    }
                }

            }
        }

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
