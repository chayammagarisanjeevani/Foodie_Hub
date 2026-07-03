<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="com.food.Model.Cart"%>
<%@page import="com.food.Model.CartItem"%>

<%
Cart cart=(Cart)session.getAttribute("cart");

if(cart==null || cart.getItems().isEmpty()){
    response.sendRedirect("cart.jsp");
    return;
}

double deliveryCharge=40;
double gst=cart.getGrandTotal()*0.05;
double finalAmount=cart.getGrandTotal()+deliveryCharge+gst;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout | FoodieHub</title>
<style>
/* ================= GOOGLE FONT ================= */

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#f7f8fc;
}

/* ================= NAVBAR ================= */

.navbar{

    width:100%;
    height:90px;

    background:linear-gradient(135deg,#ff6b35,#ff914d);

    display:flex;
    justify-content:space-between;
    align-items:center;

    padding:0 50px;

    color:white;

    box-shadow:0 5px 18px rgba(0,0,0,.15);

}

.logo{

    font-size:30px;
    font-weight:bold;

}

.logo span{

    color:white;

}

.nav-title{

    text-align:center;

}

.nav-title h2{

    font-size:34px;
    font-weight:700;

}

.nav-title p{

    margin-top:5px;

    font-size:15px;

    opacity:.9;

}

.cart-link a{

    text-decoration:none;

    color:white;

    font-size:18px;

    font-weight:600;

    padding:12px 22px;

    border-radius:30px;

    border:2px solid rgba(255,255,255,.4);

    transition:.3s;

}

.cart-link a:hover{

    background:white;

    color:#ff6b35;

}

/* ================= MAIN ================= */

.checkout-container{

    display:flex;

    gap:35px;

    padding:40px;

    align-items:flex-start;

}

/* LEFT */

.checkout-left{

    flex:2;

}

/* RIGHT */

.checkout-right{

    flex:1;

    position:sticky;

    top:25px;

}

/* ================= CARD ================= */

.card{

    background:white;

    border-radius:18px;

    padding:20px;

    box-shadow:0 10px 30px rgba(0,0,0,.08);

}

.card h2{

    font-size:26px;

    color:#333;

    margin-bottom:25px;

}

/* ================= FORM ================= */

.form-group{
    margin-bottom:14px;
}

.form-group label{
    margin-bottom:5px;
    font-size:14px;
}

.form-group input,
.form-group textarea,
.form-group select{

    width:100%;

    padding:10px 14px;

    border-radius:12px;

    border:1px solid #ddd;

    outline:none;

    font-size:15px;

    background:#fafafa;

    transition:.3s;

}

.form-group input:focus,
.form-group textarea:focus,
.form-group select:focus{

    border-color:#ff6b35;

    background:white;

    box-shadow:0 0 8px rgba(255,107,53,.2);

}

textarea{

    resize:none;

}

.double-field{

    display:flex;

    gap:18px;

}

.double-field .form-group{

    flex:1;

}
/* ================= ORDER SUMMARY ================= */

.order-items{

    margin-bottom:25px;

}

.order-item{

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:18px 0;

    border-bottom:1px solid #f1f1f1;

}

.order-item:last-child{

    border-bottom:none;

}

.food-name{

    font-size:17px;

    font-weight:600;

    color:#333;

}

.qty{

    margin-top:6px;

    color:#777;

    font-size:14px;

}

.price{

    color:#ff6b35;

    font-size:18px;

    font-weight:bold;

}

/* ================= BILL SUMMARY ================= */

.bill-summary{

    margin-top:20px;

    border-top:2px dashed #ddd;

    padding-top:20px;

}

.bill-row{

    display:flex;

    justify-content:space-between;

    margin:14px 0;

    font-size:16px;

    color:#555;

}

.grand-total{

    margin-top:18px;

    padding-top:18px;

    border-top:2px solid #eee;

    font-size:23px;

    font-weight:bold;

    color:#ff6b35;

}

/* ================= BUTTON ================= */

.place-order-btn{

    width:100%;

    margin-top:30px;

    padding:16px;

    border:none;

    border-radius:14px;

    background:linear-gradient(135deg,#ff6b35,#ff914d);

    color:white;

    font-size:18px;

    font-weight:700;

    cursor:pointer;

    transition:all .3s ease;

}

.place-order-btn:hover{

    transform:translateY(-3px);

    box-shadow:0 12px 25px rgba(255,107,53,.35);

}

/* ================= HOVER EFFECTS ================= */

.card{

    transition:all .3s ease;

}

.card:hover{

    transform:translateY(-4px);

    box-shadow:0 18px 35px rgba(0,0,0,.10);

}

/* ================= SCROLLBAR ================= */

::-webkit-scrollbar{

    width:8px;

}

::-webkit-scrollbar-thumb{

    background:#ff914d;

    border-radius:20px;

}

::-webkit-scrollbar-track{

    background:#f2f2f2;

}

/* ================= RESPONSIVE ================= */

@media(max-width:992px){

    .checkout-container{

        flex-direction:column;

    }

    .checkout-right{

        position:static;

        width:100%;

    }

    .checkout-left{

        width:100%;

    }

}

@media(max-width:768px){

    .navbar{

        flex-direction:column;

        height:auto;

        padding:20px;

        gap:15px;

        text-align:center;

    }

    .checkout-container{

        padding:20px;

    }

    .double-field{
    gap:12px;
    }

    .card{

        padding:20px;

    }

    .nav-title h2{

        font-size:28px;

    }

    .logo{

        font-size:24px;

    }

}

@media(max-width:480px){

    .checkout-container{

        padding:12px;

    }

    .card h2{
    margin-bottom:15px;
    font-size:23px;


    }

    .place-order-btn{

        font-size:16px;

    }

}
</style>

</head>
<body>

    <!-- =================== NAVBAR =================== -->

    <header class="navbar">

        <div class="logo">

            🍔 <span>FoodieHub</span>

        </div>

        <div class="nav-title">

            <h2>Checkout</h2>

            <p>Complete your delivery details</p>

        </div>

        <div class="cart-link">

            <a href="cart.jsp">

                🛒 Cart

            </a>

        </div>

    </header>

    <!-- =================== MAIN =================== -->

    <main class="checkout-container">

        <!-- LEFT SIDE -->

        <section class="checkout-left">

            <div class="card">

                <h2>

                    📍 Delivery Information

                </h2>

                <form action="PlaceOrderServlet" method="post">

                    <div class="form-group">

                        <label>

                            👤 Full Name

                        </label>

                        <input
                            type="text"
                            name="name"
                            placeholder="Enter your full name"
                            required>

                    </div>

                    <div class="form-group">

                        <label>

                            📱 Mobile Number

                        </label>

                        <input
                            type="tel"
                            name="phone"
                            placeholder="Enter mobile number"
                            required>

                    </div>

                    <div class="form-group">

                        <label>

                            🏠 House No, Street, Landmark

                        </label>

                        <textarea
                            name="address"
                            rows="2"
                            placeholder="Enter complete address"
                            required></textarea>

                    </div>

                    <div class="double-field">

                        <div class="form-group">

                            <label>

                                🏙 City

                            </label>

                            <input
                                type="text"
                                name="city"
                                placeholder="City"
                                required>

                        </div>

                        <div class="form-group">

                            <label>

                                📮 Pincode

                            </label>

                            <input
                                type="text"
                                name="pincode"
                                placeholder="Pincode"
                                required>

                        </div>

                    </div>

                    <div class="form-group">

                        <label>

                            💳 Payment Method

                        </label>

                        <select
                            name="payment"
                            required>

                            <option value="" selected disabled>

                                Select Payment Method

                            </option>

                            <option value="Cash On Delivery">

                                Cash On Delivery

                            </option>

                            <option value="UPI">

                                UPI

                            </option>

                            <option value="Credit Card">

                                Credit / Debit Card

                            </option>

                        </select>

                    </div>

            </div>

        </section>

        <!-- ================= RIGHT SIDE ================= -->

        <aside class="checkout-right">

            <div class="card">

                <h2>

                    🧾 Order Summary

                </h2>

                <div class="order-items">

                    <%
                    for(CartItem item : cart.getItems().values()){
                    %>

                    <div class="order-item">

                        <div>

                            <div class="food-name">

                                🍽 <%=item.getName()%>

                            </div>

                            <div class="qty">

                                Qty × <%=item.getQuantity()%>

                            </div>

                        </div>

                        <div class="price">

                            ₹ <%=item.getPrice()*item.getQuantity()%>

                        </div>

                    </div>

                    <%
                    }
                    %>
                                    <div class="bill-summary">

                    <div class="bill-row">

                        <span>Subtotal</span>

                        <span>₹ <%=cart.getGrandTotal()%></span>

                    </div>

                    <div class="bill-row">

                        <span>Delivery Fee</span>

                        <span>₹ 40</span>

                    </div>

                    <div class="bill-row">

                        <span>GST (5%)</span>

                        <span>₹ <%=String.format("%.2f",gst)%></span>

                    </div>

                    <div class="bill-row grand-total">

                        <span>Grand Total</span>

                        <span>

                            ₹ <%=String.format("%.2f",finalAmount)%>

                        </span>

                    </div>

                </div>

                <button type="submit" class="place-order-btn">

                    🛍 Place Order

                </button>

                </form>

            </div>

        </aside>

    </main>

</body></html>