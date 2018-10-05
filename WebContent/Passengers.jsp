<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "Locomotive.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title> Locomotive Ticket </title>
<style>
	body, html
	{
		background: url("ticketOffice.jpg");
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
	
	.box
	{
		color: black;
		font-style: bold;
	}
	
	#passenger
	{
		background-color: white;
	}
	
	#Btn
	{
		margin: auto;
    	padding: 10px 40px;
    	color: aliceblue;
    	background-color: #d6a844;
    	text-align: center;
	}
	
</style>
</head>

<body onload = "passengerList()">
	<%	
		int passengerNo = (Integer) session.getAttribute("passengerNo");
		Trains train = (Trains) session.getAttribute("train");
	%>
	<h1><marquee behavior="alternate" direction="left"> Locomotive Passenger(s) Ticketing </marquee></h1>
	
	<form method="post" action="" >	
	<div class="w3-container w3-center w3-animate-opacity">
		<div class="box" id="passenger">
			Travel Date(MM-DD-YYYY): <input type=date name = date><br>
		</div>
		<div class = "box">
			<input type="submit" value="Get Ticket" id="Btn">
		</div>
	</div>
	<br><br>
	</form>

	<script>
    	function passengerList()
    	{
    		var parent=document.getElementById("passenger");
    		
    		for (i = 1; i <= <%=passengerNo%>; i++)
    		{
    			var passenger = document.createTextNode("Passenger " + i + "  ");
    			var br = document.createElement("BR");
    			var name = document.createElement("INPUT");
    			var age = document.createElement("INPUT");
    			var genderM = document.createElement("INPUT");
    			var genderF = document.createElement("INPUT");
    			var tName = document.createTextNode("Name: ");
    			var tAge = document.createTextNode("Age: ");
    			var tMale = document.createTextNode("Male");
    			var tFemale = document.createTextNode("Female");
    			
    			name.setAttribute("type","text");
    			name.setAttribute("name","name" + i);
    			
    			age.setAttribute("type","number");
    			age.setAttribute("name","age" + i);
    			age.setAttribute("size", 5);
    			
    			genderM.setAttribute("type","radio");
    			genderM.setAttribute("value","Male");
    			genderM.setAttribute("name","gender" + i);
    			
    			genderF.setAttribute("type","radio");
    			genderF.setAttribute("value","Female");
    			genderF.setAttribute("name","gender" + i);
    			
    			parent.appendChild(passenger);
    			parent.appendChild(tName);
    			parent.appendChild(name);
    			
    			parent.appendChild(tAge);
    			parent.appendChild(age);
    			
    			parent.appendChild(tMale);
    			parent.appendChild(genderM);
    			parent.appendChild(tFemale);
    			parent.appendChild(genderF);
    			parent.appendChild(br);
    		}
    	}
    </script>
    
    <%
    	String date = request.getParameter("date");
    	
   		session.setAttribute("date", date);
    	
		try
		{
    		for (int i = 1; i <= passengerNo; i++)
    		{
				String name = request.getParameter("name"+i);
				int age = Integer.parseInt(request.getParameter("age"+i));
				String gender = request.getParameter("gender"+i);
				
				session.setAttribute("name" + i, name);
				session.setAttribute("age" + i, age);
				session.setAttribute("gender" + i, gender);
			}	
    		response.sendRedirect("PrintTicket.jsp");	
		}
		catch (Exception e)
		{
			%>
				<script type="text/javascript">alert("Empty Input Not Allowed");</script>
			<%
		}
	%>
	
	
</body>
</html>