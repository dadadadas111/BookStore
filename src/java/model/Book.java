/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.AuthorDAO;
import dal.BookDAO;
import dal.CategoryDAO;
import java.util.ArrayList;

/**
 *
 * @author asus
 */
public class Book {

    private int BookID;
    private String Title;
    private int AuthorID;
    private int PublisherID;
    private String ReleaseDate;
    private int Price;
    private int Quantity;

    public Book(int BookID, String Title, int AuthorID, int PublisherID, String ReleaseDate, int Price, int Quantity) {
        this.BookID = BookID;
        this.Title = Title;
        this.AuthorID = AuthorID;
        this.PublisherID = PublisherID;
        this.ReleaseDate = ReleaseDate;
        this.Price = Price;
        this.Quantity = Quantity;
    }

    public int getBookID() {
        return BookID;
    }

    public void setBookID(int BookID) {
        this.BookID = BookID;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public int getAuthorID() {
        return AuthorID;
    }

    public String getAuthorName() {
        Author a = (new AuthorDAO()).getAuthor(AuthorID);
        return a.getAuthorName();
    }

    public String getCategories() {
        String categories = "";

        try {
            ArrayList<Category> list = (new CategoryDAO()).getCategoryByBookId(BookID);

            for (Category c : list) {
                categories += " " + c.getCategoryName() + ",";

            }
        } catch (Exception e) {
        }
        
        if (categories.length() == 0) return "Updating";

        return categories.substring(1, categories.length() - 1);

    }

    public Double getRating() {
        return (new BookDAO()).getRating(BookID);
    }
    
    public int getNumberOfReviews(){
        return (new BookDAO()).getNumberOfReviews(BookID);
    }
    
    public ArrayList<Review> getReviews(){
        return (new BookDAO()).getReviews(BookID);
    }

    public void setAuthorID(int AuthorID) {
        this.AuthorID = AuthorID;
    }

    public int getPublisherID() {
        return PublisherID;
    }

    public void setPublisherID(int PublisherID) {
        this.PublisherID = PublisherID;
    }

    public String getReleaseDate() {
        return ReleaseDate;
    }

    public void setReleaseDate(String ReleaseDate) {
        this.ReleaseDate = ReleaseDate;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    @Override
    public String toString() {
        return "Book{" + "BookID=" + BookID + ", Title=" + Title + ", AuthorID=" + AuthorID + ", PublisherID=" + PublisherID + ", ReleaseDate=" + ReleaseDate + ", Price=" + Price + ", Quantity=" + Quantity + '}';
    }

}
