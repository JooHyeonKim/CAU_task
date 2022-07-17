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
		넘어온 데이터 받아서 해당 나라입니다. 출력하기
		
	 --%>

	<%
		String nation=request.getParameter("nation");
		String name=request.getParameter("name");
	%>
	
	<h2> <%=name%>님 <%=nation %>으로 출발합니다 </h2>
	 

</body>
</html>