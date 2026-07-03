package com.food.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.food.Model.Menu;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/FavoriteServlet")
public class FavoriteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession();

        // Get existing favorites
        List<Menu> favList =
                (List<Menu>) session.getAttribute("favList");

        if (favList == null) {
            favList = new ArrayList<>();
        }

        // Get data from request
        int menuId = Integer.parseInt(req.getParameter("menuId"));
        int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
        String itemName = req.getParameter("itemName");
        float price = Float.parseFloat(req.getParameter("price"));
        String imagePath = req.getParameter("imagePath");

        // check duplicate
        for (Menu m : favList) {
            if (m.getMenuID() == menuId) {
                resp.sendRedirect("favorite.jsp");
                return;
            }
        }

        // CREATE OBJECT FIRST (IMPORTANT FIX)
        Menu fav = new Menu();
        fav.setMenuID(menuId);
        fav.setRestaurantID(restaurantId);
        fav.setItemName(itemName);
        fav.setPrice(price);
        fav.setImagePath(imagePath);

        // add to list
        favList.add(fav);

        // store in session
        session.setAttribute("favList", favList);

        resp.sendRedirect(req.getContextPath() + "/favorite.jsp");
    }
}