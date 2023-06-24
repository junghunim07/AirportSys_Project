<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/main.css">
<title>항공 예약 사이트</title>
<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		String flightID = null;
		if (session.getAttribute("flightID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
		<div class="gomain-form">
			<button onclick="location.href='main.jsp'">국내 항공 예약 사이트</button>
		</div>
		<div class="checkIN-form">
			<button onclick="location.href='checkin.jsp'">CHECKIN</button>
		</div>
	<%
		if (userID == null) {
	%>
		<div class="login-form">
			<button onclick="location.href='login.jsp'">LOGIN</button>
		</div>
	<%
		} else {
	%>
		<div class="login-form">
			<button onclick="location.href='logoutAction.jsp'">LOGOUT</button>
		</div>
	<%
		}
	%>
	<section class="main-form">
		<h1>항공 예약 서비스</h1>
		<form action="searchAction.jsp">
			<div class="string-area">
				<input type="text" name="startPoint" id="sPoint" maxlength="20" autocomplete="off" required>
				<label for="sPoint">START POINT</label>
			</div>
			<div class="string-area">
				<input type="text" name="finishPoint" id="fPoint" maxlength="20" autocomplete="off" required>
				<label for="fPoint">FINISH POINT</label>
			</div>
			<div class="date-area">
				<input type="date" name="startDate" id="sDate" autocomplete="off" required>
				<label for="sDate">START DATE</label>
			</div>
			<div class="date-area">
				<input type="date" name="finishDate" id="fDate" autocomplete="off" required>
				<label for="fDate">FINISH DATE</label>
			</div>
			<div class="btn-area">
				<button type="submit">SEARCH</button>
			</div>
		</form>
	</section>
</body>
</html>