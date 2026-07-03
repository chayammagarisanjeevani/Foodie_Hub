// RestaurantDAO.java

package com.food.DAO;

import java.util.List;

import com.food.Model.Restaurant;

public interface RestaurantDAO {

    void addRestaurant(Restaurant restaurant);

    Restaurant getRestaurant(int RestaurantID);

    int updateRestaurant(Restaurant restaurant);

    int deleteRestaurant(int RestaurantID);

    List<Restaurant> getALLRestaurants();
}