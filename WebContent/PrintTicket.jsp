<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "Locomotive.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "java.io.*" %>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title> Locomotive Ticket </title>
<style>
	body, html
	{
		background: url("ticketCopy.jpg");
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
		height: 100%;
		margin: 0;
	}
	
	a
	{
		margin: 0% 5% 10% 10%;
    	padding: 10px 40px;
    	text-align: left;
    	color: yellow;
	}
	
	#regBtn
	{
		margin: 0% 5% 10% 30%;
    	padding: 10px 40px;
    	text-align: center;
	}
</style>
</head>

<body>
	<%	
		Ticket ticket = null;
		int passengerNo = (Integer) session.getAttribute("passengerNo");
		Trains train = (Trains) session.getAttribute("train");
		String dateStr = (String) session.getAttribute("date");

		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
		Date date = sdf.parse(dateStr);
	
		ticket = new Ticket(date, train);
		for (int i = 1; i <= passengerNo; i++)
		{
			String name = (String) session.getAttribute("name" + i);
			int age = (Integer) session.getAttribute("age" + i);
			String gender = (String) session.getAttribute("gender" + i);
		
			ticket.addPassenger(name, age, gender);		
		}
		
		ticket.writeTicket();
		/*
		response.setContentType("text/plain");
		PrintWriter pw = response.getWriter();
		String location = "/C:\\Users\\Ino\\workspace\\Case_Study_Two\\WebContent\\WEB-INF\\ticket.txt";
		
		FileInputStream fileInputStream = new FileInputStream(location);
		int i;
		
		while ((i = fileInputStream.read()) != -1) {
			pw.write(i);
		}
		fileInputStream.close();
		pw.close();
		*/
		
		%>
	
	<%=ticket.print().toString() %>
	<a href="DownloadTicket.jsp">Download the Ticket</a><br><br>
	<form action="MainPage.jsp" method=Post>
		<input type = "submit" value = "LogOut" id = "regBtn"/>
	</form>
</body>
</html>