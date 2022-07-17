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
		request.setCharacterEncoding("UTF-8");
	%>

	<jsp:forward page="food.jsp"></jsp:forward>
	
	<%--
		하나의 jsp페이지에서 다른 jsp 페이지로 요청처리를 전달할 때 사용한다
		웹브라우저의 주소는 그대로 요청받은 jsp 주소로 유지된다.
		요청 흐름이 이동될 때 request, response 기본객체가 전달된다.
		
	 --%>

</body>
</html>