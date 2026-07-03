<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.Model.Ordertable"%>

<%
List<Ordertable> orderList =
(List<Ordertable>)request.getAttribute("orderList");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodieHub | My Orders</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#f5f5f5;
}

/* ================= NAVBAR ================= */

nav{
    height:70px;
    width:100%;
    background:linear-gradient(135deg,#ff6b35,#ff914d);

    display:flex;
    justify-content:space-between;
    align-items:center;

    padding:0 50px;

    position:sticky;
    top:0;
    z-index:1000;

    box-shadow:0 3px 12px rgba(0,0,0,.15);
}

.logo{
    color:#fff;
    font-size:30px;
    font-weight:700;
}

.links{
    display:flex;
    gap:15px;
}

.links a{
    text-decoration:none;
    color:white;
    padding:10px 18px;
    border-radius:8px;
    font-weight:600;
    transition:.3s;
}

.links a:hover{
    background:white;
    color:#ff6b35;
}

/* ================= HEADER ================= */

.header{

    width:90%;
    max-width:900px;

    margin:30px auto;

    background:white;

    padding:28px;

    border-radius:15px;

    box-shadow:0 5px 15px rgba(0,0,0,.08);

}

.header h1{

    font-size:34px;

    color:#222;

    margin-bottom:8px;

}

.header p{

    color:#666;

    font-size:16px;

}

/* ================= CONTAINER ================= */

.container{

    width:90%;
    max-width:900px;

    margin:auto;

    display:flex;
    flex-direction:column;
    gap:18px;

    padding-bottom:40px;

}

/* ================= EMPTY ================= */

.empty{

    background:white;

    border-radius:15px;

    text-align:center;

    padding:60px 30px;

    box-shadow:0 4px 12px rgba(0,0,0,.08);

}

.empty h2{

    color:#444;

    margin-bottom:10px;

    font-size:28px;

}

.empty p{

    color:#777;

    margin-bottom:25px;

}

.start-btn{

    display:inline-block;

    text-decoration:none;

    background:#ff6b35;

    color:white;

    padding:12px 24px;

    border-radius:8px;

    font-weight:600;

    transition:.3s;

}

.start-btn:hover{

    background:#e95a20;

}

/* ================= ORDER CARD ================= */

.order-card{

    background:white;

    border-radius:15px;

    overflow:hidden;

    box-shadow:0 4px 12px rgba(0,0,0,.08);

    transition:.3s;

}

.order-card:hover{

    transform:translateY(-4px);

    box-shadow:0 10px 22px rgba(0,0,0,.15);

}

/* ================= CARD HEADER ================= */

.order-header{

    background:#fff4ed;

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:15px 22px;

}

.order-number{

    font-size:20px;

    font-weight:700;

    color:#ff6b35;

}

/* ================= STATUS ================= */

.status{

    color:white;

    font-size:12px;

    font-weight:600;

    padding:6px 16px;

    border-radius:20px;

    text-transform:capitalize;

}

.placed{

    background:#3498db;

}

.preparing{

    background:#f39c12;

}

.delivered{

    background:#2ecc71;

}

.cancelled{

    background:#e74c3c;

}

/* ================= CARD BODY ================= */

.order-body{

    display:grid;

    grid-template-columns:repeat(2,1fr);

    gap:15px;

    padding:20px;

}

.info{

    background:#fafafa;

    border:1px solid #eeeeee;

    border-radius:10px;

    padding:12px 15px;

}

.label{

    color:#888;

    font-size:12px;

    margin-bottom:5px;

}

.value{

    color:#222;

    font-size:16px;

    font-weight:600;

}

/* ================= FOOTER ================= */

.card-footer{

    display:flex;

    justify-content:flex-end;

    padding:0 20px 20px;

}

.details-btn{

    text-decoration:none;

    background:#ff6b35;

    color:white;

    padding:10px 18px;

    border-radius:8px;

    font-size:14px;

    font-weight:600;

    transition:.3s;

}

.details-btn:hover{

    background:#e95a20;

}

/* ================= MOBILE ================= */

@media(max-width:768px){

nav{

    flex-direction:column;

    justify-content:center;

    height:auto;

    padding:15px;

    gap:10px;

}

.links{

    flex-wrap:wrap;

    justify-content:center;

}

.header{

    width:95%;

    padding:22px;

}

.header h1{

    font-size:28px;

}

.container{

    width:95%;

}

.order-body{

    grid-template-columns:1fr;

}

.order-number{

    font-size:18px;

}

.status{

    font-size:11px;

}

.details-btn{

    width:100%;

    text-align:center;

}

}

</style>
</head>

<body>

<!-- ================= NAVBAR ================= -->

<nav>

    <div class="logo">
        &#127828; FoodieHub
    </div>

    <div class="links">
        <a href="callRestaurantServlet">
            &#127968; Home
        </a>

        <a href="cart.jsp">
            &#128722; Cart
        </a>
         <!-- 👤 BACK TO PROFILE / PREVIOUS PAGE -->
        <a href="profile.jsp">
            👤 Profile
        </a>
    </div>

</nav>

<!-- ================= PAGE HEADER ================= -->

<div class="header">

    <h1>&#128203; My Orders</h1>

    <p>
        View your order history, payment details and delivery status.
    </p>

</div>

<!-- ================= ORDER CONTAINER ================= -->

<div class="container">

<%

if(orderList==null || orderList.isEmpty()){

%>

    <div class="empty">

        <h2>&#127869; No Orders Yet</h2>

        <p>
            You haven't placed any orders yet.
        </p>

        <a href="callRestaurantServlet" class="start-btn">
            Start Ordering
        </a>

    </div>

<%

}else{

for(Ordertable order : orderList){

String css="placed";

if("Preparing".equalsIgnoreCase(order.getStatus()))
    css="preparing";
else if("Delivered".equalsIgnoreCase(order.getStatus()))
    css="delivered";
else if("Cancelled".equalsIgnoreCase(order.getStatus()))
    css="cancelled";

%>

<!-- ================= ORDER CARD ================= -->

<div class="order-card">

    <!-- Header -->

    <div class="order-header">

        <div class="order-number">

            &#128230; Order <%=order.getOrderID()%>

        </div>

        <div class="status <%=css%>">

            <%=order.getStatus()%>

        </div>

    </div>

    <!-- Body -->

    <div class="order-body">

        <div class="info">

            <div class="label">

                &#127860; Restaurant

            </div>

            <div class="value">

      <%=order.getRestaurantName()%>

            </div>

        </div>

        <div class="info">

            <div class="label">

                &#128197; Ordered On

            </div>

            <div class="value">

                <%=order.getOrderDate()%>

            </div>

        </div>

        <div class="info">

            <div class="label">

                &#128179; Payment

            </div>

            <div class="value">

                <%=order.getPaymentMethod()%>

            </div>

        </div>

        <div class="info">

            <div class="label">

                &#128184; Amount Paid

            </div>

            <div class="value">

                &#8377; <%=String.format("%.2f",order.getTotalAmount())%>

            </div>

        </div>

    </div>

    <!-- Footer -->

    <div class="card-footer">

        <a href="OrderDetailsServlet?orderId=<%=order.getOrderID()%>"
           class="details-btn">

            View Details &#10140;

        </a>

    </div>

</div>

<%

}

}

%>

</div>

</body>
</html>