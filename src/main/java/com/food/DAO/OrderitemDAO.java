package com.food.DAO;

import java.util.List;
import com.food.Model.Orderitem;

public interface OrderitemDAO {

    void addOrderitem(Orderitem item);

    Orderitem getOrderitem(int OrderitemID);

    int updateOrderitem(Orderitem item);

    int deleteOrderitem(int OrderitemID);

    List<Orderitem> getALLOrderitem();

    // New Method
    List<Orderitem> getOrderItemsByOrderId(int orderId);
}