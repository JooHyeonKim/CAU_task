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
		모든 세션의 데이터를 삭제하기
		a태그로 세션확인하는 링크 걸기
		
	 --%>
	 
	 <%
	 
	 	session.invalidate();
	 %>
	 
	 <h2>로그아웃 되었습니다.</h2>
	 <a href="sessionTest.jsp">세션 확인하기</a>
</body>
</html>