package com.food.Model;

import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {

    private  Map<Integer, CartItem> items = new LinkedHashMap<>();

    public  void addItem(CartItem item) {

        int menuId = item.getMenuID();

        if(items.containsKey(menuId)) {
            CartItem existing = items.get(menuId);
            existing.setQuantity(
                    existing.getQuantity()
                    + item.getQuantity() 
            );
        }
        else {
            items.put(menuId, item);
        }
    }

    public void updateItem(int menuId, int quantity) {

        if (quantity <= 0) {
            items.remove(menuId);
            return;
        }

        if (items.containsKey(menuId)) {
            items.get(menuId).setQuantity(quantity);
        }
    }
    public void removeItem(int menuId) {
        items.remove(menuId);
    }
    
    public float getGrandTotal() {

        float total = 0;

        for (CartItem item : items.values()) {
            total += item.getTotalPrice();
        }

        return total;
    }

    public Map<Integer, CartItem> getItems() {
        return items;
    }
}