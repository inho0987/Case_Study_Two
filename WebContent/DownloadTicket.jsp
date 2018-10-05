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
</style>
</head>

<body>

	<%	
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		response.setContentType("APPLICATION/OCTET-STREAM");
		response.setHeader("Content-Disposition", "attachment; filename=\""
				+ "ticket.txt" + "\"");
		FileInputStream fileInputStream = new FileInputStream("/C:\\Users\\Ino\\workspace\\Case_Study_Two\\WebContent\\WEB-INF\\ticket.txt");
		int i;
		while ((i = fileInputStream.read()) != -1) {
			pw.write(i);
		}
		fileInputStream.close();
		pw.close();
	%>

</body>
</html>