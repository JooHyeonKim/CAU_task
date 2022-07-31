<%@page import="com.jsp.circle.CircleMemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jsp.circle.CircleMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%--
		DAO 객체를 생성후 circleList 메소드 호출하여 
		ArrayList 객체를 얻은 후 
		list안에있는 DTO 객체들의 데이터(이름, 나이, 전화번호, 이메일)를 출력하기
	 --%>
	
	<%
		CircleMemberDAO dao = CircleMemberDAO.getInstance();
		
		ArrayList<CircleMemberDTO> list = dao.circleList();
		
		out.print("<h1>동아리 회원 목록</h1>");
		
		for(int i = 0; i < list.size(); i++){
			
			CircleMemberDTO dto = list.get(i);
			
			out.print("<p>이름 : " + dto.getName() + ", 나이 : " + dto.getAge()
			+ ", 핸드폰 : " + dto.getPhone() + ", 이메일 : " + dto.getEmail() + "</p>");
			
		}
		
	%>
	
	<a href="circleJoin.html">동아리 회원가입하기</a>
	
</body>
</html>