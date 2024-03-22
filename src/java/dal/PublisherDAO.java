/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Publisher;
/**
 *
 * @author asus
 */
public class PublisherDAO extends DBContext {
    
    public ArrayList<Publisher> getAll() {
        ArrayList list = new ArrayList<Publisher>();
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Publishers order by publishername");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                list.add(new Publisher(id, name));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Publisher getPublisher(int id) {
        Publisher object = null;
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Publishers where Publisherid = ?");
            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {

                String name = rs.getString(2);
                

                object = new Publisher(id, name);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return object;
    }
    
    public Publisher getPublisher(String name) {
        Publisher object = null;
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Publishers where Publishername = ?");
            stmt.setString(1, name);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {

                int id = rs.getInt(1);
                

                object = new Publisher(id, name);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return object;
    }
    
    public void addPublisher(String name){
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("insert into Publishers values ( ? )");
            stmt.setString(1, name);

            stmt.executeUpdate();
            
            

        } catch (Exception e) {
            System.out.println(e);
        }
 
    }
}
