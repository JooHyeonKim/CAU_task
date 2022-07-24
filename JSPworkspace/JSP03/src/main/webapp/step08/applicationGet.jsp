<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%!
		String name;
		int age;
		
	%>
	
	<%
		//확인을 안해주면 캐스팅 시 오류 발생
		//if(application.getAttribute("name")!=null){
			
			name=(String)application.getAttribute("name");
			
		//}
		
		if(application.getAttribute("age")!=null){
			age=(Integer)application.getAttribute("age");
		}
	%>
	
	<h2>어플리케이션에 저장한 이름 : <%=name %></h2>
	
	<h2>어플리케이션에 저장한 나이 : <%=age %></h2>
	
	<!-- 어플리케이션 : 웹브라우저가 종료되어도 유지됨. 서버가 종료되기 전까지 유지 -->

</body>
</html>