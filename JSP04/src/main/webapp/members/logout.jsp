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
		로그아웃하기
		login.jsp 로 리다이렉트 하기 
	 --%>
	
	<%
		session.invalidate();
	%>
	
	<script>
		alert('로그아웃 되었습니다.');
		window.location = 'login.jsp';
	</script>
	
</body>
</html>