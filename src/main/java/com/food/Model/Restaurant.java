package com.food.Model;

public class Restaurant {

    private int RestaurantID;
    private String Name;
    private String CuisineType;
    private int DeliveryTime;
    private String Address;
    private int AdminUserID;
    private float Rating;
    private int isActive;
    private String ImagePath;
    // Default Constructor
    public Restaurant() {

    }
    // Full Constructor
    public Restaurant(int restaurantID, String name, String cuisineType,
                      int deliveryTime, String address,
                      int adminUserID, float rating, int isActive, String ImagePath) {

        this.RestaurantID = restaurantID;
        this.Name = name;
        this.CuisineType = cuisineType;
        this.DeliveryTime = deliveryTime;
        this.Address = address;
        this.AdminUserID = adminUserID;
        this.Rating = rating;
        this.isActive = isActive;
        this.ImagePath = ImagePath;
    }

    // Constructor without RestaurantID
    public Restaurant(String name, String cuisineType,
                      int deliveryTime, String address,
                      int adminUserID, float rating, int isActive, String ImagePath) {

        this.Name = name;
        this.CuisineType = cuisineType;
        this.DeliveryTime = deliveryTime;
        this.Address = address;
        this.AdminUserID = adminUserID;
        this.Rating = rating;
        this.isActive = isActive;
        this.ImagePath = ImagePath;
    }


    public int getRestaurantID() {
        return RestaurantID;
    }

    public void setRestaurantID(int restaurantID) {
        RestaurantID = restaurantID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getCuisineType() {
        return CuisineType;
    }

    public void setCuisineType(String cuisineType) {
        CuisineType = cuisineType;
    }

    public int getDeliveryTime() {
        return DeliveryTime;
    }

    public void setDeliveryTime(int deliveryTime) {
        DeliveryTime = deliveryTime;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public int getAdminUserID() {
        return AdminUserID;
    }

    public void setAdminUserID(int adminUserID) {
        AdminUserID = adminUserID;
    }

    public float getRating() {
        return Rating;
    }

    public void setRating(float rating) {
        Rating = rating;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

	public String getImagePath() {
		return ImagePath;
	}
	public void setImagePath(String imagePath) {
		ImagePath = imagePath;
	}
	@Override
	public String toString() {
		return "Restaurant [RestaurantID=" + RestaurantID + ", Name=" + Name + ", CuisineType=" + CuisineType
				+ ", DeliveryTime=" + DeliveryTime + ", Address=" + Address + ", AdminUserID=" + AdminUserID
				+ ", Rating=" + Rating + ", isActive=" + isActive + ", ImagePath=" + ImagePath + "]";
	}
	

}