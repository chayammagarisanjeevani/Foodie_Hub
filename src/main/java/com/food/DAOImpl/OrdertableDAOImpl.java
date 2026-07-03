package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.food.Model.Menu;
import com.food.Model.Ordertable;
import com.food.utility.DBConnection;
import com.food.DAO.OrdertableDAO;

public class OrdertableDAOImpl implements OrdertableDAO{
private static final String INSERT_QUERY=
"INSERT INTO ordertable (UserID, RestaurantID, OrderDate, TotalAmount, Status, PaymentMethod) VALUES(?,?,?,?,?,?)";
private static final String  UPDATE_QUERY=
"UPDATE ordertable SET UserID=?, RestaurantID=?, OrderDate=?, TotalAmount=?, Status=?, PaymentMethod=? WHERE OrderID=?";
private static final String DELETE_QUERY ="DELETE  FROM ordertable WHERE orderID= ?"	;	
private static final String SELECT_QUERY="SELECT * FROM ordertable WHERE OrderID=? ";
private static final String SELECT_ALL_QUERY="SELECT * FROM ordertable";
private static final String SELECT_BY_USER_QUERY =
"SELECT * FROM ordertable WHERE UserID=? ORDER BY OrderDate DESC";
private static Ordertable order = null;

	@Override
	public void addOrdertable(Ordertable order) {
		Connection con=DBConnection.getDBConnection();
		try {
			PreparedStatement pstmt=con.prepareStatement(INSERT_QUERY);
			pstmt.setInt(1,order.getUserID());
			pstmt.setInt(2,order.getRestaurantID());
			pstmt.setTimestamp(3,order.getOrderDate());
			pstmt.setFloat(4,order.getTotalAmount());
			pstmt.setString(5,order.getStatus());
			pstmt.setString(6, order.getPaymentMethod());
			int i=pstmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Ordertable getOrdertable(int OrdertableID) {
		Connection con=DBConnection.getDBConnection();
		try {
			PreparedStatement pstmt=con.prepareStatement(SELECT_QUERY);
			
			pstmt.setInt(1,OrdertableID);
			
			ResultSet res = pstmt.executeQuery();
			
			if(res.next()) {
				
				 order=new Ordertable();
				
				order.setOrderID(res.getInt("OrderID"));
				order.setUserID(res.getInt("UserID"));
				order.setRestaurantID(res.getInt("RestaurantID"));
            	order.setOrderDate(res.getTimestamp("OrderDate"));
				order.setTotalAmount(res.getFloat("TotalAmount"));
				order.setStatus(res.getString("Status"));
				order.setPaymentMethod(res.getString("PaymentMethod"));
				
			 }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	

	 return order;

		
 }
				
@Override
	public int updateOrdertable(Ordertable order) {
		
	 
		Connection con=DBConnection.getDBConnection();
	try {
			PreparedStatement pstmt=con.prepareStatement(UPDATE_QUERY);
			pstmt.setInt(1, order.getUserID());
			pstmt.setInt(2,order.getRestaurantID());
			pstmt.setTimestamp(3, order.getOrderDate());
			pstmt.setFloat(4, order.getTotalAmount());
			pstmt.setString(5,order.getStatus());
           pstmt.setString(6,order.getPaymentMethod());
           pstmt.setInt(7, order.getOrderID());
           
           int i = pstmt.executeUpdate();

           return i;
           
		} catch (SQLException e) {
		e.printStackTrace();
		}
	return 0;
 }
	
	@Override
	public int deleteOrdertable(int OrderID) {
		
		Connection con=DBConnection.getDBConnection();			
		try {
			PreparedStatement pstmt=con.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1, OrderID);
			int i=pstmt.executeUpdate();
		System.out.println(i+"rows deleted");
		return i;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return 0;
 }

	@Override
	public List<Ordertable> getALLOrdertable() {
		
		List<Ordertable> orderList=new ArrayList<>();
		 Connection con=DBConnection.getDBConnection();
		 try {
			PreparedStatement pstmt=con.prepareStatement(SELECT_ALL_QUERY );
			ResultSet res=pstmt.executeQuery();
			while(res.next()) {
				Ordertable order=new Ordertable();
				
				 order.setOrderID(res.getInt("OrderId"));
				 
				 order.setUserID(res.getInt("UserId"));
				 
				 order.setRestaurantID(res.getInt("RestaurantID"));
				 
				 order.setOrderDate(res.getTimestamp("OrderDate"));
				 order.setTotalAmount(res.getFloat("TotalAmount"));
				 order.setStatus(res.getString("Status"));
				order.setPaymentMethod(res.getString("PaymentMethod"));
				
				orderList.add(order);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return orderList;
		
	 }

	@Override
	public List<Ordertable> getOrdersByUserId(int userId) {

	    List<Ordertable> orderList = new ArrayList<>();

	    Connection con = DBConnection.getDBConnection();

	    try {

	        PreparedStatement pstmt = con.prepareStatement(SELECT_BY_USER_QUERY);

	        pstmt.setInt(1, userId);

	        ResultSet res = pstmt.executeQuery();

	        while (res.next()) {

	            Ordertable order = new Ordertable();

	            order.setOrderID(res.getInt("OrderID"));
	            order.setUserID(res.getInt("UserID"));
	            order.setRestaurantID(res.getInt("RestaurantID"));
	            order.setOrderDate(res.getTimestamp("OrderDate"));
	            order.setTotalAmount(res.getFloat("TotalAmount"));
	            order.setStatus(res.getString("Status"));
	            order.setPaymentMethod(res.getString("PaymentMethod"));

	            orderList.add(order);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return orderList;
	}
		
}	
		
		
		
		
		
		
		
		
	