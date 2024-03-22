/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.HashedPassword;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

public class AuthenticationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("logout")) {
            request.getSession().invalidate();
            response.sendRedirect("/Project/home");
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uname = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordHashed = HashedPassword.getHashedPassword(password);

        UserDAO dao = new UserDAO();

        User u = dao.getUserByEmail(uname);
        
        if (u == null){
            u = dao.getUserByUsername(uname);
        }

        if (u == null) {
            request.setAttribute("isWrongEmail", true);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (!u.getPasswordHash().equals(passwordHashed)) {
                request.setAttribute("isWrongPassword", true);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("user", u);

                response.sendRedirect("/Project/home");
            }

        }

    }
    
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
