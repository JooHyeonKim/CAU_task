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
		include란 현재문서에 다른문서,
		즉 다른 파일의 내용을 포함시켜 출력하는것을 말한다.
	 --%>
	  
	  <%
	  	int a=100;
	  %>
	 
	 <h1>include01 페이지 입니다.</h1>
	 
	 <%@include file="include02.jsp" %>
	 
	 <%--
	 지시자 include는 주로 조각난 코드를 삽입을 하고자 할때 사용된다.
	 요청한 소스코드를 텍스트를 포함해서 하나로 인식해서 컴파일한다.
	 텍스트 자체가 그대로 여기로 와서 실행
	 많이 사용
	  --%>
	 
	 
	 <h3>다시 include01 페이지 입니다.</h3>

</body>
</html>