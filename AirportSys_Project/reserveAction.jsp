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
<title>항공 예약 사이트</title>
</head>
<body>
	<%
		String userID = null;
		String userName = null;
		String startPoint = null;
		String finishPoint = null;
		String startDate = null;
		String finishDate = null;
		int btn = -1;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(session.getAttribute("startPoint") != null){
			startPoint = (String) session.getAttribute("startPoint");
		}
		if(session.getAttribute("finishPoint") != null){
			finishPoint = (String) session.getAttribute("finishPoint");
		}
		if(session.getAttribute("startDate") != null){
			startDate = (String) session.getAttribute("startDate");
		}
		if(session.getAttribute("finishDate") != null){
			finishDate = (String) session.getAttribute("finishDate");
		}
		if (request.getParameter("reserve") != null) {
			btn = Integer.parseInt(request.getParameter("reserve"));
		}
		FlightDAO flightDAO = new FlightDAO();
		ArrayList<Flight> list = flightDAO.getList(startPoint, finishPoint, startDate, finishDate);
		int flightID = list.get(btn).getFlightID();
		String airportName = list.get(btn).getAirportName();
		String airlineName = list.get(btn).getAirlineName();
		String startTime = list.get(btn).getStartTime();
		String finishTime = list.get(btn).getFinishTime();
		UserDAO userDAO = new UserDAO();
		String result = userDAO.findUserName(userID);
		if (result != null) {
			session.setAttribute("userName", result);
			userName= result;
		}
		CheckinDAO checkinDAO = new CheckinDAO();
		int act = checkinDAO.write(userID, userName, flightID, airportName, airlineName, startPoint, finishPoint, startTime
				, finishTime, startDate, finishDate);
		if (flightID !=0 && airportName != null && airlineName != null && startPoint != null && finishPoint != null &&
				startTime != null && finishTime != null && startDate != null && finishDate != null) {
			session.setAttribute("userName", result);
			session.setAttribute("flightID", flightID);
			session.setAttribute("airportName", airportName);
			session.setAttribute("airlineName", airlineName);
			session.setAttribute("startPoint", startPoint);
			session.setAttribute("finishPoint", finishPoint);
			session.setAttribute("startTime", startTime);
			session.setAttribute("finishTime", finishTime);
			session.setAttribute("startDate", startDate);
			session.setAttribute("finishDate", finishDate);
			if (act > 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'checkin.jsp'");
				script.println("</script>");
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 예약된 정보가 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>