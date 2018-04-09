package com.webjjang.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MariaDBUtil {

	// 마리아DB에 접속 할 때 필요한 정보들
	private static String driver = "org.mariadb.jdbc.Driver"; // 오라클사에서 제공
	// server 정보
	private static String server = "jdbc:mariadb://127.0.0.1:3306/test";
	private static String uid = "root";
	private static String upw = "0000";

	static { // 1. 드라이버 확인 --> static으로 자동 초기화 블록실행
		try {
			Class.forName(driver);
			System.out.println("정상적으로 jdbc 드라이버가 확인 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// static 생성자
		// 2.연결
		// connection 객체를 전달해주는 프로그램 작성

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(server, uid, upw);
	}// end of getConnection()

	// DB관련 객체를 닫는 메서드 - select
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) throws SQLException {
		close(con, pstmt);
		if (rs != null)
			rs.close();
	}// end of close(con,pstmt,rs)

	// DB관련 객체를 닫는 메서드 - insert, update, delete
	public static void close(Connection con, PreparedStatement pstmt) throws SQLException {
		if (con != null)
			con.close();
		if (pstmt != null)
			con.close();
	}// end of close(con,pstmt)

}// end of class MariaDBUtil
