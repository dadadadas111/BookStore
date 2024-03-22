/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.channels.FileChannel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.User;
import model.UserDetail;

/**
 *
 * @author asus
 */
public class UserDAO extends DBContext {

    public ArrayList<User> getAllUsers() {
        ArrayList users = new ArrayList<User>();
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Users");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String passwordHash = rs.getString(3);
                String email = rs.getString(4);
                String role = rs.getString(5);
                String RegistrationDate = rs.getString(6);

                users.add(new User(id, name, passwordHash, email, role, RegistrationDate));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return users;
    }

    public User getUser(int id) {
        User user = null;
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Users where userid = ?");
            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {

                String name = rs.getString(2);
                String passwordHash = rs.getString(3);
                String email = rs.getString(4);
                String role = rs.getString(5);
                String RegistrationDate = rs.getString(6);

                user = new User(id, name, passwordHash, email, role, RegistrationDate);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return user;
    }

    public User getUserByEmail(String email) {
        User user = null;
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Users where email = ?");
            stmt.setString(1, email);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {

                int id = rs.getInt(1);
                String name = rs.getString(2);
                String passwordHash = rs.getString(3);
                //String email = rs.getString(4);
                String role = rs.getString(5);
                String RegistrationDate = rs.getString(6);

                user = new User(id, name, passwordHash, email, role, RegistrationDate);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return user;
    }
    public User getUserByUsername(String username) {
        User user = null;
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Users where username = ?");
            stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {

                int id = rs.getInt(1);
                //String name = rs.getString(2);
                String passwordHash = rs.getString(3);
                String email = rs.getString(4);
                String role = rs.getString(5);
                String RegistrationDate = rs.getString(6);

                user = new User(id, username, passwordHash, email, role, RegistrationDate);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return user;
    }

    public User createUser(String username, String email, String passwordHash, String role) {
        User user = null;
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO Users (username, email, passwordHash, role) values (?, ?, ?, ?)");
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, passwordHash);
            stmt.setString(4, role);

            stmt.executeUpdate();

            user = getUserByEmail(email);
            createUserDetails(user.getId());

            
            FileChannel src
                    = new FileInputStream(
                            "D:\\learning_material\\PRJ301\\Project\\web\\image\\OIP.jpg")
                            .getChannel();
            FileChannel dest
                    = new FileOutputStream(
                            "D:\\learning_material\\PRJ301\\Project\\web\\image\\user" + user.getId() + ".jpg")
                            .getChannel();

            dest.transferFrom(src, 0, src.size());

            src.close();
            

        } catch (Exception e) {
            System.out.println(e);
        }
        return user;
    }

    public void createUserDetails(int userId) {
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO UserDetails (userid) values (?)");
            stmt.setInt(1, userId);

            stmt.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public UserDetail getUserDetail(int id) {
        UserDetail user = null;
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM UserDetails where userid = ?");
            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {

                String fullName = rs.getString(2);
                String gender = rs.getString(3);
                String phoneNumber = rs.getString(4);
                int NumberOfOrders = rs.getInt(5);
                int BooksBought = rs.getInt(6);
                int NumberOfReviews = rs.getInt(7);

                user = new UserDetail(id, fullName, gender, phoneNumber, NumberOfOrders, BooksBought, NumberOfReviews);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return user;
    }

    public void updateUserDetail(int userID, String fullName, String phoneNumber, String gender) {
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("UPDATE UserDetails SET fullname = ?, phonenumber = ?, gender = ? where userid = ?");
            stmt.setString(1, fullName);
            stmt.setString(2, phoneNumber);
            stmt.setString(3, gender);
            stmt.setInt(4, userID);
            
            

            stmt.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public User changeUserPassword(int userID, String newPassword){
        User user = null;
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("UPDATE Users SET passwordHash = ? where userid = ?");
            stmt.setString(1, HashedPassword.getHashedPassword(newPassword));
            
            stmt.setInt(2, userID);
            stmt.executeUpdate();
            
            user = getUser(userID);
            

        } catch (Exception e) {
            System.out.println(e);
        }
        
        return user;
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        // dao.createUserDetails(1);
        System.out.println(dao.getUserDetail(12));
    }
}
