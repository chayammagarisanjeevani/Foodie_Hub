<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.food.Model.User" %>

<%
User user = (User)session.getAttribute("loggedUser");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

String username = user.getName();
String email = user.getEmail();
String phone = user.getPhone();
String address = user.getAddress();

String firstLetter = "U";

if(username != null && !username.trim().isEmpty()){
    firstLetter = username.substring(0,1).toUpperCase();
}
else if(email != null && !email.trim().isEmpty()){
    firstLetter = email.substring(0,1).toUpperCase();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Profile | HungerHub</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#f8f8f8;
}

/* NAVBAR */

.navbar{
    background:white;
    padding:18px 70px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 2px 15px rgba(0,0,0,0.08);
    position:sticky;
    top:0;
}

.logo{
    font-size:32px;
    font-weight:800;
    color:#fc8019;
}

.nav-links a{
    text-decoration:none;
    color:#333;
    margin-left:30px;
    font-weight:600;
}

.nav-links a:hover{
    color:#fc8019;
}

/* PROFILE */

.profile-container{
    max-width:1100px;
    margin:40px auto;
    display:grid;
    grid-template-columns:320px 1fr;
    gap:25px;
}

/* LEFT PANEL */

.left-panel{
    background:white;
    border-radius:20px;
    padding:30px;
    text-align:center;
    box-shadow:0 3px 15px rgba(0,0,0,0.08);
    height:fit-content;
}
.avatar{
    width:130px;
    height:130px;    
    border:5px solid #fff4eb;
box-shadow:0 5px 20px rgba(252,128,25,0.3);
    background:#fc8019;
    color:white;
    border-radius:50%;
    display:flex;
    justify-content:center;
    align-items:center;
    margin:auto;
    font-size:48px;
    font-weight:bold;
}

.left-panel h2{
    margin-top:18px;
    color:#333;
}

.left-panel p{
    color:gray;
    margin-top:8px;
}
.menu-title{
    text-align:left;
    margin:25px 0 15px;
    color:#777;
    font-size:14px;
    text-transform:uppercase;
    letter-spacing:1px;
}

.profile-menu{
    margin-top:10px;
}

.profile-menu a{
    display:flex;
    align-items:center;
    gap:12px;
    text-decoration:none;
    color:#333;
    background:#f8f8f8;
    padding:15px;
    border-radius:12px;
    margin-bottom:12px;
    font-weight:600;
    transition:all .3s ease;
}

.profile-menu a:hover{
    background:#fff4eb;
    color:#fc8019;
    transform:translateX(5px);
}

.menu-icon{
    font-size:18px;
}
/* RIGHT PANEL */

.right-panel{
    display:flex;
    flex-direction:column;
    gap:20px;
}

.card{
    background:white;
    border-radius:20px;
    padding:25px;
    box-shadow:0 3px 15px rgba(0,0,0,0.08);
}

.card-title{
    font-size:22px;
    font-weight:bold;
    margin-bottom:20px;
    color:#333;
}

.info-grid{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:15px;
}

.info{
    background:#fff7f0;
    padding:18px;
    border-radius:12px;
}

.info label{
    color:gray;
    font-size:13px;
}

.info p{
    margin-top:8px;
    font-weight:600;
    color:#222;
}

/* STATS */

.stats{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:15px;
}

.stat-box{
    background:#fff7f0;
    border-radius:12px;
    text-align:center;
    padding:20px;
}

.stat-box h2{
    color:#fc8019;
}

.stat-box span{
    color:#666;
}
.profile-status{
    margin-top:20px;
}

.progress-bar{
    width:100%;
    height:8px;
    background:#eee;
    border-radius:20px;
    margin:10px 0;
}

.progress{
    width:90%;
    height:100%;
    background:#fc8019;
    border-radius:20px;
}

/* BUTTONS */

.actions{
    display:flex;
    gap:15px;
}

.btn{
    flex:1;
    border:none;
    padding:14px;
    border-radius:10px;
    cursor:pointer;
    font-size:15px;
    font-weight:bold;
}

.edit{
    background:#fc8019;
    color:white;
}

.logout{
    background:#222;
    color:white;
}

.btn:hover{
    opacity:.9;
}

@media(max-width:900px){

.profile-container{
    grid-template-columns:1fr;
}

.info-grid{
    grid-template-columns:1fr;
}

.stats{
    grid-template-columns:repeat(2,1fr);
}

}

</style>
</head>

<body>

<nav class="navbar">
    <div class="logo">🍔 FoodieHub</div>

    <div class="nav-links">
        <a href="home.jsp">Home</a>
        <a href="restaurant.jsp">Restaurant</a>
        <a href="logout.html">Logout</a>
    </div>
</nav>

<div class="profile-container">

    <!-- LEFT -->

    <div class="left-panel">

        <div class="avatar">
            <%= firstLetter %>
        </div>

        <h2><%= username %></h2>

        <p><%= email %></p>

        <h3 class="menu-title">Quick Access</h3>

<div class="profile-menu">

    <a href="OrderHistoryServlet">
        <span class="menu-icon">📦</span>
        <span>My Orders</span>
    </a>

    <a href="favorite.jsp">
        <span class="menu-icon">❤️</span>
        <span>Favourite Restaurants</span>
    </a>


    <a href="logout.html">
        <span class="menu-icon">⚙️</span>
        <span>Logout</span>
    </a>

</div>
    </div>

    <!-- RIGHT -->

    <div class="right-panel">

        <div class="card">

            <div class="card-title">Personal Information</div>

            <div class="info-grid">

                <div class="info">
                    <label>Full Name</label>
                    <p><%= username %></p>
                </div>

                <div class="info">
                    <label>Email</label>
                    <p><%= email %></p>
                </div>
                
                <div class="profile-status">
    <p>Profile Completion</p>
    <div class="progress-bar">
        <div class="progress"></div>
    </div>
    <span>90%</span>
</div>

              <div class="info">
                 <label>Phone Number</label>
                  <p><%= phone %></p>
               </div>
                
             <div class="info">
                 <label>Address</label>
                  <p><%= address %></p>
              </div>
            </div>

        </div>

        <div class="card">

            <div class="card-title">Activity Overview</div>

            <div class="stats">

                <div class="stat-box">
                    <h2>24</h2>
                    <span>Orders</span>
                </div>

                <div class="stat-box">
                    <h2>₹850</h2>
                    <span>Wallet</span>
                </div>

                <div class="stat-box">
                    <h2>120</h2>
                    <span>Rewards</span>
                </div>

                <div class="stat-box">
                    <h2>4.8★</h2>
                    <span>Ratings</span>
                </div>

            </div>

        </div>

        <div class="card">

            <div class="actions">

                <button class="btn edit">
                    Edit Profile
                </button>

                <button class="btn logout"
                        onclick="window.location.href='logout'">
                    Logout
                </button>

            </div>

        </div>

    </div>

</div>

</body>
</html>