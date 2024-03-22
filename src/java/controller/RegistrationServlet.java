/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.HashedPassword;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet(name = "SignupController", urlPatterns = {"/signup"})
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("confirm-password");
        String passwordHashed = HashedPassword.getHashedPassword(password);

        UserDAO dao = new UserDAO();

        User u = dao.getUserByEmail(email);

        if (u != null) {
            request.setAttribute("isExistedEmail", true);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {

            u = dao.getUserByUsername(username);
            if (u != null) {
                request.setAttribute("isExistedUsername", true);
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } else if (!cpassword.equals(password)) {
                request.setAttribute("isWrongConfirmPassword", true);
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } else {

                u = dao.createUser(username, email, passwordHashed, "customer");

                HttpSession session = request.getSession();
                session.setAttribute("user", u);

                response.sendRedirect("/Project/home");
            }
        }
    }
}
