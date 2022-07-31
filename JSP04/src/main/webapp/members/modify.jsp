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
		수정 폼 만들기 
		(비밀번호, 이메일, 주소)
		1. 세션에 있는 id 꺼내기
		2. DAO객체 생성후 getMember 메소드 호출하여 DTO 객체얻기
		3. 수정폼 만들기
	 --%>
	
	<%
		String id = (String)session.getAttribute("id");
	
		MembersDAO dao = MembersDAO.getInstance();
		
		MembersDTO dto = dao.getMember(id);
	%>
	
	
	<h2><%=dto.getName() %>님의 회원 정보 수정</h2>
	
	<form name="modifyForm" action="modifyCheck.jsp" method="post">
		아이디 : <%=dto.getId() %><br>
		비밀번호 : <input type="password" name="pw" size="10"><br>
		비밀번호 확인 : <input type="password" name="pwCheck" size="10"><br>
		
		이름 : <%=dto.getName() %><br>
		이메일 : <input type="text" name="email" value="<%=dto.getEmail() %>" ><br>
		주소 : <input type="text" name="address" value="<%=dto.getAddress()%>"><br>
		
		<input type="submit" value="정보수정">
		
	</form>
	
	
</body>
</html>













