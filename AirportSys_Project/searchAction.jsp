<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="flight.FlightDAO" %>
<%@ page import="flight.Flight" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="flight" class="flight.Flight" scope="page" />
<jsp:setProperty name="flight" property="startPoint" />
<jsp:setProperty name="flight" property="finishPoint" />
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
		FlightDAO flightDAO = new FlightDAO();
		int result = flightDAO.search(flight.getStartPoint(), flight.getFinishPoint(), flight.getStartDate(), flight.getFinishDate());
		if (result == 1) {
			session.setAttribute("startPoint", flight.getStartPoint());
			session.setAttribute("finishPoint", flight.getFinishPoint());
			session.setAttribute("startDate", flight.getStartDate());
			session.setAttribute("finishDate", flight.getFinishDate());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'search.jsp'");
			script.println("</script>");
		}
		else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비행정보가 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
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