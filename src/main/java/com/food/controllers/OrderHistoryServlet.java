package com.food.controllers;

import java.io.IOException;
import java.util.List;

import com.food.DAO.OrdertableDAO;
import com.food.DAOImpl.OrdertableDAOImpl;
import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.Model.Ordertable;
import com.food.Model.Restaurant;
import com.food.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/OrderHistoryServlet")
public class OrderHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loggedUser");

        if (user == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        OrdertableDAO orderDAO = new OrdertableDAOImpl();

        List<Ordertable> orderList =
                orderDAO.getOrdersByUserId(user.getUserId());

        // Fetch Restaurant Name for each order
        RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();

        for (Ordertable order : orderList) {

            Restaurant restaurant =
                    restaurantDAO.getRestaurant(order.getRestaurantID());

            if (restaurant != null) {

                order.setRestaurantName(restaurant.getName());

            }

        }

        request.setAttribute("orderList", orderList);
        if (orderList == null || orderList.isEmpty()) {

            request.setAttribute("message", "No orders found.");

        }

        request.getRequestDispatcher("/orderhistory.jsp")
               .forward(request, response);

    }

}
