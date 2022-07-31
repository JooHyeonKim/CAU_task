package com.jsp.members;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class MembersDAO {
	
	private DataSource ds;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private MembersDAO() {
		try {
			
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private static MembersDAO instance = new MembersDAO();
	
	public static MembersDAO getInstance() {
		return instance;
	}
	
	private void close(Connection conn) {
		
		try {
			if(conn != null) {
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private void close(PreparedStatement pstmt) {
		
		try {
			if(pstmt != null) {
				pstmt.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private void close(ResultSet rs) {
		
		try {
			if(rs != null) {
				rs.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// 회원가입 후 멤버의 정보를 넣어주는 메소드
	public int insertMember(MembersDTO dto) {
		int result = 0;
		
		String query = "insert into members(id, pw, name, email, address) "
				+ "values(?, ?, ?, ?, ?)";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getAddress());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(conn);
		}
		
		return result;
	}
	
	// members 테이블에 같은 아이디가 있는지 확인해주는 메소드
	// (아이디가 존재한다면 1, 존재하지 않는다면 0) 
	public int confirmId(String id) {
		int result = 0;
		String query = "select id from members where id = ?";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 멤버가 존재할때
				result = 1;
			}else {
				// 멤버가 존재하지 않을때
				result = 0;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		
		return result;
	}
	
	
	// 로그인 체크 메소드(id, pw 의 데이터를 받아서 DB연결 후 id로 pw 데이터 얻기)
	// (아이디가 존재하지 않으면 -1, 존재하고 비밀번호가 틀린경우 0, 존재하고 비밀번호가 맞는경우 1)
	public int userCheck(String id, String pw) {
		int result = 0;
		
		String query = "select pw from members where id = ?";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 아이디가 존재할때
				
				String dbPw = rs.getString("pw");
				
				if(dbPw.equals(pw)) {
					result = 1; // 로그인 OK
				}else {
					result = 0; // 비밀번호 X
				}
				
			}else { // 아이디가 존재하지 않을때
				result = -1;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		
		return result;
	}
	
	// 회원의 정보를 얻는메소드
	public MembersDTO getMember(String id) {
		
		MembersDTO dto = null;
		String query = "select * from members where id = ?";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				String dbId = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Timestamp regDate = rs.getTimestamp("regDate");
				String address = rs.getString("address");
				
				dto = new MembersDTO(dbId, pw, name, email, regDate, address);
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		
		return dto;
	}
	
	// 회원의 정보를 수정하는 메소드
	public int updateMember(MembersDTO dto) {
		int result = 0;
		
		String query = "update members set pw = ?, email = ?, address = ? "
				+ "where id = ?";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getId());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(conn);
		}
		
		return result;
	}
	
	// 회원탈퇴(회원삭제) 하는 메소드
	public int deleteMember(String id) {
		int result = 0;
		String query = "delete from members where id = ?";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
			close(conn);
			
		}
		
		return result;
	}
	
	
	
	
	
	
}
