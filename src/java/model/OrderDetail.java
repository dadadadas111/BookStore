/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.BookDAO;

/**
 *
 * @author asus
 */
public class OrderDetail {
    private int OrderDetailID;
    private int OrderID;
    private int BookID;
    private int Quantity;
    private int Price;

    public OrderDetail(int OrderDetailID, int OrderID, int BookID, int Quantity, int Price) {
        this.OrderDetailID = OrderDetailID;
        this.OrderID = OrderID;
        this.BookID = BookID;
        this.Quantity = Quantity;
        this.Price = Price;
    }

    public int getOrderDetailID() {
        return OrderDetailID;
    }

    public void setOrderDetailID(int OrderDetailID) {
        this.OrderDetailID = OrderDetailID;
    }

    public int getOrderID() {
        return OrderID;
    }
    
    public Book getBook(){
        BookDAO dao = new BookDAO();
        return dao.get(BookID);
        
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getBookID() {
        return BookID;
    }

    public void setBookID(int BookID) {
        this.BookID = BookID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }
    
    
    
    
    
}
