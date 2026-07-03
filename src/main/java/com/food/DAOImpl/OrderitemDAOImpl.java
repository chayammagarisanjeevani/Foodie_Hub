package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.food.Model.Orderitem;
import com.food.Model.Ordertable;
import com.food.utility.DBConnection;
import com.food.DAO.OrderitemDAO;

public class OrderitemDAOImpl implements OrderitemDAO {
private static  final String  INSERT_QUERY="INSERT INTO orderitem(OrderID, MenuID, Quantity, ItemTotal) VALUES ( ? , ? , ? , ?)";

private static final String  UPDATE_QUERY="UPDATE orderitem SET OrderID=?,MenuID=?, Quantity = ?, ItemTotal = ? WHERE OrderItemID = ?";

private static final String DELETE_QUERY ="DELETE  FROM orderitem WHERE orderItemID = ?";
	
private static final String SELECT_QUERY="SELECT * FROM orderitem WHERE  OrderItemID = ?" ;

private static final String  SELECT_ALL_QUERY="SELECT * FROM orderitem";

private static final String SELECT_BY_ORDERID =
"SELECT * FROM orderitem WHERE OrderID=?";

public static Orderitem item=null;

	@Override
	public void addOrderitem(Orderitem item) {
		try {

	        Connection con = DBConnection.getDBConnection();

	        PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY);

	        pstmt.setInt(1, item.getOrderID());
	        pstmt.setInt(2, item.getMenuID());
	        pstmt.setInt(3, item.getQuantity());
	        pstmt.setFloat(4,item.getItemTotal());

	        int res = pstmt.executeUpdate();

	        System.out.println(res + " row inserted successfully");

	    } 
	    catch (SQLException e) {

	        e.printStackTrace();
	    }
	}

	@Override
	public Orderitem getOrderitem(int OrderItemID) {

		Connection con=DBConnection.getDBConnection();
		try {
			PreparedStatement pstmt=con.prepareStatement(SELECT_QUERY);
			
			pstmt.setInt(1,OrderItemID);
			
			ResultSet res = pstmt.executeQuery();
			
			if(res.next()) {
				
				item=new Orderitem();
				
				 item.setOrderID(res.getInt("OrderID"));
				 item.setMenuID(res.getInt("MenuID"));
				 item.setQuantity(res.getInt("Quantity"));
				 item.setItemTotal(res.getFloat("ItemTotal"));
				 item.setOrderItemID(res.getInt("OrderItemID"));
			 }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return item;
					

	}

	@Override
	public int updateOrderitem(Orderitem item) {

	    Connection con = DBConnection.getDBConnection();

	    try {
	        PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY);

	        pstmt.setInt(1, item.getOrderID());
	        pstmt.setInt(2, item.getMenuID());
	        pstmt.setInt(3, item.getQuantity());
	        pstmt.setFloat(4, item.getItemTotal());
	        pstmt.setInt(5, item.getOrderItemID());

	        int i = pstmt.executeUpdate();

	        return i;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return 0;
	}

	@Override
	public int deleteOrderitem(int OrderItemID) {
			
		Connection con=DBConnection.getDBConnection();			
		try {
			PreparedStatement pstmt=con.prepareStatement(DELETE_QUERY);
			pstmt.setInt(1,OrderItemID );
			int i=pstmt.executeUpdate();
		System.out.println(i+"rows deleted");
		return i;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public List<Orderitem> getALLOrderitem() {



		List<Orderitem> itemlist=new ArrayList<>();
		 Connection con=DBConnection.getDBConnection();
		 try {
			PreparedStatement pstmt=con.prepareStatement(SELECT_ALL_QUERY );
			ResultSet res=pstmt.executeQuery();
			while(res.next()) {
				Orderitem item =new Orderitem();
				
				item.setOrderItemID(res.getInt("OrderItemID"));
				
				 item.setOrderID(res.getInt("orderID"));
				 
				 item.setMenuID(res.getInt("MenuID"));
				 
				 item.setQuantity(res.getInt("Quantity"));
				 
				 item.setItemTotal(res.getFloat("ItemTotal"));
				 
				itemlist.add(item);
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		 return itemlist;
		
	 }
	@Override
	public List<Orderitem> getOrderItemsByOrderId(int orderId) {

	    List<Orderitem> itemList = new ArrayList<>();

	    Connection con = DBConnection.getDBConnection();

	    try {

	        PreparedStatement pstmt =
	                con.prepareStatement(SELECT_BY_ORDERID);

	        pstmt.setInt(1, orderId);

	        ResultSet res = pstmt.executeQuery();

	        while(res.next()) {

	            Orderitem item = new Orderitem();

	            item.setOrderItemID(res.getInt("OrderItemID"));
	            item.setOrderID(res.getInt("OrderID"));
	            item.setMenuID(res.getInt("MenuID"));
	            item.setQuantity(res.getInt("Quantity"));
	            item.setItemTotal(res.getFloat("ItemTotal"));

	            itemList.add(item);
	        }

	    } catch(Exception e) {

	        e.printStackTrace();

	    }

	    return itemList;
	}	
}	
		
		
		
		
		
		
		
		
		
		
	