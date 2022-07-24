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
		application 객체는 jsp에서 따로 선언하지 않아도 사용할 수 있는 내장객체이다.
		자신이 속한 웹어플리케이션 범위 안의 모든 jsp 범위에서 공유된다.
		
	 --%>
	 
	 <%
	 	application.setAttribute("name", "홍길동");
	 	//"name" :ID, "홍길동":password
	 	application.setAttribute("age", 20);
	 	application.setAttribute("age", 25);//age=25로 바뀜
	 
	 	//setAttribute("어플리케이션이름",값);
	 	//이름은 String 타입으로 들어가고 value는 Object 타입이다.
	 	
	 %>
	 
	 <h2>어플리케이션에 저장하였습니다.</h2>
	 <a href="applicationGet.jsp">어플리케이션 얻기</a>

</body>
</html>