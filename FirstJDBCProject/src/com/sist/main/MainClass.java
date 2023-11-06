package com.sist.main;
import java.sql.*;
public class MainClass {
	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 드라이버 설정
			// 오라클 연결 conn hr/happy
			String url="jdbc:oracle:thin:@localhost:1521:XE"; // 오라클 주소
			// 네트워크 => ip : @localhost / port : 1521 / XE => 데이터베이스 이름
			// 윈도우 => 파일 / 폴더
			// 데이터베이스 => 테이블(book,emp,dept...)
			String id="hr";
			String pwd="happy";
			Connection conn=DriverManager.getConnection(url, id, pwd); // 오라클 연결
			String sql="SELECT ename,hiredate,job FROM emp";
			PreparedStatement ps=conn.prepareStatement(sql); // 오라클로 sql문장 보내기
			ResultSet rs=ps.executeQuery(); // 결과값 가져오기
			while(rs.next()) {
				System.out.println(rs.getString(1)+"\t"
						+rs.getDate(2)+"\t"
						+rs.getString(3));
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
