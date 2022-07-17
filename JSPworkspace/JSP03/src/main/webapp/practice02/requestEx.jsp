<%@page import="java.util.Arrays"%>
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
		1.선언문으로 폼에서 넘어올 데이터를 받을 변수 선언
		2. 스크립스트릿으로 넘어온 데이터 받기
		3. 표현식으로 웹브라우저에 출력하기전화번호 : 010-1111-2222
주민번호 : 0000000000000
취미 : [산책, 노래, 춤]
		
	 --%>
	 
	 <%!
	 	String name, age, tel, ssn, area;
	 	
	 	String[] hobby;
	 %>
	 
	 <%
	 	request.setCharacterEncoding("UTF-8");
	 
		name=request.getParameter("name");
	 	age=request.getParameter("age");
	 	tel=request.getParameter("tel");
	 	ssn=request.getParameter("ssn");
	 	area=request.getParameter("area");
	 	
	 	hobby=request.getParameterValues("hobby");
	 %>
	 
	 <h2>form에서 넘어온 정보</h2>
	 
	 이름 : <%=name %><br>
	 나이 : <%=age %><br>
	 전화번호 : <%=tel %><br>
	 주민번호 : <%=ssn %><br>
	 취미 : <%=Arrays.toString(hobby) %><br>
	 사는지역 : <%=area %><br>
	 

</body>
</html>