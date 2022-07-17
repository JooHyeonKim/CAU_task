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
		jsp 액션태그로 nation.jsp로 forward 하기
	 --%>
	 
	 <%
	 	request.setCharacterEncoding("UTF-8");
	 %>
	 
	 
	 <jsp:forward page="nation.jsp">
	 
	 	<jsp:param value="홍길동" name="name"/>
	 	
	 </jsp:forward>

</body>
</html>