/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import model.User;

@MultipartConfig
public class ProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("/Project/login");
        } else {
            UserDAO dao = new UserDAO();
            request.setAttribute("userDetail", dao.getUserDetail(user.getId()));
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("page", "profile");
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        Part filePart = request.getPart("upload");
        String check = request.getParameter("check");

        if (filePart != null && check.equals("ok")) {
 
            System.out.println("file part is " + filePart);

            String fileName = "user" + user.getId() + ".jpg";
            System.out.println("file name is " + fileName);

            String uploadDir = "D:\\learning_material\\PRJ301\\Project\\web\\image";

            // Create the directory if it doesn't exist
            Path uploadPath = Path.of(uploadDir);
            System.out.println("upload path is " + uploadPath);

            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            Path filePath = uploadPath.resolve(fileName);
            
            File file = new File(filePath.toAbsolutePath().toString());
            
            if (file.exists()){
                file.delete();
            }

            System.out.println(filePath.toAbsolutePath().toString());
            
            filePart.write(filePath.toAbsolutePath().toString());
            // Copy the file content from the input stream to the local file
            
        }

        String fullName = request.getParameter("fullname");
        String phoneNumber = request.getParameter("phonenumber");
        String gender = request.getParameter("gender");

        UserDAO dao = new UserDAO();

        dao.updateUserDetail(user.getId(), fullName, phoneNumber, gender);
        response.sendRedirect("/Project/profile");

    }

}
