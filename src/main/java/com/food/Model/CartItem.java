package com.food.Model;

public class CartItem {
	private int MenuID;
	private int RestaurantID;
	private String name;
	private float price;
	private int quantity;
	private String imagePath;
	public CartItem() {
		
		
	}

	public CartItem(int menuID, int restaurantID, String name, float price, int quantity) {
		super();
		MenuID = menuID;
		RestaurantID = restaurantID;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}

	public int getMenuID() {
		return MenuID;
	}

	public void setMenuID(int menuID) {
		MenuID = menuID;
	}

	public int getRestaurantID() {
		return RestaurantID;
	}

	public void setRestaurantID(int restaurantID) {
		RestaurantID = restaurantID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTotalPrice() {
		return (int)(quantity*price);
	}
	public String getImagePath() {
	    return imagePath;
	}

	public void setImagePath(String imagePath) {
	    this.imagePath = imagePath;
	}
	
}
