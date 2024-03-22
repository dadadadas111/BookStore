/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Author;

/**
 *
 * @author asus
 */
public class AuthorDAO extends DBContext {
    public ArrayList<Author> getAll() {
        ArrayList list = new ArrayList<Author>();
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Authors order by authorname");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                list.add(new Author(id, name));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Author getAuthor(int id) {
        Author object = null;
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM authors where authorid = ?");
            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {

                String name = rs.getString(2);
                

                object = new Author(id, name);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return object;
    }
    
    public Author getAuthor(String name) {
        Author object = null;
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM authors where authorname = ?");
            stmt.setString(1, name);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {

                int id = rs.getInt(1);
                

                object = new Author(id, name);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return object;
    }
    
    public void addAuthor(String name){
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("insert into authors values ( ? )");
            stmt.setString(1, name);

            stmt.executeUpdate();
            
            

        } catch (Exception e) {
            System.out.println(e);
        }
 
    }
    
    public static void main(String[] args) {
        AuthorDAO dao = new AuthorDAO();
        for (Author a: dao.getAll()) {
            System.out.println(a);
        }
    }

}
