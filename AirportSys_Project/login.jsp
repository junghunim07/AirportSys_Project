<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>항공 예약 사이트</title>
	<link rel="stylesheet" href="css/style.css">
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<section class="login-form">
		<h1>LOGIN</h1>
		<form action="loginAction.jsp">
			<div class="int-area">
				<input type="text" name="userID" id="id" maxlength="20" autocomplete="off" required>
				<label for="id">USER ID</label>
			</div>
			<div class="int-area">
				<input type="password" name="userPassword" id="pw" maxlength="20" autocomplete="off" required>
				<label for="pw">PASSWORD</label>
			</div>
			<div class="btn-area">
				<button type="submit">LOGIN</button>
			</div>
		</form>
		<div class="caption">
			<a href="join.jsp">Don't have ID?</a>
		</div>
		<div class="caption">
			<a href="find.jsp">Forgot Password?</a>
		</div>
	</section>
	<script>
		let id = $('#id');
		let pw = $('#pw');
		let btn = $('#btn');
		
		$(btn).on('click', function() {
			if($(id).val() == "") {
				$(id).next('label').addClass('warning');
				setTimeout(function() {
					$('label').removeClass('warning');
				}, 1500);
			}
			else if($(pw).val == "") {
				$(pw).next('label').addClass('warning');
				setTimeout(function() {
					$('label').removeClass('warning');
				}, 1500);
			}
			else {
				window.location.href = 'loginAction.jsp';
			}
		});
	</script>
</body>
</html>