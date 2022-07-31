package com.jsp.dbcp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class KGMemberDAO {
	
	
	private DataSource ds;
	// Connection pool을 관리하는 객체
	
	public KGMemberDAO() {
		
		try {
			
			Context context = new InitialContext();
			// JNDI 서비스를 제공하는 객체를 생성한다.
			// JNDI : Java Naming & Directory Interface 
			// "이름" 을 가지고 데이터베이스 정보(객체)를 얻을 수 있는 API
			
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<KGMemberDTO> memberList(){
		
		ArrayList<KGMemberDTO> list = new ArrayList<KGMemberDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = ds.getConnection();
			// DataSource 를 통해 Connection 객체를 얻는다.
			pstmt = conn.prepareStatement("select * from KGMember");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String phone = rs.getString("phone");
				
				list.add(new KGMemberDTO(id, pw, name, age, phone));
				
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
