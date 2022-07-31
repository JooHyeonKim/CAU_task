package com.jsp.memo;

import java.sql.*;
import java.util.ArrayList;

public class MemoDAO {
	
	// 싱글톤 패턴으로 하기 
	// 전역 변수로 Connection PreparedStatement ResultSet 선언
	// 전역 변수로 url, id, pw, driver 선언하기
	
	private MemoDAO() {}
	
	private static MemoDAO instance = new MemoDAO();
	
	public static MemoDAO getInstance() {
		return instance;
	}
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String uid = "C##JSPUSER";
	private String upw = "jsp123";
	
	// 데이터를 넣는 메소드
	public int insertMemo(String nickName, String contents, Timestamp regTime) {
		int result = 0;
		
		String query = "insert into memo (memoId, nickName, contents, regTime) "
				+ "values (memo_seq.nextval, ?, ?, ?)";
		
		try {
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, nickName);
			pstmt.setString(2, contents);
			pstmt.setTimestamp(3, regTime);
			
			result = pstmt.executeUpdate();
			
			
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
	
	
	// 데이터 얻는 메소드
	public ArrayList<MemoDTO> memoList(){
		
		ArrayList<MemoDTO> list = new ArrayList<MemoDTO>();
		
		String query = "select * from memo order by memoId DESC";
		
		try {
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				int memoId = rs.getInt("memoId");
				String nickName = rs.getString("nickName");
				String contents = rs.getString("contents");
				Timestamp regTime = rs.getTimestamp("regTime");
				
				list.add(new MemoDTO(memoId, nickName, contents, regTime));
				
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
	
	// 데이터 삭제하는 메소드
	public int deleteMemo(int memoId) {
		
		int result = 0;
		
		String query = "delete from memo where memoId = ?";
		
		try {
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, memoId);
			
			result = pstmt.executeUpdate();
			
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
	
	
}










