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
	<h1> LOCOMOTIVE NEW ACCOUNT </h1>
		<div class="box">
			Username: <br><input type=text name = username><br>
			Password: <br><input type=password name = password><br>
			E-Mail: <br><input type=text name = email><br><br>
		<input type="submit" value="CREATE" id="logBtn">
		</div>
	</div>
	<br><br>
	</form>
	
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");

		if (username != null && username != "" && password != null && password != "" && email != null && email != "")
		{
			HibernateDao hd = new HibernateDao();
			int validUser = hd.newUser(username, email);
			
			if (validUser > 10)
			{
				%>
					<script type="text/javascript">alert("Username and Email Already Exist");</script>
				<%
			}
			else if (validUser > 0 && validUser < 6)
			{
				%>
					<script type="text/javascript">alert("Username Already Exists");</script>
				<%
			}
			else if (validUser > 5 && validUser < 11)
			{
				%>
					<script type="text/javascript">alert("Email Aready Exists");</script>
				<%
			}
			else
			{
				hd.addUser(username, password, email);
 				response.sendRedirect("MainPage.jsp");
			}
		}
		else
		{
			%>
				<script type="text/javascript">alert("Please Fill In Every Boxes");</script>
			<%
		}
	%>

</body>
</html>