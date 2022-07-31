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
		EL은 서블릿 보관소에 저장된 데이터를 사용할 수 있다.
		(어플리케이션, 세션, 페이지, request)
	 --%>
	
	<%
		application.setAttribute("appli_name", "appli_value");
		session.setAttribute("session_name", "session_value");
		pageContext.setAttribute("page_name", "page_value");
		request.setAttribute("req_name", "req_value");
	%>
	
	어플리케이션 : ${applicationScope.appli_name }<br>
	세션 : ${sessionScope.session_name }<br>
	페이지 : ${pageScope.page_name }<br>
	request : ${requestScope.req_name }<br>
	
	
	
</body>
</html>