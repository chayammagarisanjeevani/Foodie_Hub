// RestaurantDAOImpl.java

package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.food.Model.Restaurant;
import com.food.utility.DBConnection;
import com.food.DAO.RestaurantDAO;

public class RestaurantDAOImpl implements RestaurantDAO {

	private static final String INSERT_QUERY =
			"INSERT INTO Restaurant(Name,CuisineType,DeliveryTime,Address,AdminUserID,Rating,isActive,ImagePath) VALUES(?,?,?,?,?,?,?,?)";
    private static final String SELECT_QUERY =
            "SELECT * FROM Restaurant WHERE RestaurantID=?";

    // RECTIFIED QUERY
    private static final String UPDATE_QUERY =
    		"UPDATE Restaurant SET Name=?, CuisineType=?, DeliveryTime=?, Address=?, Rating=?, isActive=?, Image=? WHERE RestaurantID=?";

    private static final String DELETE_QUERY =
            "DELETE FROM Restaurant WHERE RestaurantID=?";

    private static final String SELECT_ALL_QUERY =
            "SELECT * FROM Restaurant";

    @Override
    public void addRestaurant(Restaurant restaurant) {

        Connection connection = DBConnection.getDBConnection();

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(INSERT_QUERY);

            pstmt.setString(1, restaurant.getName());
            pstmt.setString(2, restaurant.getCuisineType());
            pstmt.setInt(3, restaurant.getDeliveryTime());
            pstmt.setString(4, restaurant.getAddress());
            pstmt.setInt(5, restaurant.getAdminUserID());
            pstmt.setFloat(6, restaurant.getRating());
            pstmt.setInt(7, restaurant.getIsActive());
            pstmt.setString(8, restaurant.getImagePath());

            int i = pstmt.executeUpdate();

            System.out.println(i + " rows inserted");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Restaurant getRestaurant(int RestaurantID) {

        Connection connection = DBConnection.getDBConnection();

        try {

            PreparedStatement pstmt = connection.prepareStatement(SELECT_QUERY);

            pstmt.setInt(1, RestaurantID);

            ResultSet res = pstmt.executeQuery();

            while (res.next()) {

                return new Restaurant(

                        res.getInt("RestaurantID"),
                        res.getString("Name"),
                        res.getString("CuisineType"),
                        res.getInt("DeliveryTime"),
                        res.getString("Address"),
                        res.getInt("AdminUserID"),
                        res.getFloat("Rating"),
                        res.getInt("IsActive"),
                        res.getString("ImagePath")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public int updateRestaurant(Restaurant restaurant) {

        Connection connection = DBConnection.getDBConnection();

        try {

            PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);

            pstmt.setString(1, restaurant.getName());
            pstmt.setString(2, restaurant.getCuisineType());
            pstmt.setInt(3, restaurant.getDeliveryTime());
            pstmt.setString(4, restaurant.getAddress());
            //pstmt.setInt(5, restaurant.getAdminUserID());
            pstmt.setFloat(5, restaurant.getRating());
            pstmt.setInt(6, restaurant.getIsActive());
            pstmt.setString(7, restaurant.getImagePath());
           

            // WHERE RestaurantID=?
            pstmt.setInt(8, restaurant.getRestaurantID());

            return pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int deleteRestaurant(int RestaurantID) {

        Connection connection = DBConnection.getDBConnection();

        try {

            PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);

            pstmt.setInt(1, RestaurantID);

            return pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public List<Restaurant> getALLRestaurants() {

        ArrayList<Restaurant> list = new ArrayList<>();

        Connection connection = DBConnection.getDBConnection();

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(SELECT_ALL_QUERY);

            ResultSet res = pstmt.executeQuery();

            while (res.next()) {

            	Restaurant restaurant = new Restaurant(
            		    res.getInt("RestaurantID"),
            		    res.getString("Name"),
            		    res.getString("CuisineType"),
            		    res.getInt("DeliveryTime"),
            		    res.getString("Address"),
            		    res.getInt("AdminUserID"),
            		    res.getFloat("Rating"),
            		    res.getInt("IsActive"),
            		    res.getString("ImagePath")
            		);
                list.add(restaurant);
            }

            return list;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}