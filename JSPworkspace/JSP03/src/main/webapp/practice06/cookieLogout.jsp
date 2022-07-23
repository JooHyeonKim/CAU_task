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
		모든 쿠키를 배열로 얻은다음
		쿠키값이 hong인 쿠키 삭제하기
		
		삭제 후 리다이렉트로 cookieTest.jsp로 이동하기
		
	 --%>
	 
	 <%
	 	Cookie[] cookies=request.getCookies();
	 
	 	for(int i=0;i<cookies.length;i++){
	 		
	 		String str=cookies[i].getValue();
	 		
	 		if(str.equals("hong")){
	 			cookies[i].setMaxAge(0);
	 			//유효시간을 0으로 설정
	 			response.addCookie(cookies[i]);
	 			response.sendRedirect("cookieTest.jsp");
	 			out.print(cookies[i].getName()+"쿠키가 삭제되었습니다.");
	 		}
	 	}
	 %>
	 
	 <a href="cookieTest.jsp">쿠키 확인</a>

</body>
</html>