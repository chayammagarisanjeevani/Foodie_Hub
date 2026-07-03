

package com.food.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/food_delivery_application";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    private static Connection con = null;

    public static Connection getDBConnection() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

        } catch (ClassNotFoundException e) {
            System.out.println("MySQL Driver not found!");
            e.printStackTrace();

        } catch (SQLException e) {
            System.out.println("DB Connection failed!");
            e.printStackTrace();
        }

        return con;
    }
}