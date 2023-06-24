package checkin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CheckinDAO {
	private Connection conn;
	private ResultSet rs;
	
	public CheckinDAO() {
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
	
	public int write(String userID, String userName, int flightID, String airportName, String airlineName, String startPoint,
			String finishPoint, String startTime, String finishTime, String startDate, String finishDate) {
		String SQL = "INSERT INTO CHECKIN VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userName);
			pstmt.setInt(3, flightID);
			pstmt.setString(4, airportName);
			pstmt.setString(5, airlineName);
			pstmt.setString(6, startPoint);
			pstmt.setString(7, finishPoint);
			pstmt.setString(8, startTime);
			pstmt.setString(9, finishTime);
			pstmt.setString(10, startDate);
			pstmt.setString(11, finishDate);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -3;
	}
	
	public int delete(String userID) {
		String SQL = "DELETE FROM CHECKIN WHERE USERID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;			
	}
	
	public ResultSet check(String userID) {
		String SQL = "SELECT * FROM CHECKIN WHERE USERID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			return pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
