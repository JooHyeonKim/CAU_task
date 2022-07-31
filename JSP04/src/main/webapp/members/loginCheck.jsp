<%@page import="com.jsp.members.MembersDAO"%>
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
		1. 아이디 비밀번호 받기
		2. DAO 객체 생성 후 userCheck 메소드 호출하기
		3. 결과값 받아 아이디 비밀번호가 맞으면 
		   session 객체에 id값을 세션값으로 설정하기 
	 --%>
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MembersDAO dao = MembersDAO.getInstance();
		
		int result = dao.userCheck(id, pw);
		
		
		if(result == -1){ // 아이디가 없는경우(회원이 아닌경우)
	%>
			<script>
				alert('아이디가 존재하지 않습니다.');
				history.back();
			</script>
	
	<%
		}else if(result == 0){ // 비밀번호가 틀린경우
	%>
			<script>
				alert('비밀번호가 틀립니다.');
				history.back();
			</script>
	
	<%
		}else if(result == 1){ // 아이디 비밀번호가 맞는경우
			
			session.setAttribute("id", id);
			response.sendRedirect("main.jsp");
			
		}
	%>
	
		
</body>
</html>






