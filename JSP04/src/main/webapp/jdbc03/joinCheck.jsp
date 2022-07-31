<%@page import="com.jsp.circle.CircleMemberDAO"%>
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
		
		1. 넘어온 데이터(parameter) 받기
		2. jsp useBean 액션태그를 사용해서 DTO 객체 생성하기
		3. setProperty 액션태그를 사용해서 DTO 객체에 데이터 넣기
		4. scriptlet으로 DAO 객체 생성 후 
		   insertCircle 메소드 호출하여 DB에 데이터 넣기
		
		5. 결과값을 얻은 후 회원가입이 정상적으로 완료되었다면
		   회원가입 축하합니다. 웹브라우저에 출력하기
		   a태그를 사용해서 회원목록을 보여주는 링크걸기
		   정상적으로 완료되지 않았다면 
		   회원가입 실패했습니다. 웹브라우저에 출력하기
	 --%>
	
	<%
		
		request.setCharacterEncoding("UTF-8");
	
		String name = request.getParameter("name");
		String strAge = request.getParameter("age");
		int age = Integer.parseInt(strAge);
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
	
	%>
	
	<jsp:useBean id="dto" class="com.jsp.circle.CircleMemberDTO" />
	
	<jsp:setProperty property="name" name="dto" value="<%=name %>"/>
	<jsp:setProperty property="age" name="dto" value="<%=age %>"/>
	<jsp:setProperty property="phone" name="dto" value="<%=phone %>"/>
	<jsp:setProperty property="email" name="dto" value="<%=email %>"/>
	
	<%
		CircleMemberDAO dao = CircleMemberDAO.getInstance();
	
		int result = dao.insertCircle(dto);
		
		if(result == 1){
	%>
			<h2>회원가입 축하합니다.</h2>
			<a href="circleMemberList.jsp">회원목록 보기</a>
			
	<%
		}else{
	%>
			<h2>회원가입 실패했습니다.</h2>
			<a href="circleJoin.html">회원 가입하기</a>
	<%
		}
	%>
	
</body>
</html>




