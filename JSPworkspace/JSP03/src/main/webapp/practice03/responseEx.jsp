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
		폼에서 넘어온 데이터를 받고 이름이 홍길동과 같다면
		리다이렉트로 OK.jsp로 이동 요청하기
		다르다면 NG.jsp로 이동 요청하기
		
	 --%>
	 
	 <%
	 
	 	request.setCharacterEncoding("UTF-8");
	 	String answer= request.getParameter("ans");
	 
	 	if(answer.equals("홍길동")){
	 		response.sendRedirect("OK.jsp");
	 	}else{
	 		response.sendRedirect("NG.jsp");
	 	}
	 %>

</body>
</html>