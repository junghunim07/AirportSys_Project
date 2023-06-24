<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="checkin.CheckinDAO" %>
<%@ page import="checkin.Checkin" %>
<%@ page import="flight.FlightDAO" %>
<%@ page import="flight.Flight" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:useBean id="flight" class="flight.Flight" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="flight" property="flightID" />
<jsp:setProperty name="flight" property="airportName" />
<jsp:setProperty name="flight" property="airlineName" />
<jsp:setProperty name="flight" property="startPoint" />
<jsp:setProperty name="flight" property="finishPoint" />
<jsp:setProperty name="flight" property="startTime" />
<jsp:setProperty name="flight" property="finishTime" />
<jsp:setProperty name="flight" property="startDate" />
<jsp:setProperty name="flight" property="finishDate" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/checkin.css">
<title>항공 예약 사이트</title>
</head>
<body>
	<%
		String userID = null;
		String userName = null;
		int flightID = 0;
		String airportName = null;
		String airlineName = null;
		String startPoint = null;
		String finishPoint = null;
		String startTime = null;
		String finishTime = null;
		String startDate = null;
		String finishDate = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(session.getAttribute("userName") != null){
			userName = (String) session.getAttribute("userName");
		}
		if(session.getAttribute("flightID") != null){
			flightID = (int) session.getAttribute("flightID");
		}
		if(session.getAttribute("airportName") != null){
			airportName = (String) session.getAttribute("airportName");
		}
		if(session.getAttribute("airlineName") != null){
			airlineName = (String) session.getAttribute("airlineName");
		}
		if(session.getAttribute("startPoint") != null){
			startPoint = (String) session.getAttribute("startPoint");
		}
		if(session.getAttribute("finishPoint") != null){
			finishPoint = (String) session.getAttribute("finishPoint");
		}
		if(session.getAttribute("startTime") != null){
			startTime = (String) session.getAttribute("startTime");
		}
		if(session.getAttribute("finishTime") != null){
			finishTime = (String) session.getAttribute("finishTime");
		}
		if(session.getAttribute("startDate") != null){
			startDate = (String) session.getAttribute("startDate");
		}
		if(session.getAttribute("finishDate") != null){
			finishDate = (String) session.getAttribute("finishDate");
		}
		CheckinDAO checkinDAO = new CheckinDAO();
		ResultSet result = checkinDAO.check(userID);
		if (result.next()) {
			userName = result.getString(2);
			flightID = result.getInt(3);
			airportName = result.getString(4);
			airlineName = result.getString(5);
			startPoint = result.getString(6);
			finishPoint = result.getString(7);
			startTime = result.getString(8);
			finishTime = result.getString(9);
			startDate = result.getString(10);
			finishDate = result.getString(11);
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
		<table class="table-area">
			<tr>
				<th colspan=2 class="hd">예약 조회</th>
			</tr>
			<tr>
				<th class="th">고객ID</th>
				<td><%= userID %></td>
			</tr>
			<tr>
				<th class="th">고객 성함</th>
				<td><%= userName %></td>
			</tr>
			<tr>
				<th class="th">항공편ID</th>
				<td><%= flightID %></td>
			</tr>
			<tr>
				<th class="th">항공사</th>
				<td><%= airlineName %></td>
			</tr>
			<tr>
				<th class="th">출발지</th>
				<td><%= startPoint %></td>
			</tr>
			<tr>
				<th class="th">도착지</th>
				<td><%= finishPoint %></td>
			</tr>
			<tr>
				<th class="th">출발 시간</th>
				<td><%= startTime %></td>
			</tr>
			<tr>
				<th class="th">도착 시간</th>
				<td><%= finishTime %></td>
			</tr>
			<tr>
				<th class="th">출발 날짜</th>
				<td><%= startDate %></td>
			</tr>
			<tr>
				<th class="th">도착 날짜</th>
				<td><%= finishDate %></td>
			</tr>
			<td><button onclick="if(confirm('예약 취소 하시겠습니까?'))location.href='cancelAction.jsp';">예약 취소</button></td>
			<td><button onclick="location.href='main.jsp'">메인화면</button></td>
		</table>
	<%
		} else if (userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('예약된 정보가 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>