<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodieHub | Login</title>

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

    height:100vh;

    display:flex;

    justify-content:center;

    align-items:center;

    background:
    linear-gradient(rgba(0,0,0,.55),
    rgba(0,0,0,.55)),
    url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=1600");

    background-size:cover;

    background-position:center;

}

/* Login Card */

.login-container{

    width:400px;

    padding:40px;

    border-radius:20px;

    background:rgba(255,255,255,.15);

    backdrop-filter:blur(15px);

    box-shadow:0 10px 35px rgba(0,0,0,.3);

    color:white;

}

/* Logo */

.logo{

    text-align:center;

    font-size:38px;

    font-weight:700;

    color:#ff9f43;

    margin-bottom:8px;

}

.logo span{

    color:white;

}

/* Heading */

.login-container h2{

    text-align:center;

    margin-bottom:30px;

    font-size:28px;

    font-weight:600;

}

/* Form */

.form-group{

    margin-bottom:20px;

}

.form-group label{

    display:block;

    margin-bottom:8px;

    font-size:14px;

    font-weight:500;

}

.form-group input{

    width:100%;

    padding:14px;

    border:none;

    outline:none;

    border-radius:12px;

    font-size:15px;

    background:rgba(255,255,255,.9);

    transition:.3s;

}

.form-group input:focus{

    box-shadow:0 0 10px #ff9f43;

    transform:scale(1.02);

}

/* Button */

.btn{

    width:100%;

    padding:14px;

    border:none;

    border-radius:12px;

    background:linear-gradient(135deg,#ff6b35,#ff9f43);

    color:white;

    font-size:17px;

    font-weight:600;

    cursor:pointer;

    transition:.3s;

}

.btn:hover{

    transform:translateY(-2px);

    box-shadow:0 8px 20px rgba(255,107,53,.5);

}

/* Bottom Link */

.bottom-link{

    margin-top:25px;

    text-align:center;

    font-size:15px;

}

.bottom-link a{

    color:#ffd166;

    text-decoration:none;

    font-weight:600;

}

.bottom-link a:hover{

    text-decoration:underline;

}

/* Welcome Text */

.tagline{

    text-align:center;

    color:#f1f1f1;

    margin-bottom:25px;

    font-size:14px;

}

/* Responsive */

@media(max-width:480px){

.login-container{

width:90%;

padding:30px 20px;

}

.logo{

font-size:32px;

}

}

</style>

</head>

<body>

<div class="login-container">

<div class="logo">
🍔 <span>FoodieHub</span>
</div>

<h2>Welcome Back</h2>

<p class="tagline">
Login to continue ordering your favourite food.
</p>

<form action="login" method="post">

<div class="form-group">
<label>Email Address</label>
<input
type="email"
name="email"
placeholder="Enter your email"
required>
</div>

<div class="form-group">
<label>Password</label>
<input
type="password"
name="password"
placeholder="Enter your password"
required>
</div>

<button class="btn" type="submit">
Login
</button>

</form>

<div class="bottom-link">

Don't have an account?

<a href="signup.jsp">
Sign Up
</a>

</div>

</div>

</body>
</html>