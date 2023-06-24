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
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		CheckinDAO checkinDAO = new CheckinDAO();
		int result = checkinDAO.delete(userID);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('예약 취소에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('예약 취소 되었습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>