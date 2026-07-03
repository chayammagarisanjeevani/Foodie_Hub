<%@page import="java.util.List"%>
<%@page import="com.food.Model.Ordertable"%>
<%@page import="com.food.Model.Orderitem"%>

<%
Ordertable order=(Ordertable)request.getAttribute("order");

List<Orderitem> itemList=
(List<Orderitem>)request.getAttribute("itemList");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Order Details | FoodieHub</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#f5f5f5;
}

/* ================= NAVBAR ================= */

.navbar{

    height:75px;

    background:linear-gradient(135deg,#ff6b35,#ff914d);

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:0 60px;

    color:white;

    box-shadow:0 4px 12px rgba(0,0,0,.15);
}

.logo{

    font-size:30px;

    font-weight:bold;
}

.nav-links{

    display:flex;

    gap:20px;
}

.nav-links a{

    text-decoration:none;

    color:white;

    background:rgba(255,255,255,.15);

    padding:10px 20px;

    border-radius:8px;

    transition:.3s;
}

.nav-links a:hover{

    background:white;

    color:#ff6b35;
}

/* ================= CONTAINER ================= */

.container{

    width:90%;

    max-width:1000px;

    margin:35px auto;
}

/* ================= SUMMARY ================= */

.summary{

    background:white;

    border-radius:16px;

    padding:28px;

    box-shadow:0 8px 18px rgba(0,0,0,.08);

    margin-bottom:30px;
}

.summary h1{

    color:#ff6b35;

    margin-bottom:22px;

    font-size:32px;
}

.summary-grid{

    display:grid;

    grid-template-columns:repeat(2,1fr);

    gap:18px;
}

.box{

    background:#fafafa;

    padding:18px;

    border-radius:10px;
}

.label{

    font-size:14px;

    color:#777;

    margin-bottom:8px;
}

.value{

    font-size:18px;

    font-weight:bold;

    color:#333;
}

.status{

    display:inline-block;

    padding:8px 16px;

    border-radius:25px;

    background:#ff9800;

    color:white;

    font-size:14px;

    font-weight:bold;
}

/* ================= ORDER ITEMS ================= */

.items-title{

    text-align:center;

    font-size:28px;

    color:#333;

    margin-bottom:20px;
}

/* Cards One Below Another */

.items{

    display:flex;

    flex-direction:column;

    align-items:center;

    gap:16px;
}

/* Small Cards */

.item-card{

    width:100%;

    max-width:520px;

    background:white;

    border-radius:12px;

    padding:18px 22px;

    box-shadow:0 5px 12px rgba(0,0,0,.08);

    transition:.3s;
}

.item-card:hover{

    transform:translateY(-3px);

    box-shadow:0 10px 18px rgba(0,0,0,.12);
}

.item-card h2{

    color:#ff6b35;

    font-size:22px;

    margin-bottom:15px;
}

.info{

    display:flex;

    justify-content:space-between;

    margin:10px 0;

    font-size:16px;
}

.info span:first-child{

    color:#666;
}

.info span:last-child{

    font-weight:bold;
}

/* ================= TOTAL BOX ================= */

.total-box{

    margin-top:35px;

    background:white;

    padding:28px;

    border-radius:16px;

    box-shadow:0 8px 18px rgba(0,0,0,.08);

    text-align:center;
}

.total-box h2{

    color:#27ae60;

    font-size:30px;
}

/* ================= BUTTONS ================= */

.buttons{

    display:flex;

    justify-content:center;

    gap:20px;

    margin-top:30px;

    flex-wrap:wrap;
}

.btn{

    text-decoration:none;

    padding:14px 28px;

    border-radius:8px;

    font-size:16px;

    font-weight:bold;

    transition:.3s;
}

.home{

    background:#ff6b35;

    color:white;
}

.home:hover{

    background:#e85b24;
}

.history{

    background:#2d3436;

    color:white;
}

.history:hover{

    background:#000;
}

/* ================= MOBILE ================= */

@media(max-width:768px){

.summary-grid{

    grid-template-columns:1fr;
}

.navbar{

    flex-direction:column;

    height:auto;

    padding:20px;

    gap:15px;
}

.logo{

    font-size:26px;
}

.item-card{

    max-width:100%;
}

.buttons{

    flex-direction:column;
}

.btn{

    width:100%;
    text-align:center;
}

}

</style>

</head>

<body>
<div class="navbar">

    <div class="logo">
        &#127828; FoodieHub
    </div>

    <div class="nav-links">

        <a href="callRestaurantServlet">
            &#127968; Home
        </a>

        <a href="OrderHistoryServlet">
            &#128196; Orders
        </a>

    </div>

</div>


<div class="container">

    <div class="summary">

        <h1>Order Details</h1>

        <div class="summary-grid">

            <div class="box">
                <div class="label">
                    Order ID
                </div>

                <div class="value">
                    <%=order.getOrderID()%>
                </div>
            </div>

            <div class="box">
                <div class="label">
                    Status
                </div>

                <div class="value">
                    <span class="status">
                        <%=order.getStatus()%>
                    </span>
                </div>
            </div>

            <div class="box">
                <div class="label">
                    Payment Method
                </div>

                <div class="value">
                    <%=order.getPaymentMethod()%>
                </div>
            </div>

            <div class="box">
                <div class="label">
                    Order Date
                </div>

                <div class="value">
                    <%=order.getOrderDate()%>
                </div>
            </div>

            <div class="box">
                <div class="label">
                    Grand Total
                </div>

                <div class="value">
                    &#8377; <%=String.format("%.2f",order.getTotalAmount())%>
                </div>
            </div>

        </div>

    </div>


    <h2 class="items-title">
        Ordered Items
    </h2>

    <div class="items">

<%
if(itemList!=null){

    for(Orderitem item:itemList){
%>

        <div class="item-card">

            <h2>
                &#127869; Menu Item
            </h2>

            <div class="info">
                <span>Menu ID</span>
                <span><%=item.getMenuID()%></span>
            </div>

            <div class="info">
                <span>Quantity</span>
                <span><%=item.getQuantity()%></span>
            </div>

            <div class="info">
                <span>Item Total</span>
                <span>&#8377; <%=String.format("%.2f",item.getItemTotal())%></span>
            </div>

        </div>

<%
    }
}
%>

    </div>
        <div class="total-box">

        <h2>Total Paid</h2>

        <br>

        <h2>
            &#8377; <%=String.format("%.2f", order.getTotalAmount())%>
        </h2>

        <div class="buttons">

            <a href="OrderHistoryServlet" class="btn history">
                &#128196; Back to Orders
            </a>

            <a href="callRestaurantServlet" class="btn home">
                &#127968; Continue Ordering
            </a>

        </div>

    </div>

</div>

</body>

</html>