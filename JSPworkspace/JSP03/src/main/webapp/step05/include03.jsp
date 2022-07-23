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
		int a=100;
	%>

	<h3>include03 페이지 입니다.</h3>
	
	<jsp:include page="include04.jsp"/>
	
	<%--
		include 액션태그를 만나면 해당페이지로
		실행제어가 넘어가서 포함되는 페이지를 실행시킨다.
		해당페이지의 실행이 종료되면 원래페이지로 복귀하며
		최종적으로 클라이언트에게 보여지게 된다.
		
		페이지로 넘어가서 실행되고 결과를 가져옴
	 --%>
	
	<h1>다시 include03 페이지 입니다.</h1>

</body>
</html>