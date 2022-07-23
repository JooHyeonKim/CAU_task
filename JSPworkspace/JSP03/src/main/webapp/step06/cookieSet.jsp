<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		Cookie cookie=new Cookie("cookieName","cookieValue");
		//쿠키 : 서버와 클라이언트의 관계를 유지하기 위한 수단
		//쿠키생성 new Cookie("쿠키이름", "쿠키 값");
		//매개값은 문자열로
		
		cookie.setMaxAge(60*60); //1시간동안 쿠키 유지
		//쿠키는 보통 유효시간을 정해주지 않으면 웹브라우저를 닫음과 동시에
		//쿠키가 삭제된다. 그러나 유효시간을 정해놓으면 설정해놓은 유효시간 동안
		//쿠키가 존재하게 되고 웹브라우저를 닫아도 쿠키는 삭제되지 않는다.
		
		//서버에서 쿠키를 생성하고 속성을 설정한것.
		//쿠키의 유효시간 설정
		//60초*60 =1분*60 = 1시간
		
		response.addCookie(cookie);
		//response 객체의 addCookie 메소드로 쿠키객체를 웹브라우저에 심는다.		
	%>
	
	<p>쿠키가 탑재되었습니다.</p>
	
	<a href="cookieGet.jsp">쿠키 얻기</a>

</body>
</html>