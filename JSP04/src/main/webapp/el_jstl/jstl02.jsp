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
		choose 는 자바의 switch문과 비슷한 역할을 한다.
		case 와 같은 역할을 하는 것은 choose 안의 when 태그이다.
		default문과 같은역할을 하는 것은 choose 안의 otherwise 이다.
	 --%>
	
	<c:set var="a" value="30" />
	
	<c:choose>
		
		<c:when test="${a == 10}">
			a는 10 입니다.<br>
		</c:when>
		
		<c:when test="${a == 20}">
			a는 20 입니다.<br>
		</c:when>
		
		<c:otherwise>
			a는 10과 20이 아닙니다.<br>
		</c:otherwise>
		
	</c:choose>
	
	<hr>
	
	<%--
		forEach : for문
	 --%>
	
	<c:forEach var="i" begin="0" end="30" step="3">
		
		${i}
		
	</c:forEach>
	
	<hr>
	
	<%
		ArrayList<String> list = new ArrayList<>();
	
		list.add("홍길동");
		list.add("성춘향");
		list.add("이몽룡");
		
		request.setAttribute("list", list);
		
	%>
	
	
	<c:forEach var="list" items="${requestScope.list}" >
		${list} <br>
	</c:forEach>
	
	<%--
		items 속성에 collection 객체를 넣어주면
		순서대로 반복이 된다.
	 --%>
	
</body>
</html>


