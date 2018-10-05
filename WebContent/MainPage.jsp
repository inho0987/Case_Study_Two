<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "Locomotive.HibernateDao" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title> Locomotive Ticket </title>
<style>
	body, html
	{
		background: url("bgImage.jpg");
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
		height: 100%;
		margin: 0;
	}
	
	h1
	{
		color: white;
		font-style: bold;
	}
	
	#logBtn
	{
		margin: auto;
    	padding: 10px 40px;
    	color: aliceblue;
    	background-color: #d6a844;
    	text-align: center;
	}
	
	#regBtn
	{
		margin: 0% 5% 10% 70%;
    	padding: 10px 40px;
    	color: white;
    	background-color: black;
    	text-align: center;
	}
	
</style>
</head>

<body>	

	<form method="post" action="">
	<div class="w3-container w3-center w3-animate-opacity">
	<h1> LOCOMOTIVE LOGIN </h1>
		<div class="box">
			Username: <br><input type=text name = username><br>
			Password: <br><input type=password name = password><br><br>
		<input type="submit" value="CONFIRM" id="logBtn">
		</div>
	</div>
	<br><br>
	</form>
	
	<form method = post action = "Register.jsp">
		<input type="submit" value="REGISTER" id="regBtn">
	</form>
	
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		HibernateDao hd = new HibernateDao();
			
		if (username != "" && password != "" && username != null && password != null)
		{
			if (hd.loginCheck(username, password))
			{
				response.sendRedirect("Login.jsp");
			}
			else
			{
				%>
					<script type="text/javascript">alert("Invalid Account: Please Try Again");</script>
				<%
			}
		}
	%>

</body>
</html>