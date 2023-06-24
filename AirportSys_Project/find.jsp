<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공 예약 사이트</title>
<link rel="stylesheet" href="css/find.css">
<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<section class="find-form">
		<h1>FIND PASSWORD</h1>
		<form action="findAction.jsp">
			<div class="int-area">
				<input type="text" name="userID" id="id" maxlength="20" autocomplete="off" required>
				<label for="id">USER ID</label>
			</div>
			<div class="int-area">
				<input type="email" name="userEmail" id="email" maxlength="50" autocomplete="off" required>
				<label for="email">USER EMAIL</label>
			</div>
			<div class="btn-area">
				<button type="submit">FIND</button>
			</div>
		</form>
	</section>
</body>
</html>