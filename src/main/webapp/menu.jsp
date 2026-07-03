<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.Model.Menu"%>
<%@ page import="com.food.Model.Restaurant"%>

<%
Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
List<Menu> allMenuByRestaurant =
(List<Menu>) request.getAttribute("allMenuByRestaurant");
%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">

<title><%=restaurant.getName()%> | FoodieHub</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

/* RESET */
*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{
background:#f5f5f7;
}

/* NAVBAR */
nav{
height:70px;
background:#fff;
display:flex;
justify-content:space-between;
align-items:center;
padding:0 60px;
box-shadow:0 2px 12px rgba(0,0,0,.08);
position:sticky;
top:0;
z-index:999;
}

.logo{
font-size:28px;
font-weight:700;
color:#fc8019;
}

.back-btn{
text-decoration:none;
background:#fc8019;
color:#fff;
padding:10px 18px;
border-radius:30px;
font-weight:600;
}

/* RESTAURANT BOX */
.restaurant-box{
width:90%;
max-width:1200px;
margin:30px auto;
background:#fff;
padding:30px;
border-radius:20px;
text-align:center;
box-shadow:0 6px 18px rgba(0,0,0,.08);
}

.restaurant-title{
font-size:38px;
font-weight:700;
}

/* SEARCH */
.search{
width:70%;
max-width:650px;
padding:15px 22px;
border:1px solid #ddd;
border-radius:50px;
margin-top:15px;
}

/* MENU GRID */
.menu-container{
width:90%;
max-width:1200px;
margin:auto;
display:grid;
grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
gap:25px;
padding-bottom:40px;
}

/* CARD */
.menu-card{
position:relative;   /* ⭐ IMPORTANT for heart icon */
border-radius:12px;
overflow:hidden;
box-shadow:0 4px 12px rgba(0,0,0,0.15);
background:#fff;
display:flex;
flex-direction:column;
}

/* IMAGE */
.menu-card img{
width:100%;
height:180px;
object-fit:cover;
}

/* CONTENT */
.menu-content{
padding:16px;
}

.menu-content h2{
font-size:20px;
margin-bottom:6px;
}

.menu-content p{
font-size:13px;
color:#666;
margin-bottom:10px;
}

.price{
font-size:20px;
font-weight:700;
color:#fc8019;
}

/* ❤️ FAVORITE FORM */
.fav-form{
position:absolute;
top:10px;
right:10px;
z-index:10;
}

/* ❤️ BUTTON */
.fav-icon{
width:40px;
height:40px;
border-radius:50%;
border:none;
background:#fff;
color:#ff4d4d;
font-size:18px;
cursor:pointer;
box-shadow:0 3px 8px rgba(0,0,0,.25);
transition:0.3s;
}

.fav-icon:hover{
background:#ff4d4d;
color:#fff;
}

/* ADD TO CART */
.btn{
width:100%;
margin-top:12px;
padding:12px;
border:none;
border-radius:10px;
background:#fc8019;
color:white;
font-weight:600;
cursor:pointer;
}

.btn:hover{
background:#e56f00;
}

</style>

</head>

<body>

<nav>
<div class="logo">🍔 FoodieHub</div>
<a href="callRestaurantServlet" class="back-btn">← Restaurants</a>
</nav>

<div class="restaurant-box">
<h1 class="restaurant-title"><%=restaurant.getName()%></h1>

<input type="text" id="searchBox" class="search"
placeholder="🔍 Search your favourite dishes...">
</div>

<div class="menu-container">

<%
if(allMenuByRestaurant != null && !allMenuByRestaurant.isEmpty()){
for(Menu menu : allMenuByRestaurant){
%>

<div class="menu-card">

    <!-- ❤️ FAVORITE ICON -->
    <form action="FavoriteServlet" method="post" class="fav-form">

        <input type="hidden" name="menuId" value="<%=menu.getMenuID()%>">
        <input type="hidden" name="restaurantId" value="<%=menu.getRestaurantID()%>">
        <input type="hidden" name="itemName" value="<%=menu.getItemName()%>">
        <input type="hidden" name="price" value="<%=menu.getPrice()%>">
        <input type="hidden" name="imagePath" value="<%=menu.getImagePath()%>">

        <button type="submit" class="fav-icon">❤</button>

    </form>

    <!-- IMAGE -->
    <img src="<%=menu.getImagePath()%>" alt="<%=menu.getItemName()%>">

    <!-- CONTENT -->
    <div class="menu-content">

        <h2><%=menu.getItemName()%></h2>
        <p><%=menu.getDescription()%></p>

        <div class="price">₹<%=menu.getPrice()%></div>

        <!-- ADD TO CART -->
        <form action="CartServlet" method="post">

            <input type="hidden" name="menuId" value="<%=menu.getMenuID()%>">
            <input type="hidden" name="restaurantId" value="<%=menu.getRestaurantID()%>">
            <input type="hidden" name="quantity" value="1">
            <input type="hidden" name="action" value="add">

            <button type="submit" class="btn">🛒 Add to Cart</button>

        </form>

    </div>

</div>

<%
}
}else{
%>

<div style="grid-column:1/-1;text-align:center;padding:60px;">
<h2 style="color:#666;">No Menu Available</h2>
</div>

<%
}
%>

</div>

<script>
const search = document.getElementById("searchBox");

search.addEventListener("keyup", function () {
let value = this.value.toLowerCase();

document.querySelectorAll(".menu-card").forEach(card => {
let item = card.querySelector("h2").innerText.toLowerCase();

card.style.display = item.includes(value) ? "block" : "none";
});
});
</script>

</body>
</html>