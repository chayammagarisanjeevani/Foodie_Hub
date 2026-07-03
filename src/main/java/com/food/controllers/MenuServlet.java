package com.food.controllers;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.Model.Menu;
import com.food.Model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Get Restaurant ID
        int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
        //new line
        req.getSession().setAttribute("restaurantId", restaurantId);
        // Fetch Menu Items
        MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
        List<Menu> allMenuByRestaurant =
                menuDAOImpl.getALLMenuByRestaurantID(restaurantId);

        // Fetch Restaurant Details
        RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
        Restaurant restaurant =
                restaurantDAOImpl.getRestaurant(restaurantId);

        // Send Data to JSP
        req.setAttribute("restaurant", restaurant);
        req.setAttribute("allMenuByRestaurant", allMenuByRestaurant);
       
        System.out.println("Restaurant = " + restaurant);
        System.out.println("Menu Count = " + allMenuByRestaurant.size());
        // Forward to JSP
        RequestDispatcher rd = req.getRequestDispatcher("menu.jsp");
        rd.forward(req, resp);
    }
}