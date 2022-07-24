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
		어플리케이션 객체를 사용해서 웹브라우저에 방문시 방문자수 출력하기
		(applicationEx.jsp)
		
	 --%>
	 
	 <%
	 	int count=0;
	 //방문자 수가 이미 있다면 어플리케이션에서 꺼내줘야함
	 if(application.getAttribute("visit")!=null){
		 count=(Integer)application.getAttribute("visit");
	 }
	 count++;
	 
	 application.setAttribute("visit", count);
	 
	 %>
	 
	 <h2>현재 방문자 수 : <%=count %> 명 입니다.</h2>
	 <!--  주소를 복사한 뒤 다른 브라우저에서 열어도 방문자수가 유지됨. -->

</body>
</html>