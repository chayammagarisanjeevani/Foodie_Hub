<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<!DOCTYPE html>
	<html lang="en">
	<head>
	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>FoodieHub | Sign Up</title>
	
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
	    min-height:100vh;
	    display:flex;
	    justify-content:center;
	    align-items:center;
	    background:
	    linear-gradient(rgba(0,0,0,.60),rgba(0,0,0,.60)),
	    url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=1600");
	    background-size:cover;
	    background-position:center;
	    padding:20px;
	}
	
	/* Signup Card */
	
	.signup-container{
	
	    width:380px;
	
	    background:rgba(255,255,255,.15);
	
	    backdrop-filter:blur(15px);
	
	    border-radius:20px;
	
	    padding:22px;
	
	    box-shadow:0 10px 35px rgba(0,0,0,.35);
	
	    color:white;
	
	}
	
	/* Logo */
	
	.logo{
	
	    text-align:center;
	
	    font-size:30px;
	
	    font-weight:700;
	
	    color:#ffb347;
	
	    margin-bottom:5px;
	
	}
	
	.logo span{
	
	    color:white;
	
	}
	
	/* Heading */
	
	.signup-container h2{
	
	    text-align:center;
	
	    font-size:24px;
	
	    margin-bottom:5px;
	
	}
	
	.subtitle{
	
	    text-align:center;
	
	    font-size:13px;
	
	    color:#eeeeee;
	
	    margin-bottom:18px;
	
	}
	
	/* Form */
	
	.form-group{
	
	    margin-bottom:12px;
	
	}
	
	.form-group label{
	
	    display:block;
	
	    margin-bottom:4px;
	
	    font-size:13px;
	
	    font-weight:500;
	
	}
	
	.form-group input,
	.form-group textarea{
	
	    width:100%;
	
	    padding:10px 12px;
	
	    border:none;
	
	    outline:none;
	
	    border-radius:10px;
	
	    background:white;
	
	    font-size:14px;
	
	    transition:.3s;
	
	}
	
	.form-group input:focus,
	.form-group textarea:focus{
	
	    box-shadow:0 0 10px #ff9f43;
	
	    transform:scale(1.02);
	
	}
	
	.form-group textarea{
	
	    resize:none;
	
	    height:65px;
	
	}
	
	/* Button */
	
	.btn{
	
	    width:100%;
	
	    padding:12px;
	
	    border:none;
	
	    border-radius:10px;
	
	    background:linear-gradient(135deg,#ff6b35,#ff9f43);
	
	    color:white;
	
	    font-size:15px;
	
	    font-weight:600;
	
	    cursor:pointer;
	
	    transition:.3s;
	
	}
	
	.btn:hover{
	
	    transform:translateY(-2px);
	
	    box-shadow:0 8px 20px rgba(255,107,53,.45);
	
	}
	
	/* Bottom Link */
	
	.bottom-link{
	
	    text-align:center;
	
	    margin-top:15px;
	
	    font-size:14px;
	
	}
	
	.bottom-link a{
	
	    color:#ffd166;
	
	    text-decoration:none;
	
	    font-weight:600;
	
	}
	
	.bottom-link a:hover{
	
	    text-decoration:underline;
	
	}
	
	@media(max-width:480px){
	
	.signup-container{
	
	    width:100%;
	
	}
	
	}
	
	</style>
	
	</head>
	
	<body>
	
	<div class="signup-container">
	
	<div class="logo">
	&#127828; <span>FoodieHub</span>
	</div>
	
	<h2>Create Account</h2>
	
	<p class="subtitle">
	Join FoodieHub and get your favourite food delivered fast.
	</p>
	
	<form action="signup" method="post">
	
	<div class="form-group">
	<label>Full Name</label>
	<input type="text"
	name="name"
	placeholder="Enter your full name"
	required>
	</div>
	
	<div class="form-group">
	<label>Email Address</label>
	<input type="email"
	name="email"
	placeholder="Enter your email"
	required>
	</div>
	
	<div class="form-group">
	<label>Password</label>
	<input type="password"
	name="password"
	placeholder="Create a password"
	required>
	</div>
	
	<div class="form-group">
	<label>Phone Number</label>
	<input type="text"
	name="phone"
	placeholder="Enter your phone number"
	required>
	</div>
	
	<div class="form-group">
	<label>Delivery Address</label>
	<textarea
	name="address"
	placeholder="Enter your delivery address"
	required></textarea>
	</div>
	
	<button class="btn" type="submit">
	Create Account
	</button>
	
	</form>
	
	<div class="bottom-link">
	Already have an account?
	<a href="login.jsp">Login</a>
	</div>
	
	</div>
	
	</body>
	</html>