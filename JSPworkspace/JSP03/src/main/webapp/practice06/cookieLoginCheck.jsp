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
	
		1. 폼에서 넘어온 아이디와 비밀번호 받기
		
		2. 아이디가 hong이고 비밀번호가 1234 라면
			받은 아이디값으로 쿠키값 설정하기  new cookie("id", id);
			웹브라우저에 쿠키 탑재 후 리다이렉트로 cookieMain.jsp로 보내기
			
		3. 아이디나 비밀번호가 틀리다면 리다이렉트로 cookieLogin.html로 보내기
		
	 --%>
	 
	 <%
	 request.setCharacterEncoding("UTF-8");
	 
	 String id=request.getParameter("id");
	 String pw=request.getParameter("pw");
	 
	 if(id.equals("hong") && pw.equals("1234")){
		 
		 Cookie cookie=new Cookie("id",id);
		 cookie.setMaxAge(60*60);
		 
		 response.addCookie(cookie);
		 response.sendRedirect("cookieMain.jsp");
		 
	 }else{
		 
		 response.sendRedirect("cookieLogin.html");
	 }
	 %>
	 
	 
	

</body>
</html>