/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Book;
import model.Review;

/**
 *
 * @author asus
 */
public class BookDAO extends DBContext {

    public ArrayList<Book> getAll() {
        ArrayList list = new ArrayList<Book>();
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Books");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString(2);
                int AuthorID = rs.getInt(3);
                int PublisherID = rs.getInt(4);
                String ReleaseDate = rs.getString(5);
                int Price = rs.getInt(6);
                int Quantity = rs.getInt(7);
                list.add(new Book(id, title, AuthorID, PublisherID, ReleaseDate, Price, Quantity));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Book> getTop(int num, int page) {
        ArrayList list = new ArrayList<Book>();
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Books ORDER BY BookId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
            stmt.setInt(1, page);
            stmt.setInt(2, num);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString(2);
                int AuthorID = rs.getInt(3);
                int PublisherID = rs.getInt(4);
                String ReleaseDate = rs.getString(5);
                int Price = rs.getInt(6);
                int Quantity = rs.getInt(7);
                list.add(new Book(id, title, AuthorID, PublisherID, ReleaseDate, Price, Quantity));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Book> search(String name) {
        ArrayList list = new ArrayList<Book>();
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Books where title like '%" + name + "%'");
            // stmt.setString(1, name);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString(2);
                int AuthorID = rs.getInt(3);
                int PublisherID = rs.getInt(4);
                String ReleaseDate = rs.getString(5);
                int Price = rs.getInt(6);
                int Quantity = rs.getInt(7);
                list.add(new Book(id, title, AuthorID, PublisherID, ReleaseDate, Price, Quantity));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Book get(int id) {
        Book book = null;
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Books where bookid = ?");
            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                String title = rs.getString(2);
                int AuthorID = rs.getInt(3);
                int PublisherID = rs.getInt(4);
                String ReleaseDate = rs.getString(5);
                int Price = rs.getInt(6);
                int Quantity = rs.getInt(7);
                book = new Book(id, title, AuthorID, PublisherID, ReleaseDate, Price, Quantity);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return book;
    }

    public Book getLast() {
        Book book = null;
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Books order by bookid desc");

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString(2);
                int AuthorID = rs.getInt(3);
                int PublisherID = rs.getInt(4);
                String ReleaseDate = rs.getString(5);
                int Price = rs.getInt(6);
                int Quantity = rs.getInt(7);
                book = new Book(id, title, AuthorID, PublisherID, ReleaseDate, Price, Quantity);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return book;
    }

    public void addBook(String title, int AuthorID, int PublisherID, String ReleaseDate, int Price, int Quantity) {
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("insert into Books values (?, ?, ?, ?, ?, ?)");
            stmt.setString(1, title);
            stmt.setInt(2, AuthorID);
            stmt.setInt(3, PublisherID);
            stmt.setString(4, ReleaseDate);
            stmt.setInt(5, Price);
            stmt.setInt(6, Quantity);

            stmt.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateBook(int bookId, int Price, int Quantity) {
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("update books set price = ?, quantity = ? where bookid = ? ");
            stmt.setInt(1, Price);
            stmt.setInt(2, Quantity);
            stmt.setInt(3, bookId);

            stmt.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteBook(int id) {
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("delete from BookCategories where bookid = ? ");
            stmt.setInt(1, id);
            stmt.executeUpdate();

//            stmt = conn.prepareStatement("delete from OrderDetails where bookid = ? ");     
//            stmt.setInt(1, id);
//            stmt.executeUpdate();
//            
            stmt = conn.prepareStatement("delete from Reviews where bookid = ? ");
            stmt.setInt(1, id);
            stmt.executeUpdate();

            stmt = conn.prepareStatement("delete from Books where bookid = ? ");
            stmt.setInt(1, id);
            stmt.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void addBookCategory(int bookId, int CategoryId) {
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("insert into BookCategories values (?, ?)");
            stmt.setInt(1, bookId);
            stmt.setInt(2, CategoryId);

            stmt.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Book> getFilteredBook(String name, String author, String publisher, String category, String sort, int offset, int fetch) {
        String sql = "select distinct books.BookID, books.Title, books.AuthorID,  books.PublisherID,books.ReleaseDate,  books.Price, books.Quantity   \n"
                + "from books left join BookCategories on books.BookID = BookCategories.BookID ";

        sql += " where title like '%" + name + "%' and AuthorID like ? and publisherid like ? and COALESCE(CategoryID, '') like ?";
        if ("Low to High".equals(sort)) {
            sql += " order by books.price asc";
        } else if ("High to Low".equals(sort)) {
            sql += " order by books.price desc";
        } else if ("New".equals(sort)) {
            sql += " order by books.releasedate desc";
        } else if ("High Rated".equals(sort)) {
            sql = "select distinct books.BookID, books.Title, books.AuthorID,  books.PublisherID,books.ReleaseDate,  books.Price, books.Quantity, coalesce(AVG(Rating), 0) as aaa \n"
                    + "from books left join BookCategories on books.BookID = BookCategories.BookID\n"
                    + "left join reviews on books.BookID = Reviews.BookID\n"
                    + " where title like '%" + name + "%' and AuthorID like ? and publisherid like ? and COALESCE(CategoryID, '') like ?\n"
                    + "group by books.bookid, books.Title, books.AuthorID,  books.PublisherID,books.ReleaseDate,  books.Price, books.Quantity\n"
                    + "order by aaa desc";
        } else if ("Popular".equals(sort)) {
            sql = "select distinct books.BookID, books.Title, books.AuthorID,  books.PublisherID,books.ReleaseDate,  books.Price, books.Quantity, coalesce(COUNT(Rating), 0) as aaa \n"
                    + "from books left join BookCategories on books.BookID = BookCategories.BookID\n"
                    + "left join reviews on books.BookID = Reviews.BookID\n"
                    + " where title like '%" + name + "%' and AuthorID like ? and publisherid like ? and COALESCE(CategoryID, '') like ?\n"
                    + "group by books.bookid, books.Title, books.AuthorID,  books.PublisherID,books.ReleaseDate,  books.Price, books.Quantity\n"
                    + "order by aaa desc";

        } else {
            sql += " order by bookid";
        }

        sql += " OFFSET " + offset + " ROWS FETCH NEXT " + fetch + " ROWS ONLY";

        ArrayList list = new ArrayList<Book>();
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, author);
            stmt.setString(2, publisher);
            stmt.setString(3, category);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString(2);
                int AuthorID = rs.getInt(3);
                int PublisherID = rs.getInt(4);
                String ReleaseDate = rs.getString(5);
                int Price = rs.getInt(6);
                int Quantity = rs.getInt(7);
                list.add(new Book(id, title, AuthorID, PublisherID, ReleaseDate, Price, Quantity));
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    public double getRating(int id) {
        String sql = "SELECT\n"
                + "    ROUND(COALESCE(AVG(1.0 * Rating), 0), 1) AS AverageRating\n"
                + "FROM\n"
                + "    Reviews\n"
                + "WHERE\n"
                + "    BookID = ?";
        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getDouble(1);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getNumberOfReviews(int id) {
        String sql = "SELECT\n"
                + "   COUNT (*) AS counting\n"
                + "FROM\n"
                + "    Reviews\n"
                + "WHERE\n"
                + "    BookID = ?";
        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public ArrayList<Review> getReviews(int id) {
        String sql = "SELECT [ReviewID]\n"
                + "      ,[BookID]\n"
                + "      ,[UserID]\n"
                + "      ,[Rating]\n"
                + "      ,[Comment]\n"
                + "  FROM [Reviews]\n"
                + "  WHERE BookID = ?";
        ArrayList list = new ArrayList<Review>();
        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int bookId = rs.getInt(2);
                int userId = rs.getInt(3);
                int rating = rs.getInt(4);
                String comment = rs.getString(5);

                list.add(new Review(id, bookId, userId, rating, comment));
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    public void addComment(int bookId, int userId, int rating, String comment) {
        try {
            Connection conn = getConnection(); // Establish database connection (replace with your connection logic)
            PreparedStatement stmt = conn.prepareStatement("insert into reviews (bookid, userid, rating, comment) values ( ? , ? , ? , ?  ) \n"
                    + "exec UpdateUserDetails @userid= ?");
            stmt.setInt(1, bookId);
            stmt.setInt(2, userId);
            stmt.setInt(3, rating);
            stmt.setString(4, comment);
            stmt.setInt(5, userId);

            stmt.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public boolean canReview(int BookID, int UserID) {
        boolean canReview = false;
        String sql = "SELECT    dbo.Users.UserID, dbo.Books.BookID\n"
                + "FROM         dbo.Books INNER JOIN\n"
                + "                      dbo.OrderDetails ON dbo.Books.BookID = dbo.OrderDetails.BookID INNER JOIN\n"
                + "                      dbo.Orders ON dbo.OrderDetails.OrderID = dbo.Orders.OrderID INNER JOIN\n"
                + "                      dbo.Users ON dbo.Orders.UserID = dbo.Users.UserID where Users.UserID = ? and Books.BookID = ? ";

        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, UserID);
            stmt.setInt(2, BookID);
            
            ResultSet rs = stmt.executeQuery();
            if (rs.next()){
                canReview = true;
            }
            
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return canReview;

    }

    public static void main(String[] args) {

        BookDAO dao = new BookDAO();

        System.out.println(dao.canReview(34,24));
    }
}
