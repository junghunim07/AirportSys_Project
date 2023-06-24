package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);				// ?에 userID를 들어가게 해줌.
			rs = pstmt.executeQuery();
			if (rs.next()) {						// 결과가 존재한다면 if문 실행.
				if (rs.getString(1).equals(userPassword)) {
					return 1;						// 로그인 성공.
				}
				else
					return 0;						// 비밀번호 불일치.
			}
			return -1; 								// 아이디가 없음.
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;									// 데이터베이스 오류
	}
	
	public String findUserName (String userID) {
		String SQL = "SELECT USERNAME FROM USER WHERE USERID = ?";
		String userName = null;
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userName = rs.getString("USERNAME");
				if (userName != null) {
					return userName;
				}
				else {
					return "a";
				}
			}
			return userID;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "c";
	}
}
