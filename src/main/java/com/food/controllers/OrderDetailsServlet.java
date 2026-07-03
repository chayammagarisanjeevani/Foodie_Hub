package com.food.controllers;

import java.io.IOException;
import java.util.List;

import com.food.DAO.OrderitemDAO;
import com.food.DAO.OrdertableDAO;
import com.food.DAOImpl.OrderitemDAOImpl;
import com.food.DAOImpl.OrdertableDAOImpl;
import com.food.Model.Orderitem;
import com.food.Model.Ordertable;
import com.food.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/OrderDetailsServlet")
public class OrderDetailsServlet extends HttpServlet {

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

        int orderId = Integer.parseInt(request.getParameter("orderId"));

        OrdertableDAO orderDAO = new OrdertableDAOImpl();

        OrderitemDAO itemDAO = new OrderitemDAOImpl();

        Ordertable order = orderDAO.getOrdertable(orderId);

        List<Orderitem> itemList =
                itemDAO.getOrderItemsByOrderId(orderId);

        request.setAttribute("order", order);

        request.setAttribute("itemList", itemList);
        request.getRequestDispatcher("/orderdetails.jsp")
        .forward(request, response);

}

}
