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
		모든 쿠키를 배열로 얻은 후
		반복문을 통해 쿠키값을 얻는다.
		쿠키값이 hong과 일치한다면 웹브라우저에 
		홍길동님 안녕하세요~! 출력하기
		
		a태그로 로그아웃 페이지로 이동하기
		
	 --%>
	 
	 <%
	 
		 Cookie[] cookies=request.getCookies();
	 
	 	for(int i=0;i<cookies.length;i++){
	 		
	 		String id=cookies[i].getValue();
	 		
	 		if(id.equals("hong")){
	 			
	 			out.print("<h2>홍길동님 안녕하세요~!!</h2>");
	 		}
	 	}
	 
	 %>
	 
	 <a href="cookieLogout">로그아웃</a>
	
	 

</body>
</html>