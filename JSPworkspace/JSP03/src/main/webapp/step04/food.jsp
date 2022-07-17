<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String food=request.getParameter("food");
	%>
	
	<h2>홍길동 님은 <%=food %>을(를) 좋아하시네요~!!</h2>

</body>
</html>