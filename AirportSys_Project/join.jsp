<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src = "js/bootstrap.js"></script>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=device-width">
<link rel="stylesheet" href="css/join.css">
<title>항공 예약 사이트</title>
</head>
<body>
	<section class="join-form">
		<h1>JOIN MEMBERSHIP</h1>
		<form action="joinAction.jsp">
			<div class="int-area">
				<input type="text" name="userID" id="id" maxlength="20" autocomplete="off" required>
				<label for="id">USER ID</label>
			</div>
			<div class="int-area">
				<input type="password" name="userPassword" id="pw" maxlength="20" autocomplete="off" required>
				<label for="pw">PASSWORD</label>
			</div>
			<div class="int-area">
				<input type="text" name="userName" id="name" maxlength="20" autocomplete="off" required>
				<label for="name">USER NAME</label>
			</div>
			<div class="btn-group" data-toggle="buttons">
				<label class="btn btn-primary active">
					<input type="radio" name="userGender" id="gender" autocomplete="off" value="남자" checked>남자
				</label>
				<label class="btn btn-primary active">
					<input type="radio" name="userGender" id="gender" autocomplete="off" value="여자" checked>여자
				</label>
			</div>
			<div class="int-area">
				<input type="email" name="userEmail" id="email" maxlength="50" autocomplete="off" required>
				<label for="email">USER EMAIL</label>
			</div>
			<div class="btn-area">
				<button id="btn" type="submit">JOIN</button>
			</div>
		</form>
	</section>
	<script>
		let id = $('#id');
		let pw = $('#pw');
		let name = $('#name');
		let gender = $('#gender');
		let email = $('#email');
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
			else if($(name).val == "") {
				$(name).next('label').addClass('warning');
				setTimeout(function() {
					$('label').removeClass('warning');
				}, 1500);
			}
			else if($(gender).val == "") {
				$(gender).next('label').addClass('warning');
				setTimeout(function() {
					$('label').removeClass('warning');
				}, 1500);
			}
			else if($(email).val == "") {
				$(email).next('label').addClass('warning');
				setTimeout(function() {
					$('label').removeClass('warning');
				}, 1500);
			}
			else {
				window.location.href = 'joinAction.jsp';
			}
		});
	</script>
</body>
</html>