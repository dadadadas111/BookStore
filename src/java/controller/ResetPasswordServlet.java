/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import model.User;

public class ResetPasswordServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("reset-password.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().invalidate();
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getSession().getAttribute("code") != null) {
            String email = (String) request.getSession().getAttribute("email");
            System.out.println("email is " + email);
            User user = (new UserDAO()).getUserByEmail(email);
            
            
            int userID = user.getId();
            String code = request.getParameter("code");
            String password = request.getParameter("password");

            if (code.equals((String) (request.getSession().getAttribute("code")))) {
                (new UserDAO()).changeUserPassword(userID, password);
                request.setAttribute("done", true);
                request.getRequestDispatcher("reset-password.jsp").forward(request, response);

            } else {
                request.setAttribute("isWrongCode", true);
                request.getRequestDispatcher("reset-password.jsp").forward(request, response);
            }

        } else {

            String email = request.getParameter("email");

            User user = (new UserDAO()).getUserByEmail(email);
            if (user == null) {
                request.getSession().invalidate();
                request.setAttribute("notExistEmail", true);
                request.getRequestDispatcher("reset-password.jsp").forward(request, response);

            } else {
                request.setAttribute("email", email);
                request.getSession().setAttribute("email", email);
                String code = generateCode();

                request.getSession().setAttribute("code", code);

                response.setContentType("text/html");
                String name = "BookStore Admin";

                String subject = "CODE FOR RESET PASSWORD ";
                String msg = "THIS IS THE CODE TO RESET YOUR PASSWORD: " + code;

                final String username = "long17a4k23@cvp.vn";//your email id
                final String password = "12102004klA";// your password
                Properties props = new Properties();
                props.put("mail.smtp.auth", true);
                props.put("mail.smtp.starttls.enable", true);
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");
                props.put("mail.smtp.ssl.protocols", "TLSv1.2");
                Session session = Session.getInstance(props,
                        new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
                try {
                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(username));
                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                    MimeBodyPart textPart = new MimeBodyPart();
                    Multipart multipart = new MimeMultipart();
                    String final_Text = msg;
                    textPart.setText(final_Text);
                    message.setSubject(subject);
                    multipart.addBodyPart(textPart);
                    message.setContent(multipart);
                    message.setSubject(subject);
                    //out.println("Sending");
                    Transport.send(message);
                    request.getRequestDispatcher("reset-password.jsp").forward(request, response);
                } catch (Exception e) {
                    response.sendRedirect("/Project/home");
                }
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String generateCode() {
        Random rand = new Random();
        int length = rand.nextInt(4, 7);
        String code = "";
        for (int i = 0; i < length; i++) {
            code += '0' + rand.nextInt(0, 9);
        }
        return code;
    }

}
