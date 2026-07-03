package com.food.Model;

import java.sql.Timestamp;

public class Menu {
	private int MenuID;
	private int RestaurantID;
	private String ItemName; 
	private String Description; 
	private float Price;
	private boolean IsAvailable;
	private String Category;
	private Timestamp CreatedAt;
	private Timestamp UpdatedAt;
	private Timestamp DeletedAt;
	private String ImagePath;
	public Menu() {
		
	}

	public Menu(int restaurantID, String itemName, String description, float price, boolean isAvailable,
			String category, Timestamp createdAt, Timestamp updatedAt, String ImagePath) {
		
		this.RestaurantID = restaurantID;
		this.ItemName = itemName;
		this.Description = description;
		this.Price = price;
		this.IsAvailable = isAvailable;
		this.Category = category;
		this.CreatedAt = createdAt;
		this.UpdatedAt = updatedAt;
		this.ImagePath = ImagePath;
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

	public String getItemName() {
		return ItemName;
	}

	public void setItemName(String itemName) {
		ItemName = itemName;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public float getPrice() {
		return Price;
	}

	public void setPrice(float price) {
		Price = price;
	}

	public boolean isIsAvailable() {
		return IsAvailable;
	}

	public void setIsAvailable(boolean isAvailable) {
		IsAvailable = isAvailable;
	}

	public String getCategory() {
		return Category;
	}

	public void setCategory(String category) {
		Category = category;
	}

	public Timestamp getCreatedAt() {
		return CreatedAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		CreatedAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return UpdatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		UpdatedAt = updatedAt;
	}

	public Timestamp getDeletedAt() {
		return DeletedAt;
	}

	public void setDeletedAt(Timestamp deletedAt) {
		DeletedAt = deletedAt;
	}
	

	public String getImagePath() {
		return ImagePath;
	}

	public void setImagePath(String imagePath) {
		ImagePath = imagePath;
	}

	@Override
	public String toString() {
		return "Menu [MenuID=" + MenuID + ", RestaurantID=" + RestaurantID + ", ItemName=" + ItemName + ", Description="
				+ Description + ", Price=" + Price + ", IsAvailable=" + IsAvailable + ", Category=" + Category
				+ ", CreatedAt=" + CreatedAt + ", UpdatedAt=" + UpdatedAt + ", DeletedAt=" + DeletedAt + ", ImagePath="
				+ ImagePath + "]";
	}

	
	  
	
}
