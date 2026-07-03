package com.food.controllers;

import java.io.IOException;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.Model.Cart;
import com.food.Model.CartItem;
import com.food.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        Integer restaurantId = (Integer) session.getAttribute("restaurantId");
        int newRestaurantId = Integer.parseInt(req.getParameter("restaurantId"));

        // Create a new cart if cart is null or restaurant changes
        if (cart == null || restaurantId == null || restaurantId != newRestaurantId) {

            cart = new Cart();

            session.setAttribute("cart", cart);
            session.setAttribute("restaurantId", newRestaurantId);
        }

        String action = req.getParameter("action");

        if ("add".equals(action)) {

            addItemToCart(req, cart);

        } else if ("update".equals(action)) {

            updateItemToCart(req, cart);

        } else if ("delete".equals(action)) {

            deleteItemFromCart(req, cart);
        }

        session.setAttribute("cart", cart);

        resp.sendRedirect("cart.jsp");
    }


    // ADD ITEM
    private void addItemToCart(HttpServletRequest req, Cart cart) {

        int menuId = Integer.parseInt(req.getParameter("menuId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        MenuDAOImpl menuDAOImpl = new MenuDAOImpl();

        Menu menu = menuDAOImpl.getMenu(menuId);

        CartItem cartItem = new CartItem(
                menu.getMenuID(),
                menu.getRestaurantID(),
                menu.getItemName(),
                menu.getPrice(),
                quantity);

        cartItem.setImagePath(menu.getImagePath());

        cart.addItem(cartItem);
    }


    // UPDATE ITEM
    private void updateItemToCart(HttpServletRequest req, Cart cart) {

        int menuId = Integer.parseInt(req.getParameter("menuId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        cart.updateItem(menuId, quantity);
    }


    // DELETE ITEM
    private void deleteItemFromCart(HttpServletRequest req, Cart cart) {

        int menuId = Integer.parseInt(req.getParameter("menuId"));

        cart.removeItem(menuId);
    }

}