package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.food.DAO.UserDAO;
import com.food.Model.User;
import com.food.utility.DBConnection;

//import launch.UserLaunch;

public class UserDAOImpl implements UserDAO
{
	private static Scanner sc = new Scanner(System.in);

	@Override
	public  void addUser(User user) {
    Connection con=DBConnection.getDBConnection();
    String INSERT_QUERY =
    		"INSERT INTO `user` (name,email,password,phone,address,role,createdAt,lastLoginAt) " +
    		"VALUES (?,?,?,?,?,?,now(),now())";      
    try {
		PreparedStatement pstmt=con.prepareStatement(INSERT_QUERY);
		pstmt.setString(1, user.getName());
		pstmt.setString(2, user.getEmail());
		pstmt.setString(3, user.getPassword());
		pstmt.setString(4, user.getPhone());
		pstmt.setString(5, user.getAddress());
		pstmt.setString(6, user.getRole());
		int i=pstmt.executeUpdate();
		System.out.println(i+"Insert is done");
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
    
		
	}

	@Override
	public int updateUser(int userId) {
		
		Connection con = DBConnection.getDBConnection();
		User user = getUser(userId);
		System.out.println(user.getName() + " " + user.getEmail()+" "+ user.getPassword()+" "+user.getPhone()+" "+user.getAddress()+" "+user.getRole()+" "+user.getCreatedAt()+" "
		        +user.getLastLoginAt());
		System.out.println("ENTER UPDATED DETAILS");
		System.out.println("ENTER NAME:");
		String name = sc.next();
		
		System.out.println("ENTER MAIL :");
		String email = sc.next();
		
		System.out.println("ENTER  USER PASSWORD:");
		String password = sc.next();
		
		System.out.println("ENTER PHONE:");
		String phone = sc.next();
		
		System.out.println("ENTER ADDRESS :");
		String address = sc.next();
		
		System.out.println("ENTER ROLE:");
		String role = sc.next();
		
		String update_query = "update user set name=?, email=?, password=?, phone=?, address=?, role=?, createdAt=now(), lastLoginAt=now() where userId=?";
		try {
			PreparedStatement st = con.prepareStatement(update_query);
		
			st.setString(1, name);
			st.setString(2, email);
			st.setString(3, password);
			st.setString(4, phone);
			st.setString(5, address);
			st.setString(6, role);
			st.setInt(7, userId);
		
		int i = st.executeUpdate();
		return i ;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	@Override
	public int deleteUser(int userId) {
		Connection con=DBConnection.getDBConnection();
		String delete_Query = "DELETE FROM `user` WHERE userId=?";
		try {
			PreparedStatement pstmt=con.prepareStatement(delete_Query);
			pstmt.setInt(1, userId);
			int i=pstmt.executeUpdate();
		System.out.println(i+"rows deleted");
		return i;
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public User getUser(int userId) {
		Connection con = DBConnection.getDBConnection();
		String getUser = "Select  * from user where userId="+userId;
		try {
		Statement st = con.createStatement();
		ResultSet result = st.executeQuery(getUser);
		
		while(result.next()) {
			
			int id = result.getInt("userId");
			String name = result.getString("name");
			String email = result.getString("email");
			String password = result.getString("password");
			String phone = result.getString("phone");
			String address = result.getString("address");
			String role = result.getString("role");

			Date createdAt = result.getDate("createdAt");
			Date lastLoginAt = result.getDate("lastLoginAt");

			User user = new User(id, name, email, password,
			                     phone, address, role,
			                     createdAt, lastLoginAt);
			return user;
			 
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
return null;
	}
	

	@Override
	public List<User> getAllUsers() {
		
			Connection con = DBConnection.getDBConnection();

			String GET_ALL_USERS = "select * from user";

			List<User> userList = new ArrayList<User>();

			try {

				Statement st = con.createStatement();

				ResultSet result = st.executeQuery(GET_ALL_USERS);

				while(result.next()) {

				    int userId = result.getInt("userId");

				    String name = result.getString("name");
				    String email = result.getString("email");
				    String password = result.getString("password");
				    String phone = result.getString("phone");
				    String address = result.getString("address");
				    String role = result.getString("role");

				    Date createdAt = result.getDate("createdAt");
				    Date lastLoginAt = result.getDate("lastLoginAt");

				    User user = new User(userId, name, email, password,
				            phone, address, role,
				            createdAt, lastLoginAt);

				    userList.add(user);
				}

			}
			catch(SQLException e) {

				e.printStackTrace();
			}

			return userList;
		
		
	}

}
