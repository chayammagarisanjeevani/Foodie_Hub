package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.food.Model.Menu;
import com.food.Model.Restaurant;
import com.food.Model.User;
import com.food.utility.DBConnection;
import com.food.DAO.MenuDAO;

public class MenuDAOImpl implements MenuDAO{
	private static final String INSERT_QUERY=
			"INSERT INTO menu (RestaurantID, ItemName, Description, Price, IsAvailable, Category,CreatedAt,UpdatedAt) VALUES (?, ?, ?, ?, ?, ?,?,?)";
			
	private static final String SELECT_QUERY ="SELECT * FROM Menu WHERE MenuID= ?";
			
	private static final String UPDATE_QUERY =
			"UPDATE menu SET RestaurantID=?, ItemName=?, Description=?, Price=?, IsAvailable=?, Category=?,UpdatedAt=?,DeletedAt=? WHERE MenuID=?";
			
	
	 private static final String DELETE_QUERY ="DELETE  FROM Menu WHERE MenuID= ?";
			 
	 
	 private static final String SELECT_ALL_QUERY = "SELECT * FROM Menu";
	 
	 private static final String GET_ALL_MENU_BY_ID="SELECT * FROM Menu WHERE RestaurantId = ?";


	 @Override
	 public void addMenu(Menu menu) {
		
		try(Connection con=DBConnection.getDBConnection();
			PreparedStatement pstmt=con.prepareStatement(INSERT_QUERY)
		   ) {
			
			pstmt.setInt(1, menu.getRestaurantID());
			pstmt.setString(2,menu.getItemName());
			pstmt.setString(3, menu.getDescription());
			pstmt.setFloat(4,menu.getPrice());
			pstmt.setBoolean(5,menu.isIsAvailable());
			pstmt.setString(6,menu.getCategory());
			pstmt.setTimestamp(7,menu.getCreatedAt());
			pstmt.setTimestamp(8,menu.getUpdatedAt());

            int i = pstmt.executeUpdate();

            System.out.println(i + " rows inserted");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }


	 @Override
	 public Menu getMenu(int MenuID) {
		 
		 Connection con = DBConnection.getDBConnection();
		 Menu menu = null;
		 
		 try {

	            PreparedStatement pstmt = con.prepareStatement(SELECT_QUERY);

	            pstmt.setInt(1,MenuID);

	            ResultSet res = pstmt.executeQuery();

	            if(res.next()) {

	            	 menu=new Menu();
				
	            	menu.setMenuID(res.getInt("MenuID"));
					menu.setRestaurantID(res.getInt("RestaurantID"));
					menu.setItemName(res.getString("ItemName"));
					menu.setDescription(res.getString("Description"));
					menu.setPrice(res.getFloat("Price"));
					menu.setIsAvailable(res.getBoolean("IsAvailable"));
					menu.setCategory(res.getString("Category"));
					menu.setCreatedAt(res.getTimestamp("CreatedAt"));
					menu.setUpdatedAt(res.getTimestamp("UpdatedAt"));
					menu.setDeletedAt(res.getTimestamp("DeletedAt"));
				    menu.setImagePath(res.getString("ImagePath"));

	            }
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	

		 return menu;

			
	 }


	 @Override
	 
	 	public int updateMenu(Menu menu) {
		 
			Connection con=DBConnection.getDBConnection();
		try {
				PreparedStatement pstmt=con.prepareStatement(UPDATE_QUERY);
				pstmt.setInt(1,menu.getRestaurantID());
				pstmt.setString(2, menu.getItemName());
				pstmt.setString(3, menu.getDescription());
				pstmt.setFloat(4, menu.getPrice());
				pstmt.setBoolean(5,menu.isIsAvailable());
	            pstmt.setString(6,menu.getCategory());
	            //pstmt.setTimestamp(7,menu.getCreatedAt());
	            pstmt.setTimestamp(7,menu.getUpdatedAt());
	            pstmt.setTimestamp(8,menu.getDeletedAt());
	            pstmt.setInt(9,menu.getMenuID());
	            
	            int i = pstmt.executeUpdate();

	            return i;
	            
			} catch (SQLException e) {
			e.printStackTrace();
			}
		return 0;
	 }
	

	 @Override
	 public int deleteMenu( int MenuId) {
		 
		 Connection con=DBConnection.getDBConnection();			
			try {
				PreparedStatement pstmt=con.prepareStatement(DELETE_QUERY);
				pstmt.setInt(1, MenuId);
				int i=pstmt.executeUpdate();
			System.out.println(i+"rows deleted");
			return i;
			
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return 0;
	 }


	 @Override
	 public List<Menu> getALLMenu() {
		 List<Menu> menuList=new ArrayList<>();
		 Connection con=DBConnection.getDBConnection();
		 try {
			PreparedStatement pstmt=con.prepareStatement(SELECT_ALL_QUERY );
			ResultSet res=pstmt.executeQuery();
			while(res.next()) {
				Menu menu=new Menu();
				
				menu.setMenuID(res.getInt("MenuId"));
				menu.setRestaurantID(res.getInt("RestaurantID"));
				menu.setItemName(res.getString("ItemName"));
				menu.setDescription(res.getString("Description"));
				menu.setPrice(res.getFloat("Price"));
				menu.setIsAvailable(res.getBoolean("IsAvailable"));
				menu.setCategory(res.getString("Category"));
				menu.setCreatedAt(res.getTimestamp("CreatedAt"));
				menu.setUpdatedAt(res.getTimestamp("UpdatedAt"));
				menu.setDeletedAt(res.getTimestamp("DeletedAt"));
				menu.setImagePath(res.getString("ImagePath"));
				menuList.add(menu);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return menuList;
		
	 }


	 @Override
	 public List<Menu> getALLMenuByRestaurantID(int RestaurantId) {
		 List<Menu> menuList=new ArrayList<>();
		try( Connection con=DBConnection.getDBConnection();
		 PreparedStatement pstmt=con.prepareStatement(GET_ALL_MENU_BY_ID)
		){
		   pstmt.setInt(1, RestaurantId);
			ResultSet res=pstmt.executeQuery();
			while(res.next()) {
				Menu menu=new Menu();
				
				menu.setMenuID(res.getInt("MenuId"));
				menu.setRestaurantID(res.getInt("RestaurantID"));
				menu.setItemName(res.getString("ItemName"));
				menu.setDescription(res.getString("Description"));
				menu.setPrice(res.getFloat("Price"));
				menu.setIsAvailable(res.getBoolean("IsAvailable"));
				menu.setCategory(res.getString("Category"));
				menu.setCreatedAt(res.getTimestamp("CreatedAt"));
				menu.setUpdatedAt(res.getTimestamp("UpdatedAt"));
				menu.setDeletedAt(res.getTimestamp("DeletedAt"));
				menu.setImagePath(res.getString("ImagePath"));
				menuList.add(menu);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return menuList;
		
	 }
		 	 
}
