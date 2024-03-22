/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;
import model.Book;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author asus
 */
public class OrderDAO extends DBContext {

    public ArrayList<Order> getAll() {
        ArrayList list = new ArrayList<>();
        try {
            Connection conn = connection; // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Orders order by orders.orderid ");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                int userId = rs.getInt(2);
                String date = rs.getString(3);

                list.add(new Order(id, userId, date));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Order> getByUser(int UserId) {
        ArrayList list = new ArrayList<>();
        try {
            Connection conn = connection; // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Orders where userid = ? order by orders.orderid ");
            stmt.setInt(1, UserId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                int userId = rs.getInt(2);
                String date = rs.getString(3);

                list.add(new Order(id, userId, date));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Order> getByStatus(int UserId) {
        ArrayList list = new ArrayList<>();
        try {
            Connection conn = connection; // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Orders join orderstatus on orders.orderid = orderstatus.orderid where status = ?  order by orders.orderid");
            stmt.setInt(1, UserId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                int userId = rs.getInt(2);
                String date = rs.getString(3);

                list.add(new Order(id, userId, date));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Order get(int id) {
        Order list = null;
        try {
            Connection conn = connection; // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Orders where OrderID = ? ");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt(2);
                String date = rs.getString(3);

                list = new Order(id, userId, date);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<OrderDetail> getOrderDetails(int id) {
        ArrayList list = new ArrayList<>();
        try {
            Connection conn = connection; // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM orderdetails where orderid = ? ");
            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int orderdetailId = rs.getInt(1);
                int bookid = rs.getInt(3);
                int quantity = rs.getInt(4);
                int price = rs.getInt(5);

                list.add(new OrderDetail(orderdetailId, id, bookid, quantity, price));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotal(int id) {
        int total = 0;
        try {
            Connection conn = connection; // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM orderdetails where orderid = ? ");
            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int quantity = rs.getInt(4);

                int price = rs.getInt(5);

                total += price * quantity;

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return total;
    }

    public void addOrder(int userId) {
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("insert into orders values ( ? , ? )");
            stmt.setInt(1, userId);
            stmt.setString(2, LocalDate.now().toString());

            stmt.executeUpdate();

            int id = getLast().getOrderID();

            stmt = conn.prepareStatement("insert into orderstatus values ( ? , ? )");
            stmt.setInt(1, id);
            stmt.setInt(2, 1);

            stmt.executeUpdate();

            stmt = conn.prepareStatement("insert into orderaddress (orderid) values ( ? )");
            stmt.setInt(1, id);

            stmt.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public void updateStatus(int id, int status) {
        try {
            Connection conn = connection; // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("UPDATE  OrderStatus SET status = ? where orderid = ? ");
            stmt.setInt(1, status);
            stmt.setInt(2, id);
            stmt.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateAddress(int id, String street, String city, String zip, String state, String county, String country) {
        try {
            Connection conn = connection; // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("  update orderaddress \n"
                    + "  set street = ?, \n"
                    + "	city = ? ,\n"
                    + "	state = ? ,\n"
                    + "	zip = ? ,\n"
                    + "	county = ? ,\n"
                    + "	country = ? \n"
                    + "\n"
                    + "where orderid = ? ");
            stmt.setString(1, street);
            stmt.setString(2, city);
            stmt.setString(3, zip);
            stmt.setString(4, state);
            stmt.setString(5, county);
            stmt.setString(6, country);
            stmt.setInt(7, id);
            stmt.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Order getLast() {
        Order list = null;
        try {
            Connection conn = connection; // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT top 1 * FROM Orders order by orderid desc  ");

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt(1);
                int userId = rs.getInt(2);
                String date = rs.getString(2);

                list = new Order(id, userId, date);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void addOrderDetail(int orderId, int bookId, int quantity, int price) {
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("insert into orderdetails values ( ? , ? , ?, ?  )");
            stmt.setInt(1, orderId);
            stmt.setInt(2, bookId);
            stmt.setInt(3, quantity);
            stmt.setInt(4, price);

            stmt.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public int getStatus(int id) {
        int list = 0;
        try {
            Connection conn = connection; // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM orderstatus  where orderid  = ? ");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int status = rs.getInt(2);
                list = status;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public String[] getAddress(int id) {
        String[] list = new String[6];
        try {
            Connection conn = connection; // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM orderaddress  where orderid  = ? ");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                list[0] = rs.getString(2);
                list[1] = rs.getString(3);
                list[2] = rs.getString(4);
                list[3] = rs.getString(5);
                list[4] = rs.getString(6);
                list[5] = rs.getString(7);

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Integer> countOrdersInWeek() {
        ArrayList list = new ArrayList<>();

        for (int i = 1; i <= 7; i++) {
            list.add(0);
        }

        try {
            Connection conn = connection; // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT DATEPART(WEEKDAY, [OrderDate]) as 'time', count (*) as amount \n"
                    + "  FROM [bookstore].[dbo].[Orders]\n"
                    + "  WHERE DATEPART(WEEK, [OrderDate]) = DATEPART(WEEK, GETDATE())\n"
                    + "  group by DATEPART(WEEKDAY, [OrderDate])\n"
                    + "  ");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int day = rs.getInt(1);
                int amount = rs.getInt(2);
                list.set(day - 1, amount);

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Integer> countOrdersInMonth() {
        ArrayList list = new ArrayList<>();

        for (int i = 1; i <= LocalDate.now().lengthOfMonth(); i++) {
            list.add(0);
        }

        try {
            Connection conn = connection; // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT DATEPART(DAY, [OrderDate]) as 'time', count (*) as amount \n"
                    + "  FROM [bookstore].[dbo].[Orders]\n"
                    + "  WHERE DATEPART(MONTH, [OrderDate]) = DATEPART(MONTH, GETDATE())\n"
                    + "  group by DATEPART(DAY, [OrderDate])");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int day = rs.getInt(1);
                int amount = rs.getInt(2);
                list.set(day - 1, amount);

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Integer> countOrdersInYear() {
        ArrayList list = new ArrayList<>();

        for (int i = 1; i <= 12; i++) {
            list.add(0);
        }

        try {
            Connection conn = connection; // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT DATEPART(MONTH, [OrderDate]) as 'time', count (*) as amount \n"
                    + "  FROM [bookstore].[dbo].[Orders]\n"
                    + "  WHERE DATEPART(YEAR, [OrderDate]) = DATEPART(YEAR, GETDATE())\n"
                    + "  group by DATEPART(MONTH, [OrderDate])");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int month = rs.getInt(1);
                int amount = rs.getInt(2);
                list.set(month - 1, amount);

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();

        ArrayList list = dao.countOrdersInYear();
        for (int i = 0; i < list.size(); i++) {
            System.out.println((i + 1) + " : " + list.get(i));

        }
    }

}
