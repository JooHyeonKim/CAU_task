<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%!
		
		Connection conn;
		Statement stmt;
		ResultSet rs;
		
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "C##JSPUSER";
		String upw = "jsp123";
		String query = "select * from KGMember";
			
	%>
	
	<%
	
		try{
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(query); // "select * KGMember"
			
			while(rs.next()){
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String phone = rs.getString("phone");
				
				out.print("<p>아이디 : " + id + ", 비밀번호 : " + pw + ", 이름 : "
					+ name + ", 나이 : " + age + ", 핸드폰 : " + phone + "</p>");
				
			}
			
			
		}catch(Exception e){
			
			e.printStackTrace();
			
		}finally{
			try{
				if(rs != null){rs.close();}
				if(stmt != null)stmt.close();
				if(conn != null)conn.close();
				
			}catch(Exception e2){}
			
			
		}
	
	%>
	
	
	<a href="KGMemberJoin.html">KGMember 회원가입</a>
	
	
</body>
</html>









