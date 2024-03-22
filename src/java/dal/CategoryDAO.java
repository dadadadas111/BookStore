/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Category;

/**
 *
 * @author asus
 */
public class CategoryDAO extends DBContext {

    public ArrayList<Category> getAll() {
        ArrayList list = new ArrayList<Category>();
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Categories order by categoryname");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                list.add(new Category(id, name));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Category> getCategoryByBookId(int bookId) {
        ArrayList list = new ArrayList<Category>();
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("select * \n"
                    + "from Categories join BookCategories\n"
                    + "on Categories.CategoryID = BookCategories.CategoryID\n"
                    + "where BookID = ?");
            
            stmt.setInt(1, bookId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                list.add(new Category(id, name));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Category getCategory(int id) {
        Category object = null;
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM categories where categoryid = ?");
            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {

                String name = rs.getString(2);

                object = new Category(id, name);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return object;
    }

    public Category getCategory(String name) {
        Category object = null;
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM categories where categoryname = ?");
            stmt.setString(1, name);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {

                int id = rs.getInt(1);

                object = new Category(id, name);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return object;
    }

    public void addCategory(String name) {
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("insert into categories values ( ? )");
            stmt.setString(1, name);

            stmt.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public static void main(String[] args) {

        System.out.println((new CategoryDAO()).getCategory("comedy"));
    }
}
