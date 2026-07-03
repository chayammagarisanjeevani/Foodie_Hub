package com.food.Model;

public class Orderitem {
	private int OrderItemID;
	private int OrderID;
	private int MenuID;
	private int Quantity; 
	private  float ItemTotal;
	
	
	public Orderitem() {
		
		
	}
	
	
	public Orderitem(int OrderID, int MenuID, int Quantity, float ItemTotal) {
		super();
		this.OrderID = OrderID;
		this.MenuID = MenuID;
		this.Quantity = Quantity;
		this.ItemTotal = ItemTotal;
	}
	
	
	public int getOrderItemID() {
		return OrderItemID;
	}
	public void setOrderItemID(int orderItemID) {
		OrderItemID = orderItemID;
	}
	public int getOrderID() {
		return OrderID;
	}
	public void setOrderID(int orderID) {
		OrderID = orderID;
	}
	public int getMenuID() {
		return MenuID;
	}
	public void setMenuID(int menuID) {
		MenuID = menuID;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public float getItemTotal() {
		return ItemTotal;
	}
	public void setItemTotal(float itemTotal) {
		ItemTotal = itemTotal;
	}
	
	
	@Override
	public String toString() {
		return "OrderItemID: " + OrderItemID + " OrderID: " + OrderID + " MenuID: " + MenuID + " Quantity: "
				+ Quantity + ", ItemTotal: " + ItemTotal ;
	}



	
}
