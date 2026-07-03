<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="com.food.Model.CartItem"%>
<%@page import="com.food.Model.Cart"%>
<%@page import="java.util.Map"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#f2f3f7;
}

.navbar{
    background:#fff;
    padding:20px 80px;
    font-size:30px;
    font-weight:bold;
    color:#fc8019;
    box-shadow:0 3px 12px rgba(0,0,0,.1);
}

.container{
    width:85%;
    margin:40px auto;
    display:flex;
    gap:35px;
    align-items:flex-start;
}

.cart-items{
    flex:2;
}

.cart-card{
    background:white;
    border-radius:20px;
    padding:25px;
    margin-bottom:25px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 5px 15px rgba(0,0,0,.08);
    transition:0.3s;
}

.cart-card:hover{
    transform:translateY(-5px);
}

.left{
    display:flex;
    align-items:center;
    gap:20px;
}

.food-img{
    width:130px;
    height:100px;
    object-fit:cover;
    border-radius:15px;
}

.item-details h3{
    color:#222;
    font-size:22px;
    margin-bottom:10px;
}

.price{
    color:#fc8019;
    font-size:20px;
    font-weight:bold;
    margin-bottom:8px;
}

.total{
    color:#777;
}

.right{
    display:flex;
    flex-direction:column;
    align-items:center;
    gap:20px;
}

.quantity{
    display:flex;
    align-items:center;
    gap:15px;
}

.qty{
    font-size:20px;
    font-weight:bold;
}

.qty-btn{
    width:42px;
    height:42px;
    border:none;
    border-radius:50%;
    background:#1ba672;
    color:white;
    font-size:20px;
    cursor:pointer;
}

.qty-btn:hover{
    background:#15905f;
}

.remove-btn{
    border:none;
    background:#ff4d4d;
    color:white;
    padding:12px 18px;
    border-radius:10px;
    cursor:pointer;
}

.remove-btn:hover{
    background:#e53935;
}

.summary{
    flex:1;
    background:white;
    padding:30px;
    border-radius:20px;
    box-shadow:0 5px 15px rgba(0,0,0,.08);
    position:sticky;
    top:100px;
}

.summary h2{
    margin-bottom:25px;
    color:#333;
}

.row{
    display:flex;
    justify-content:space-between;
    margin:20px 0;
    color:#666;
}

.total-row{
    display:flex;
    justify-content:space-between;
    margin-top:25px;
    font-size:20px;
    font-weight:bold;
}

/* Add More Items Button */
.add-more-btn{
    width:100%;
    padding:16px;
    margin-top:25px;
    margin-bottom:15px;
    background:#fc8019;
    color:#fff;
    border:none;
    border-radius:12px;
    font-size:17px;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
    display:block;
    text-align:center;
    text-decoration:none;
}

.add-more-btn:hover{
    background:#e56f00;
}

.checkout-btn{
    width:100%;
    padding:16px;
    margin-top:30px;
    background:#1ba672;
    color:white;
    border:none;
    border-radius:12px;
    font-size:18px;
    cursor:pointer;
}

.checkout-btn:hover{
    background:#15905f;
}
</style>

</head>

<body>

<div class="navbar">
    FoodieHub Cart
</div>

<%
Cart cart = (Cart) session.getAttribute("cart");

if(cart != null && !cart.getItems().isEmpty()){

float grandTotal = cart.getGrandTotal();

int restaurantId = cart.getItems()
                        .values()
                        .iterator()
                        .next()
                        .getRestaurantID();
%>

<div class="container">

    <div class="cart-items">

    <%
    for(CartItem item : cart.getItems().values()){

        int qty = item.getQuantity();
        int increaseQty = qty + 1;
        int decreaseQty = qty - 1;
    %>

    <div class="cart-card">

        <div class="left">

            <img src="<%=item.getImagePath()%>"
                 class="food-img"
                 alt="<%=item.getName()%>">

            <div class="item-details">

                <h3><%=item.getName()%></h3>

                <div class="price">
                    ₹<%=item.getPrice()%>
                </div>

                <div class="total">
                    Total : ₹<%=item.getTotalPrice()%>
                </div>

            </div>

        </div>

        <div class="right">

            <div class="quantity">

                <!-- Minus -->
                <form action="CartServlet" method="post">

                    <input type="hidden" name="menuId" value="<%=item.getMenuID()%>">
                    <input type="hidden" name="restaurantId" value="<%=item.getRestaurantID()%>">

                    <%
                    if(decreaseQty <= 0){
                    %>
                        <input type="hidden" name="action" value="delete">
                    <%
                    } else {
                    %>
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="quantity" value="<%=decreaseQty%>">
                    <%
                    }
                    %>

                    <button class="qty-btn" type="submit">-</button>
                </form>

                <span class="qty"><%=qty%></span>

                <!-- Plus -->
                <form action="CartServlet" method="post">

                    <input type="hidden" name="menuId" value="<%=item.getMenuID()%>">
                    <input type="hidden" name="restaurantId" value="<%=item.getRestaurantID()%>">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="quantity" value="<%=increaseQty%>">

                    <button class="qty-btn" type="submit">+</button>
                </form>

            </div>

            <!-- Remove -->
            <form action="CartServlet" method="post">

                <input type="hidden" name="menuId" value="<%=item.getMenuID()%>">
                <input type="hidden" name="restaurantId" value="<%=item.getRestaurantID()%>">
                <input type="hidden" name="action" value="delete">

                <button class="remove-btn" type="submit">
                    Remove
                </button>

            </form>

        </div>

    </div>

    <%
    }
    %>

    </div>

    <!-- SUMMARY -->
    <div class="summary">

        <h2>Bill Details</h2>

        <div class="row">
            <span>Item Total</span>
            <span>₹<%=grandTotal%></span>
        </div>

        <div class="row">
            <span>Delivery Fee</span>
            <span>₹40</span>
        </div>

        <div class="row">
            <span>GST & Charges</span>
            <span>₹20</span>
        </div>

        <hr>

        <div class="total-row">
            <span>Total Amount</span>
            <span>₹<%=grandTotal + 60%></span>
        </div>

        <!-- ADD MORE ITEMS (FIXED) -->
        <a class="add-more-btn"
           href="menu?restaurantId=<%=restaurantId%>">
            🍽 Add More Items
        </a>

        <!-- Checkout -->
        <button class="checkout-btn"
                onclick="window.location.href='checkout.jsp'">
            Proceed to Checkout
        </button>

    </div>

</div>

<%
} else {
%>

<div style="text-align:center;margin-top:120px;">
    <h1>Your Cart is Empty 🛒</h1>
    <br>
    <a href="callRestaurantServlet"
       style="text-decoration:none;background:#fc8019;color:white;padding:15px 25px;border-radius:10px;">
       Browse Restaurants
    </a>
</div>

<%
}
%>

</body>
</html>