package com.food.DAO;

import java.util.List;
import com.food.Model.Ordertable;

public interface OrdertableDAO {

    void addOrdertable(Ordertable order);

    Ordertable getOrdertable(int OrdertableID);

    int updateOrdertable(Ordertable order);

    int deleteOrdertable(int OrderID);

    List<Ordertable> getALLOrdertable();

    // Add this new method
    List<Ordertable> getOrdersByUserId(int userId);
}
