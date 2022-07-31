<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>EL 표현식으로 데이터 꺼내기</h2>
	
	<%
		request.setAttribute("score", new int[] {10, 20, 30, 40});
	%>
	
	배열 : ${score[2] }<br>
	
	<hr>
	
	<%
		ArrayList<String> list = new ArrayList<>();
		list.add("홍길동");
		list.add("성춘향");
		list.add("이몽룡");
		
		request.setAttribute("list", list);
		// request 영역에 list 객체를 바인딩한다.
	%>
	
	List : ${list[1] }<br>
	
</body>
</html>





