<%@page import="com.jsp.members.MembersDTO"%>
<%@page import="com.jsp.members.MembersDAO"%>
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
		1. session 객체에 있는 id 꺼내기
		2. DAO 객체 생성 후 getMember 메소드 호출하기
		3. DTO 객체에 이름(name)을 꺼내서 이름 출력하기 
	 --%>
	
	<%
		
		if(session.getAttribute("id") == null){
			response.sendRedirect("login.jsp");
			return;
		}
		
		String id = (String)session.getAttribute("id");
		
		MembersDAO dao = MembersDAO.getInstance();
		
		MembersDTO dto = dao.getMember(id);
		
	%>
	
	<h1><%=dto.getName() %>님 안녕하세요.</h1>
	
	
	<a href="logout.jsp">로그아웃</a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	
	<a href="modify.jsp">회원 정보수정</a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	
	<a href="delete.jsp">회원탈퇴</a>
	
	
</body>
</html>











