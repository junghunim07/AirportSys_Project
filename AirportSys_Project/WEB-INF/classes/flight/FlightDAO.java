package flight;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FlightDAO {
	private Connection conn;
	private ResultSet rs;
	
	public FlightDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/AirportSys_project";
			String dbID = "root";
			String dbPassword = "0000";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int search(String startPoint, String finishPoint, String startDate, String finishDate) {
		String SQL = "SELECT STARTPOINT, FINISHPOINT, STARTDATE, FINISHDATE FROM FLIGHT "
				+ "WHERE STARTPOINT = ? AND FINISHPOINT = ? AND STARTDATE = ? AND FINISHDATE = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, startPoint);
			pstmt.setString(2, finishPoint);
			pstmt.setString(3, startDate);
			pstmt.setString(4, finishDate);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(startPoint) && rs.getString(2).equals(finishPoint)
						&& rs.getString(3).equals(startDate) && rs.getString(4).equals(finishDate)) {
					return 1;
				} else {
					return 0;								// 데이터 없음
				}
			}
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public ArrayList<Flight> getList(String startPoint, String finishPoint, String startDate, String finishDate) {
		String SQL = "SELECT * FROM FLIGHT WHERE STARTPOINT = ? AND FINISHPOINT = ? AND STARTDATE = ? AND FINISHDATE = ? ORDER BY STARTTIME ASC";
		ArrayList<Flight> list = new ArrayList<Flight>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, startPoint);
			pstmt.setString(2, finishPoint);
			pstmt.setString(3, startDate);
			pstmt.setString(4, finishDate);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Flight flight = new Flight();
				flight.setFlightID(rs.getInt(1));
				flight.setAirportName(rs.getString(2));
				flight.setAirlineName(rs.getString(3));
				flight.setStartPoint(rs.getString(4));
				flight.setFinishPoint(rs.getString(5));
				flight.setStartTime(rs.getString(6));
				flight.setFinishTime(rs.getString(7));
				flight.setStartDate(rs.getString(8));
				flight.setFinishDate(rs.getString(9));
				list.add(flight);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
