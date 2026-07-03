package com.food.DAO;

import java.util.List;

import com.food.Model.Menu;

public interface MenuDAO {
	
	void addMenu(Menu menu);

    Menu getMenu(int MenuID);

    int updateMenu(Menu menu);

    int deleteMenu(int MenuID);

    List<Menu> getALLMenu();
    
   List<Menu> getALLMenuByRestaurantID(int RestaurantId);
}
