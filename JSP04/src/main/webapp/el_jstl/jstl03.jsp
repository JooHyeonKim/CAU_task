<%@page import="com.jsp.jstl.MemberJSTL"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%--
		1. ArrayList<MemberJSTL> 객체 생성하기
		2. list 안에 MemberJSTL 객체 3개 넣기
		3. request 영역에 바인딩하기
		4. el과 jstl을 사용해서 MemberJSTL 객체안에
		   아이디, 비밀번호, 이름, 나이 출력하기 
	 --%>
	
	<%
		
		ArrayList<MemberJSTL> list = new ArrayList<MemberJSTL>();
	
		list.add(new MemberJSTL("hong", "1234", "홍길동", 20));
		list.add(new MemberJSTL("sung", "5678", "성춘향", 21));
		list.add(new MemberJSTL("mong", "1111", "이몽룡", 22));
		
		request.setAttribute("list", list);
	%>
	
	<c:forEach var="member" items="${requestScope.list }">
		
		아이디 : ${member.id }<br>
		비밀번호 : ${member.pw }<br>
		이름 : ${member.name }<br>
		나이 : ${member.age }<br>
		<hr>
		
	</c:forEach>
	
	
	
</body>
</html>





