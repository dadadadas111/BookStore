/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.OrderDAO;

/**
 *
 * @author asus
 */
public class Order {
   private int OrderID;
   private int UserID;
   private String OrderDate;

    public Order(int OrderID, int UserID, String OrderDate) {
        this.OrderID = OrderID;
        this.UserID = UserID;
        this.OrderDate = OrderDate;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }
    
    public String getStatus(){
        int status = (new OrderDAO()).getStatus(OrderID);
        String result = "";
        
        result = switch (status) {
           case 1 -> "processing";
           case 2 -> "packing";
           case 3 -> "shipping";
           case 4 -> "finished";
           default -> "error";
       };
        
        return result;
    }
    
    public String[] getAddress(){
        return (new OrderDAO()).getAddress(OrderID);
    }
    
    public int getTotal(){
        return (new OrderDAO()).getTotal(OrderID);
    }
   
   
}
