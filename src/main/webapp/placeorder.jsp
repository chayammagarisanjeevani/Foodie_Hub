<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Integer orderId = (Integer)request.getAttribute("orderId");
Float finalAmount = (Float)request.getAttribute("finalAmount");

if(orderId == null){
    orderId = 0;
}

if(finalAmount == null){
    finalAmount = 0f;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Confirmed | FoodieHub</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#f5f5f5;
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;
}

.container{

    width:700px;
    background:white;
    border-radius:18px;
    overflow:hidden;
    box-shadow:0 10px 30px rgba(0,0,0,.12);

}

.top{

    background:linear-gradient(135deg,#ff6b35,#ff8c42);
    color:white;
    text-align:center;
    padding:45px;

}

.tick{

    width:90px;
    height:90px;
    background:white;
    color:#ff6b35;
    margin:auto;
    border-radius:50%;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:48px;
    font-weight:bold;

}

.top h1{

    margin-top:20px;
    font-size:34px;

}

.top p{

    margin-top:10px;
    opacity:.95;
    font-size:17px;

}

.details{

    padding:35px;

}

.card{

    background:#fafafa;
    border-radius:12px;
    padding:22px;
    margin-bottom:25px;

}

.row{

    display:flex;
    justify-content:space-between;
    padding:10px 0;
    border-bottom:1px solid #ececec;

}

.row:last-child{

    border:none;

}

.label{

    color:#777;

}

.value{

    font-weight:600;

}

.success{

    text-align:center;
    color:#27ae60;
    font-weight:bold;
    margin-bottom:25px;
    font-size:18px;

}

.buttons{

    display:flex;
    justify-content:center;
    gap:20px;
    margin-top:25px;

}

.btn{

    padding:14px 28px;
    border:none;
    border-radius:10px;
    cursor:pointer;
    font-size:16px;
    text-decoration:none;
    transition:.3s;

}

.home{

    background:#ff6b35;
    color:white;

}

.home:hover{

    background:#e85a27;

}

.history{

    background:#2d3436;
    color:white;

}

.history:hover{

    background:black;

}

.footer{

    text-align:center;
    color:#888;
    padding:25px;
    font-size:14px;

}

</style>

</head>
<body>

<div class="container">

<div class="top">

<div class="tick">
✓
</div>

<h1>Order Placed Successfully</h1>

<p>Your delicious food is being prepared 🍔</p>

</div>


<div class="details">

<div class="success">

Thank you for ordering with <b>FoodieHub</b> ❤️

</div>

<div class="card">

<div class="row">
<span class="label">Order ID</span>
<span class="value">#<%=orderId%></span>
</div>

<div class="row">
<span class="label">Payment Status</span>
<span class="value">Confirmed</span>
</div>

<div class="row">
<span class="label">Order Status</span>
<span class="value">Preparing 🍳</span>
</div>

<div class="row">
<span class="label">Estimated Delivery</span>
<span class="value">30 - 40 mins</span>
</div>

<div class="row">
<span class="label">Total Paid</span>
<span class="value">₹ <%=String.format("%.2f",finalAmount)%></span>
</div>

</div>

<div class="buttons">

<a href="OrderHistoryServlet" class="btn history">
📜 View Orders
</a>

<a href="callRestaurantServlet" class="btn home">
🏠 Back to Home
</a>

</div>

</div>

<div class="footer">

Made with ❤️ by FoodieHub • Fast Delivery • Fresh Food

</div>

</div>

</body>
</html>