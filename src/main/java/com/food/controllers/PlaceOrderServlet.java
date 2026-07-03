package com.food.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import com.food.Model.Cart;
import com.food.Model.CartItem;
import com.food.Model.User;
import com.food.utility.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loggedUser");
        Cart cart = (Cart) session.getAttribute("cart");
        Integer restaurantId = (Integer) session.getAttribute("restaurantId");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        String paymentMethod = request.getParameter("payment");

        float subtotal = cart.getGrandTotal();
        float deliveryCharge = 40;
        float gst = subtotal * 0.05f;
        float finalAmount = subtotal + deliveryCharge + gst;

        Connection con = null;
        PreparedStatement orderStmt = null;
        PreparedStatement itemStmt = null;
        ResultSet rs = null;

        try {

            con = DBConnection.getDBConnection();

            con.setAutoCommit(false);

            String orderQuery =
                    "INSERT INTO ordertable(UserID,RestaurantID,OrderDate,TotalAmount,Status,PaymentMethod) VALUES(?,?,?,?,?,?)";

            orderStmt = con.prepareStatement(
                    orderQuery,
                    PreparedStatement.RETURN_GENERATED_KEYS);

            orderStmt.setInt(1, user.getUserId());
            orderStmt.setInt(2, restaurantId);
            orderStmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            orderStmt.setFloat(4, finalAmount);
            orderStmt.setString(5, "Placed");
            orderStmt.setString(6, paymentMethod);

            orderStmt.executeUpdate();

            rs = orderStmt.getGeneratedKeys();

            int orderId = 0;

            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            String itemQuery =
                    "INSERT INTO orderitem(OrderID,MenuID,Quantity,ItemTotal) VALUES(?,?,?,?)";

            itemStmt = con.prepareStatement(itemQuery);

            for (CartItem item : cart.getItems().values()) {

                itemStmt.setInt(1, orderId);
                itemStmt.setInt(2, item.getMenuID());
                itemStmt.setInt(3, item.getQuantity());
                itemStmt.setFloat(4, item.getTotalPrice());

                itemStmt.addBatch();
            }

            itemStmt.executeBatch();

            con.commit();

            session.removeAttribute("cart");

            request.setAttribute("orderId", orderId);
            request.setAttribute("finalAmount", finalAmount);
        }
        catch (Exception e) {

            e.printStackTrace();

            try {

                if (con != null) {
                    con.rollback();
                }

            } catch (Exception ex) {

                ex.printStackTrace();

            }

        }
        finally {

            try {

                if (rs != null)
                    rs.close();

                if (itemStmt != null)
                    itemStmt.close();

                if (orderStmt != null)
                    orderStmt.close();

                if (con != null) {

                    con.setAutoCommit(true);
                    con.close();

                }

            } catch (Exception e) {

                e.printStackTrace();

            }

        }

        request.getRequestDispatcher("placeorder.jsp")
               .forward(request, response);

    }

}