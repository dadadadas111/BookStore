/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.UserDAO;

/**
 *
 * @author asus
 */
public class Review {
    private int ReviewID;
    private int BookID;
    private int UserID;
    private int Rating;
    private String Comment;

    public Review(int ReviewID, int BookID, int UserID, int Rating, String Comment) {
        this.ReviewID = ReviewID;
        this.BookID = BookID;
        this.UserID = UserID;
        this.Rating = Rating;
        this.Comment = Comment;
    }

    public int getReviewID() {
        return ReviewID;
    }

    public void setReviewID(int ReviewID) {
        this.ReviewID = ReviewID;
    }

    public int getBookID() {
        return BookID;
    }

    public void setBookID(int BookID) {
        this.BookID = BookID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getRating() {
        return Rating;
    }

    public void setRating(int Rating) {
        this.Rating = Rating;
    }

    public String getComment() {
        return Comment;
    }

    public void setComment(String Comment) {
        this.Comment = Comment;
    }
    
    public String getUserName(){
        UserDetail u = (new UserDAO()).getUserDetail(UserID);
        
        return u.getFullName();
        
    }
    
    
    
}
