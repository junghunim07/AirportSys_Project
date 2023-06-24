<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="airplane.Airplane" %>
<%@ page import="flight.FlightDAO" %>
<%@ page import="flight.Flight" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="flight" class="flight.Flight" scope="page" />
<jsp:setProperty name="flight" property="startPoint" />
<jsp:setProperty name="flight" property="finishPoint" />
<jsp:setProperty name="flight" property="startDate" />
<jsp:setProperty name="flight" property="finishDate" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/search.css">
<title>항공 예약 사이트</title>
</head>
<body>
	<%
		String userID = null;
		String startPoint = null;
		String finishPoint = null;
		String startDate = null;
		String finishDate = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(session.getAttribute("startPoint") != null){
			startPoint = (String) session.getAttribute("startPoint");
		}
		if(session.getAttribute("userID") != null){
			finishPoint = (String) session.getAttribute("finishPoint");
		}
		if(session.getAttribute("userID") != null){
			startDate = (String) session.getAttribute("startDate");
		}
		if(session.getAttribute("userID") != null){
			finishDate = (String) session.getAttribute("finishDate");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
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
	<div class="container">
		<div class="row">
			<form action="reserveAction.jsp" method="GET">
				<table class="table-area">
				<thread>
					<tr>
						<th>항공편번호</th>
						<th>공항이름</th>
						<th>항공사이름</th>
						<th>출발지</th>
						<th>도착지</th>
				 		<th>출발시간</th>
						<th>도착시간</th>
						<th>출발날짜</th>
						<th>도착날짜</th>
						<th>예약하기</th>
					</tr>
				</thread>
				<tbody>
					<%
						FlightDAO flightDAO = new FlightDAO();
						ArrayList<Flight> list = flightDAO.getList(startPoint, finishPoint, startDate, finishDate);
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><input type="hidden" name="flightID" value="<%= list.get(i).getFlightID() %>"><%= list.get(i).getFlightID() %></td>
						<td><input type="hidden" name="airportName" value="<%= list.get(i).getAirportName() %>"><%= list.get(i).getAirportName() %></td>
						<td><input type="hidden" name="airlineName" value="<%= list.get(i).getAirlineName() %>"><%= list.get(i).getAirlineName()%></td>
						<td><input type="hidden" name="startPoint" value="<%= list.get(i).getStartPoint() %>"><%= list.get(i).getStartPoint() %></td>
						<td><input type="hidden" name="finishPoint" value="<%= list.get(i).getFinishPoint() %>"><%= list.get(i).getFinishPoint() %></td>
						<td><input type="hidden" name="startTime" value="<%= list.get(i).getStartTime() %>"><%= list.get(i).getStartTime() %></td>
						<td><input type="hidden" name="finishTime" value="<%= list.get(i).getFinishTime() %>"><%= list.get(i).getFinishTime() %></td>
						<td><input type="hidden" name="startDate" value="<%= list.get(i).getStartDate() %>"><%= list.get(i).getStartDate() %></td>
						<td><input type="hidden" name="finishDate" value="<%= list.get(i).getFinishDate() %>"><%= list.get(i).getFinishDate() %></td>
						<td><button type="submit" name="reserve" value="<%= i%>" onclick="if(confirm('예약하시겠습니까?')){ this.form.action = 'reserveAction.jsp';} else {alert('예약이 취소되었습니다.'); this.form.action = 'search.jsp';}">예약</button></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			</form>
		</div>
	</div>
</body>
</html>