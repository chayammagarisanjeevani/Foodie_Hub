package com.food.controllers;

import java.io.IOException;

import com.food.Model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

  //  private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // No session
        if (session == null) {
            response.sendRedirect("cart.jsp");
            return;
        }

        // Get cart from session
        Cart cart = (Cart) session.getAttribute("cart");

        // Cart is empty
        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        // Forward to checkout page
        request.getRequestDispatcher("/checkout.jsp")
               .forward(request, response);
    }
}