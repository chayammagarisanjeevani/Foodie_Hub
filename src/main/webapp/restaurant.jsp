<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.food.Model.Restaurant"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodieHub | Restaurants</title>

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

html{
scroll-behavior:smooth;
}

body{
background:#f8f8f8;
color:#333;
overflow-x:hidden;
}

/*================ NAVBAR ================*/

nav{
position:fixed;
top:0;
left:0;
width:100%;
height:75px;
display:flex;
justify-content:space-between;
align-items:center;
padding:0 70px;
background:rgba(0,0,0,.30);
backdrop-filter:blur(12px);
z-index:1000;
transition:.3s;
}

.logo{
font-size:32px;
font-weight:700;
color:#fff;
}

.logo span{
color:#ffb347;
}

.nav-links{
display:flex;
gap:18px;
}

.nav-links a{
text-decoration:none;
color:white;
font-size:15px;
font-weight:600;
padding:10px 18px;
border-radius:25px;
transition:.3s;
}

.nav-links a:hover{
background:white;
color:#ff6b35;
}

/*================ HERO ================*/

.hero{
height:100vh;
background:
linear-gradient(rgba(0,0,0,.55),rgba(0,0,0,.55)),
url("https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=1800");
background-size:cover;
background-position:center;
background-repeat:no-repeat;
display:flex;
justify-content:center;
align-items:center;
text-align:center;
padding:20px;
}

.hero-content{
max-width:850px;
}

.hero-content h1{
font-size:65px;
font-weight:700;
color:white;
line-height:1.2;
margin-bottom:20px;
}

.hero-content p{
font-size:20px;
color:#eee;
margin-bottom:35px;
}

/*================ SEARCH ================*/

.search-box{
width:650px;
max-width:95%;
padding:18px 25px;
border:none;
outline:none;
border-radius:50px;
font-size:16px;
box-shadow:0 10px 25px rgba(0,0,0,.25);
}

/*================ SCROLL ================*/

.scroll-down{
position:absolute;
bottom:30px;
left:50%;
transform:translateX(-50%);
color:white;
font-size:15px;
animation:bounce 2s infinite;
cursor:pointer;
}

.scroll-down span{
display:block;
font-size:28px;
}

/*================ SECTION TITLE ================*/

.restaurant-heading{
padding:70px 20px 40px;
text-align:center;
background:white;
}

.restaurant-heading h2{
font-size:42px;
color:#222;
margin-bottom:10px;
}

.restaurant-heading p{
color:#666;
font-size:17px;
max-width:650px;
margin:auto;
}

.line{
width:80px;
height:4px;
margin:22px auto;
background:#ff6b35;
border-radius:30px;
}

/*================ RESTAURANT GRID ================*/

.restaurant-container{
width:92%;
margin:auto;
display:grid;
grid-template-columns:repeat(auto-fit,minmax(300px,1fr));
gap:30px;
padding-bottom:60px;
}

.restaurant-container a{
text-decoration:none;
color:inherit;
}

/*================ CARD ================*/

.card{
background:white;
border-radius:18px;
overflow:hidden;
box-shadow:0 8px 18px rgba(0,0,0,.08);
transition:.35s;
}

.card:hover{
transform:translateY(-8px);
box-shadow:0 15px 30px rgba(0,0,0,.15);
}

.card img{
width:100%;
height:220px;
object-fit:cover;
transition:.4s;
}

.card:hover img{
transform:scale(1.08);
}

.card-content{
padding:18px;
}

.card-content h2{
font-size:23px;
margin-bottom:10px;
}

.tag{
display:inline-block;
padding:6px 12px;
background:#fff3ec;
color:#ff6b35;
border-radius:20px;
font-size:13px;
font-weight:600;
margin-bottom:12px;
}

.info{
display:flex;
justify-content:space-between;
margin:15px 0;
font-size:14px;
}

.rating{
background:#16a34a;
color:white;
padding:5px 10px;
border-radius:6px;
}

.address{
color:#777;
font-size:14px;
line-height:1.6;
}

.view-btn{
margin-top:18px;
width:100%;
padding:12px;
border:none;
border-radius:10px;
background:#ff6b35;
color:white;
font-size:15px;
cursor:pointer;
transition:.3s;
}

.view-btn:hover{
background:#e65a21;
}

@keyframes bounce{

0%,20%,50%,80%,100%{
transform:translateX(-50%) translateY(0);
}

40%{
transform:translateX(-50%) translateY(-10px);
}

60%{
transform:translateX(-50%) translateY(-5px);
}

}

@media(max-width:768px){

nav{
padding:0 20px;
}

.hero-content h1{
font-size:42px;
}

.hero-content p{
font-size:17px;
}

.restaurant-heading h2{
font-size:34px;
}

}

</style>

</head>
<body>

<!-- ================= NAVBAR ================= -->

<nav>

    <div class="logo">
        🍔 <span>FoodieHub</span>
    </div>

    <div class="nav-links">

        <a href="home.jsp">Home</a>

        <a href="cart.jsp">Cart</a>

        <a href="profile.jsp">Profile</a>

        <a href="logout">Logout</a>

    </div>

</nav>

<!-- ================= HERO SECTION ================= -->

<section class="hero">

    <div class="hero-content">

        <h1>
            Discover Amazing Food<br>
            Delivered To Your Door
        </h1>

        <p>
            Explore the best restaurants around you with quick delivery and delicious meals.
        </p>

        <input type="text"
               class="search-box"
               placeholder="🔍 Search restaurants...">

    </div>

    <div class="scroll-down" onclick="scrollToRestaurants()">

        <span>⌄</span>

        Explore Restaurants

    </div>

</section>

<!-- ================= RESTAURANT TITLE ================= -->

<section class="restaurant-heading">

    <h2>
        🍽️ Handpicked Restaurants For You
    </h2>

    <div class="line"></div>

    <p>

        Fresh food • Fast delivery • Top-rated restaurants near you

    </p>

</section>

<!-- ================= RESTAURANT GRID ================= -->

<div class="restaurant-container">

<%

List<Restaurant> restaurants =
(List<Restaurant>)request.getAttribute("restaurants");

if(restaurants!=null){

for(Restaurant r : restaurants){

%>

<a href="menu?restaurantId=<%=r.getRestaurantID()%>">

<div class="card">

<img src="<%=r.getImagePath()%>"
     alt="Restaurant">

<div class="card-content">

<h2><%=r.getName()%></h2>

<div class="tag">

Top Rated

</div>

<div class="info">

<div>

🚚 30-40 mins

</div>

<div class="rating">

⭐ 4.5

</div>

</div>

<div class="address">

📍 <%=r.getAddress()%>

</div>

<button class="view-btn">

View Menu →

</button>

</div>

</div>

</a>

<%

}

}else{

%>

<h2 style="width:100%;text-align:center;color:#ff4d4d;">

No Restaurants Available

</h2>

<%

}

%>

</div>

<script>

const search=document.querySelector(".search-box");

const cards=document.querySelectorAll(".restaurant-container a");

search.addEventListener("keyup",function(){

let value=this.value.toLowerCase();

cards.forEach(function(card){

let name=card.querySelector("h2").innerText.toLowerCase();

let address=card.querySelector(".address").innerText.toLowerCase();

if(name.includes(value)||address.includes(value)){

card.style.display="block";

}else{

card.style.display="none";

}

});

});

function scrollToRestaurants(){

document.querySelector(".restaurant-heading")
.scrollIntoView({

behavior:"smooth"

});

}

window.addEventListener("scroll",function(){

const nav=document.querySelector("nav");

if(window.scrollY>80){

nav.style.background="white";

nav.style.boxShadow="0 5px 18px rgba(0,0,0,.12)";

document.querySelector(".logo").style.color="#ff6b35";

document.querySelector(".logo span").style.color="#ff914d";

document.querySelectorAll(".nav-links a").forEach(function(link){

link.style.color="#333";

});

}else{

nav.style.background="rgba(0,0,0,.30)";

nav.style.boxShadow="none";

document.querySelector(".logo").style.color="white";

document.querySelector(".logo span").style.color="#ffb347";

document.querySelectorAll(".nav-links a").forEach(function(link){

link.style.color="white";

});

}

});

</script>

</body>

</html>