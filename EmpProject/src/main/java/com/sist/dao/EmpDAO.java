package com.sist.dao;
import java.util.*;
import java.sql.*;
public class EmpDAO {
	// 오라클 연결
	private Connection conn;
	// SQL을 전송하는 객체
	private PreparedStatement ps;
	// 오라클 주소
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	// Driver 등록
	public EmpDAO() {
		try {
			// new 대신 사용 => 클래스명으로 메모리 할당(리플렉션)
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 오라클 연동
	public void getConnection() {
		try {
			// conn hr/happy
			conn=DriverManager.getConnection(URL, "hr", "happy");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 오라클 연동해제
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	////////////////////////////////////////////////////////////// 필수
	// 전체 데이터를 읽어온다
	public ArrayList<EmpVO> empListData(){
		ArrayList<EmpVO> list=new ArrayList<EmpVO>();
		try {
			// 연결
			getConnection();
			// SQL문장 전송
			String sql="SELECT empno,ename,job,hiredate,sal "
					 + "FROM emp "
					 + "ORDER BY 1";
			ps=conn.prepareStatement(sql);
			// Enter
			ResultSet rs=ps.executeQuery();
			// 한 ROW씩 읽어온다
			while(rs.next()) {
				EmpVO vo=new EmpVO();
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setJob(rs.getString(3));
				vo.setHiredate(rs.getDate(4));
				vo.setSal(rs.getInt(5));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 닫기
			disConnection();
		}
		return list;
	}
}
