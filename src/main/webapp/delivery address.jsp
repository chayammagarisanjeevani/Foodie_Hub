<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.food.Model.User" %>

<%
User user=(User)session.getAttribute("loggedInUser");

if(user==null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Delivery Address | FoodieHub</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{
background:#f5f5f7;
display:flex;
justify-content:center;
align-items:center;
min-height:100vh;
}

.container{

width:450px;
background:#fff;
border-radius:18px;
padding:35px;
box-shadow:0 8px 20px rgba(0,0,0,.08);

}

.title{

text-align:center;
font-size:30px;
font-weight:700;
color:#fc8019;
margin-bottom:25px;

}

.card{

background:#fafafa;
border:1px solid #ececec;
border-radius:15px;
padding:20px;

}

.row{

margin-bottom:18px;

}

.label{

font-size:14px;
color:#777;
margin-bottom:5px;

}

.value{

font-size:17px;
font-weight:600;
color:#333;

}

.btn{

width:100%;
margin-top:25px;
padding:14px;
border:none;
border-radius:10px;
background:#fc8019;
color:#fff;
font-size:16px;
font-weight:600;
cursor:pointer;
transition:.3s;

}

.btn:hover{

background:#e56f00;

}

</style>

</head>

<body>

<div class="container">

<div class="title">

&#128205; Delivery Address

</div>

<div class="card">

<div class="row">

<div class="label">

&#128100; Full Name

</div>

<div class="value">

<%=user.getName()%>

</div>

</div>

<div class="row">

<div class="label">

&#9993; Email

</div>

<div class="value">

<%=user.getEmail()%>

</div>

</div>

<div class="row">

<div class="label">

&#128222; Phone Number

</div>

<div class="value">

<%=user.getPhone()%>

</div>

</div>

<div class="row">

<div class="label">

&#127968; Delivery Address

</div>

<div class="value">

<%=user.getAddress()%>

</div>

</div>

</div>

<button class="btn"
onclick="window.location.href='callRestaurantServlet'">

&#128722; Continue Shopping

</button>

</div>

</body>

</html>