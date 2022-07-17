
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
		Date 클래스와 SimpleDateFormat 클래스로
		오늘의 날짜를 웹브라우저에 출력하기 (스크립트릿, 표현식)
	 --%>

	 <%
	 
	 	Date now=new Date();
	 
	 	out.print(now + "<br>");
	 	
	 	SimpleDateFormat format1=new SimpleDateFormat("yyyy년 MM월 dd일");
	 	SimpleDateFormat format2=new SimpleDateFormat("a hh시 mm분 ss초");
	 	
	 	String date=format1.format(now);
	 	String time=format2.format(now);
	 	
	 %>
	 
	 <p>오늘의 날짜 : <%=date %></p>
	 <p>현재시간 : <%=time %></p>

</body>
</html>