<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ page import="java.util.List,com.food.Model.Menu" %>

<%
List<Menu> favList =
(List<Menu>) session.getAttribute("favList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Favorites</title>
<style >
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#f5f5f5;
}

/* HEADER / NAVBAR */
.header{
    background:#fc8019;
    color:#fff;
    padding:14px 18px;
    display:flex;
    align-items:center;
    justify-content:space-between;
}

/* TITLE CENTER */
.header h2{
    font-size:22px;
    font-weight:600;
    flex:1;
    text-align:center;
}

/* MENU BUTTON (TOP RIGHT) */
.menu-btn{
    background:#fff;
    color:#fc8019;
    border:none;
    padding:8px 14px;
    border-radius:8px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

.menu-btn:hover{
    background:#ffe0cc;
}

/* GRID */
.container{
    width:92%;
    margin:25px auto;
    display:grid;
    grid-template-columns:repeat(auto-fill,minmax(210px,1fr));
    gap:18px;
}

/* CARD */
.card{
    background:#fff;
    border-radius:14px;
    overflow:hidden;
    box-shadow:0 4px 12px rgba(0,0,0,.08);
    transition:.3s;
    cursor:pointer;
}

.card:hover{
    transform:translateY(-5px);
    box-shadow:0 10px 20px rgba(0,0,0,.15);
}

/* IMAGE */
.card img{
    width:100%;
    aspect-ratio:4/3;
    object-fit:cover;
    display:block;
    border-radius:14px 14px 0 0;
    transition:.3s;
}

.card:hover img{
    transform:scale(1.05);
}

/* BODY */
.card-body{
    padding:12px;
}

.card-body h3{
    font-size:17px;
    color:#222;
    margin-bottom:6px;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}

.price{
    color:#fc8019;
    font-size:18px;
    font-weight:700;
}

/* EMPTY STATE */
.empty{
    margin-top:60px;
    text-align:center;
    font-size:20px;
    color:#777;
}

/* MOBILE RESPONSIVE */
@media(max-width:768px){

.container{
    width:95%;
    grid-template-columns:repeat(2,1fr);
    gap:15px;
}

.card img{
    height:120px;
}

.card-body h3{
    font-size:15px;
}

.price{
    font-size:16px;
}

}</style>
</head>

<body>

<!-- NAVBAR -->
<!-- NAVBAR -->
<div class="header">

    <h2>&hearts; My Favorites</h2>

   <button class="menu-btn" onclick="history.back()">
    Back
</button>
</div>

<%
if(favList == null || favList.isEmpty()){
%>

<div class="empty">
    No Favorites Yet &hearts;
</div>

<%
}else{
%>

<div class="container">

<%
for(Menu m : favList){
%>

    <div class="card">

        <img src="<%= m.getImagePath() %>">

        <div class="card-body">
            <h3><%= m.getItemName() %></h3>
            <p class="price">₹<%= m.getPrice() %></p>
        </div>

    </div>

<%
}
%>

</div>

<%
}
%>

</body>
</html>