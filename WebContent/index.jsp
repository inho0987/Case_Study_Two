<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	
	.one
	{
		color: white;
		font-weight: bold;
		font-size: 250%;
	}
	
	.capbox
	{
		position: fixed;
		bottom: 65%;
  		left: 40%;
		background-color: gray;
		display: inline-block;
		*display: inline; zoom: 1;
		padding: 8px 8px 8px 8px;
	}

	.capbox-inner
	{
	
		font: bold 11px arial, sans-serif;
		color: red;
		background-color: white;
		margin: 5px auto 0px auto;
		padding: 3px;
		-moz-border-radius: 4px;
		-webkit-border-radius: 4px;
		border-radius: 4px;
	}

	#CaptchaDiv
	{
		font: bold 17px verdana, arial, sans-serif;
		font-style: italic;
		color: #000000;
		background-color: #FFFFFF;
		padding: 4px;
		-moz-border-radius: 4px;
		-webkit-border-radius: 4px;
		border-radius: 4px;
	}

	#CaptchaInput
	{
		margin: 1px 0px 1px 0px;
		width: 135px;
	}
	
	#btn
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
	<marquee class = one direction="down" width="100%" height="100%" behavior="alternate" style="border:none">
		<marquee behavior="alternate"> Robot Checker </marquee>
	</marquee>

	<form method="post" action="MainPage.jsp" onsubmit="return checkform(this);">
		<div class="w3-container w3-center w3-animate-opacity">
			<div class="capbox">
				<div id="CaptchaDiv"></div>
				<div class="capbox-inner">Type the Code Above<br>
					<input type="hidden" id="txtCaptcha">
					<input type="text" name="CaptchaInput" id="CaptchaInput" size="15"><br>
				</div>
				<input type="submit" value="CONFIRM" id="btn">
			</div>
		</div><br><br>
	</form>
	
	<script type="text/javascript">
	function checkform(theform)
	{
		var why = "";

		if(theform.CaptchaInput.value == "")
		{
			why += "Please Enter The Code Above\n";
		}
		
		if(theform.CaptchaInput.value != "")
		{
			if(ValidCaptcha(theform.CaptchaInput.value) == false)
			{
				why += "The Code Does Not Match\n";
			}
		}
		
		if(why != "")
		{
			alert(why);
			return false;
		}
	}

	var a = Math.ceil(Math.random() * 9)+ '';
	var b = Math.ceil(Math.random() * 9)+ '';
	var c = Math.ceil(Math.random() * 9)+ '';
	var d = Math.ceil(Math.random() * 9)+ '';
	var e = Math.ceil(Math.random() * 9)+ '';

	var code = a + b + c + d + e;
	document.getElementById("txtCaptcha").value = code;
	document.getElementById("CaptchaDiv").innerHTML = code;

	function ValidCaptcha()
	{
		var str1 = document.getElementById('txtCaptcha').value;
		var str2 = document.getElementById('CaptchaInput').value;
		
		if (str1 == str2)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

</script>

</body>
</html>