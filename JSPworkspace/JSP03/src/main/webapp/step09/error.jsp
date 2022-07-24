<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page errorPage="errorPage.jsp" %>

<!-- 
 	현재 jsp 페이지에서 예외가 발생했을 때 사용자에게 보여줄
 	예외화면을 처리할 jsp페이지의 경로를 지정한다.
 	에러가 발생하면 errorPage.jsp 페이지로 넘기겠다~
 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
		int i= 10 / 0;//오류발생
		//505오류 발생 : 서버에서 자바를 실행하다가 에러가 났을 때
	%>

</body>
</html>