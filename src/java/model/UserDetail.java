/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author asus
 */
public class UserDetail {
    private int userID;
    private String fullName;
    private String gender;
    private String phoneNumber;
    private int numberOfOrders;
    private int booksBought;
    private int numberOfReviews;

    public UserDetail(int userID, String fullName, String gender, String phoneNumber, int numberOfOrders, int booksBought, int numberOfReviews) {
        this.userID = userID;
        this.fullName = fullName;
        this.gender = gender;
        this.phoneNumber = phoneNumber;
        this.numberOfOrders = numberOfOrders;
        this.booksBought = booksBought;
        this.numberOfReviews = numberOfReviews;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getNumberOfOrders() {
        return numberOfOrders;
    }

    public void setNumberOfOrders(int numberOfOrders) {
        this.numberOfOrders = numberOfOrders;
    }

    public int getBooksBought() {
        return booksBought;
    }

    public void setBooksBought(int booksBought) {
        this.booksBought = booksBought;
    }

    public int getNumberOfReviews() {
        return numberOfReviews;
    }

    public void setNumberOfReviews(int numberOfReviews) {
        this.numberOfReviews = numberOfReviews;
    }

    
    
    
    
}
