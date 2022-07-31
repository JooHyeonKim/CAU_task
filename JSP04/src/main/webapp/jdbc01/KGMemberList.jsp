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
		// Connection : DB와 연결성을 갖는 인터페이스
		Statement stmt;
		// Statement : SQL문을 실행하는 인터페이스
		ResultSet rs;
		// ResultSet : 조회결과 데이터를 갖는 인터페이스
		
		String driver = "oracle.jdbc.OracleDriver";
		// OracleDriver : JDBC 드라이버 클래스
		// 자바 응용프로그램에서 데이터베이스에 접속하려명
		// 드라이버를 프로그램에 등록하는 코드를 제공해야 한다.
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		// jdbc:oracle:thin 는 사용하는 JDBC드라이버가 thin타입을 의미한다.
		// (thin >> 순수하게 자바클래스로 바로 DB와 연결)
		// 1521 은 오라클 리스너의 포트번호
		// xe 는 서버이름
		
		String uid = "C##JSPUSER";
		String upw = "jsp123";
		
		String query = "select * from KGMember";
			
	%>
	
	<%
	
		try{
			
			Class.forName(driver);
			// Oracle 드라이버클래스를 메모리에 로딩한다.
			
			conn = DriverManager.getConnection(url, uid, upw);
			// DriverManager 클래스는 JDBC드라이버를 통해서 
			// Connection을 만드는 역할을 한다.
			// getConnection 메소드로 Connection 객체를 생성한다.
			
			stmt = conn.createStatement();
			// SQL문을 전송하고 처리된 결과를 자바프로그램쪽으로 전달해주는
			// Statement 객체를 생성한다.
			
			rs = stmt.executeQuery(query); // "select * KGMember"
			// 반환하는 결과를 ResultSet으로 받는다.
			
			while(rs.next()){
				// 다음 레코드가 있는지 판단해서 없으면 false
				// 있으면 true를 반환한 다음에 커서를 다음레코드로 이동시킨다.
				
				String id = rs.getString("id");
				// 컬럼의 값을 추출하는 getter 메소드를 통하여
				// 해당 컬럼 이름으로 데이터를 얻어올 수 있다.
				
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String phone = rs.getString("phone");
				
				out.print("아이디 : " + id + ", 비밀번호 : " + pw + ", 이름 : "
					+ name + ", 나이 : " + age + ", 핸드폰 : " + phone + "<br>");
				
			}
			
			
		}catch(Exception e){
			
			e.printStackTrace();
			
		}finally{
			
			// DB관련 처리작업이 완료된 다음에는 사용했던 객체들은 메모리에서 
			// 해제해주어야 한다. 순서는 최근에 사용했던 객체부터 거꾸로 올라가며 해제한다.
			
			try{
				
				if(rs != null){rs.close();}
				if(stmt != null)stmt.close();
				if(conn != null)conn.close();
				
			}catch(Exception e2){}
			
			
		}
	
	%>
	
	
	
</body>
</html>









