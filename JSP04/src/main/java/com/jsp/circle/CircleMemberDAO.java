package com.jsp.circle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CircleMemberDAO {
	
	// 싱글톤 : 단 하나의 객체만 생성하는 것
	
	private CircleMemberDAO() {}
	
	private static CircleMemberDAO instance = new CircleMemberDAO();
	
	public static CircleMemberDAO getInstance() {
		return instance;
	}
	
	// 싱글톤을 쓰는 이유
	// 고정된 메모리 영역을 얻으면서 한번의 new로 인스턴스를 사용하기 때문에
	// 메모리낭비를 방지할 수 있다. 또한 싱글톤으로 만들어진 클래스의 인스턴스는
	// 전역인스턴스 이기 때문에 다른 클래스의 인스턴스들이 공유하기 쉽니다.
	// DBCP(DataBase Connection Pool) 처럼 공통된 객체를
	// 여러개 생성해서 사용해야 하는 상황에서 많이 사용한다.
	
	
	// 데이터를 넣는 메소드
	public int insertCircle(CircleMemberDTO dto) {
		
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 자바에서 데이터베이스 쿼리문을 전송할때 사용할 수 있는 
		// 인터페이스는 Statement, PreparedStatement 2가지가 있다.
		
		// PreparedStatement 는 Statement 를 상속받은 인터페이스
		// 1. Statement의 기능향상 (여러번 수행할때 빠른속도)
		// 2. 코드안정성과 가독성이 높다.
		
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "C##JSPUSER";
		String upw = "jsp123";
		
		String query = "insert into circleMember(name, age, phone, email) "
				+ "values(?, ?, ?, ?)";
		// 변수가 들어갈 자리는 ?로 써준다.
		
		try {
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getAge());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getEmail());
			
			result = pstmt.executeUpdate();
			// 반환결과는 레코드(행)의 수
			// 아무 리턴이 없으면 0
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			}catch(Exception e2) {}
			
		}
		
		
		return result;
	}
	
	// 데이터를 얻는 메소드
	public ArrayList<CircleMemberDTO> circleList(){
		
		ArrayList<CircleMemberDTO> list = new ArrayList<CircleMemberDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "C##JSPUSER";
		String upw = "jsp123";
		
		String query = "select * from circleMember";
		
		try {
			
			Class.forName(driver);
			
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				
				list.add(new CircleMemberDTO(name, age, phone, email));
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
				
			}catch(Exception e2) {}
			
		}
		
		return list;
	}
	
	
	
	
}
