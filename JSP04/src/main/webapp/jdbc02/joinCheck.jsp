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
		
	%>
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String str = request.getParameter("age");
		int age = Integer.parseInt(str);
		String phone = request.getParameter("phone");
		
		String query = "insert into KGMember values('" + id + 
				"', '" + pw + "', '" + name + "', " + age + 
				", '" + phone + "')";
		
		try{
			
			Class.forName(driver);
			
			conn = DriverManager.getConnection(url, uid, upw);
			
			stmt = conn.createStatement();
			
			int su = stmt.executeUpdate(query);
			
			if(su == 1){
				System.out.println("insert 성공!!");
				out.print("<h2>회원가입 되었습니다.</h2>");
				out.print("<a href=\"memberList.jsp\">회원 목록보기</a>");
			}else{ 
				System.out.println("insert 실패!!");
			}
			
			
		}catch(Exception e){
			
			e.printStackTrace();
			
		}finally{
			
			try{
				
				if(stmt != null)stmt.close();
				if(conn != null)conn.close();
				
			}catch(Exception e2){}
			
		}
		
		
		
	%>
	
	
	
	
	
	
	
	
	
	
</body>
</html>