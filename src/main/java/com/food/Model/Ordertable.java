package com.food.Model;

import java.sql.Timestamp;

public class Ordertable {
	private int OrderID;
	private int UserID;
	private int RestaurantID; 
	private String restaurantName;
	private Timestamp OrderDate;
	private float TotalAmount;
	private String	Status;
	private String PaymentMethod;
	public Ordertable() {
		
		
	}
	public Ordertable(int UserID, int RestaurantID, Timestamp OrderDate, float TotalAmount, String Status,
			String PaymentMethod) {
		this.UserID = UserID;
		this.RestaurantID = RestaurantID;
		this.OrderDate = OrderDate;
		this.TotalAmount = TotalAmount;
		this.Status = Status;
		this.PaymentMethod = PaymentMethod;
	}
	public int getOrderID() {
		return OrderID;
	}
	public void setOrderID(int orderID) {
		OrderID = orderID;
	}
	public int getUserID() {
		return UserID;
	}
	public void setUserID(int userID) {
		UserID = userID;
	}
	public int getRestaurantID() {
		return RestaurantID;
	}
	public void setRestaurantID(int restaurantID) {
		RestaurantID = restaurantID;
	}
	public String getRestaurantName() {
	    return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
	    this.restaurantName = restaurantName;
	}
	public Timestamp getOrderDate() {
		return OrderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		OrderDate = orderDate;
	}
	public float getTotalAmount() {
		return TotalAmount;
	}
	public void setTotalAmount(float totalAmount) {
		TotalAmount = totalAmount;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getPaymentMethod() {
		return PaymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		PaymentMethod = paymentMethod;
	}
	@Override
	public String toString() {
		return "OrderID: " + OrderID + ", UserID: " + UserID + ", RestaurantID: " + RestaurantID
				+ ", OrderDate: " + OrderDate + ", TotalAmount:  " + TotalAmount + ", Status: " + Status
				+ ", PaymentMethod: " + PaymentMethod ;
	}
	
	
}
