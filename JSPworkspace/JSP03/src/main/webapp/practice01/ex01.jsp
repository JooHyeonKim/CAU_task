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
		선언문으로 이름 나이 전화번호 변수 선언하기!
		스크립트릿으로 변수 초기화하기
		표현식으로 웹브라우저에 변수 출력하기
	 --%>
	 
	 <%!
	 	String name;
	 	int age;
	 	String tel;
	 %>
	 
	 <%
		name="김주현";
	 	age=23;
	 	tel="010-8597-8390";
	 %>
	 
	 김주현의 이름, 나이, 전화번호<br>
	 
	 이름 : <%= name %><br>
	 나이 : <%= age %><br>
	 전화번호 : <%= tel %>
	 
	 
</body>
</html>