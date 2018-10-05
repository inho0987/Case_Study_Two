<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "Locomotive.*" %>
<%@ page import = "java.util.*" %>
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
	
	#hdr
	{
		background-color: white;
		color: blue;
	}
	mark
	{
		background-color: black;
		color: white;
	}
	.box
	{
		color: white;
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

<body>	

<marquee direction="left" behavior="slide"><h1> AVAILABLE TRAIN LIST </h1></marquee>
	<form method="post" action="">
	<div class="w3-container w3-center w3-animate-opacity">
		<div class="box">
			<table border = 5 color = white>
				<tr>
					<th><mark id = hdr> Train # </mark></th>
					<th><mark id = hdr> Train Name </mark></th>
					<th><mark id = hdr> Source </mark></th>
					<th><mark id = hdr> Destination </mark></th>
					<th><mark id = hdr> Ticket Price </mark></th>
				</tr>
				
				<%
					HibernateDao hd = new HibernateDao();
					List<Trains> trains=hd.trainTable();
					for(Trains t : trains)
					{
				%>
				<tr>
					<td><mark><%=t.getTrain_no() %></mark></td>
					<td><mark><%=t.getTrain_name() %></mark></td>
					<td><mark><%=t.getSource() %></mark></td>
					<td><mark><%=t.getDestination() %></mark></td>
					<td><mark><%=t.getTicket_price() %></mark></td>
				</tr>
				<%
					}
				%>
			</table>
			
		</div>
	</div>
	<div class="box">
	Enter Train Number: <input type = number name = trainNo><br>
	Enter Number of Passenger(s): <input type = number size = 9 name = passengerNo>
	<input type = submit value = ENTER>
	</div>
	</form>
	
	<%
		try
		{
			int tn = Integer.parseInt(request.getParameter("trainNo"));
			int pn = Integer.parseInt(request.getParameter("passengerNo"));
			if (hd.trainValidate(tn) == true && pn > 0)
			{
				Trains train = hd.getTrain(tn);
				session.setAttribute("train", train);
				session.setAttribute("passengerNo", pn);
				response.sendRedirect("Passengers.jsp");
			}
			else
			{
				%>
					<script type="text/javascript">alert("Invalid Input: Please Try Again");</script>
				<%
			}
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