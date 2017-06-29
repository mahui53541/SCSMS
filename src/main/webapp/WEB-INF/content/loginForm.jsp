<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<style type="text/css">
	.login{
		width:20%;
		margin-left:40%;
		border-radius:10px;
		border:3px solid #999999;
		text-align: center;
		color:white;
		margin-top:100px;
	}
	input {
		height:30px;
		width:70%;
		font-size: 20px;
		padding-left:10px;	
		margin-bottom:20px;
		border-radius:10px;
	}
	 input:focus { 
	 	border-radius:10px;
	 	outline: none;
	 } 
	 input[type="submit"] {
		border-radius:10px;
		height: 40px;
		border:2px solid red;
		width:25%;
		margin-left:20%;
		background-color:white;
		padding-bottom:5px;
	 }
</style>
</head>
<body style="background-color: #003366">
	<div class="login" >
		<h1>请登录</h1>
			<form action="studentLogin" method="post">
			<input type="text" placeholder="用户名" name="ssn"><br>
			<input type="password" placeholder="密码" name="password">
			<input type="submit" value="登录">
		</form>
	</div>
	
</body>
</html>