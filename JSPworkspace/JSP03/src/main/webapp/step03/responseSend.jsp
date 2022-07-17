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
		//숫자인 문자열로 넘어옴
		
		String str=request.getParameter("age");
	
		int age=Integer.parseInt(str);
		
		if(age>=20){
			
			response.sendRedirect("OK.jsp?age="+age);
			
		}else{
			response.sendRedirect("NG.jsp?age="+age);
			
		}
		
		//서버는 클라이언트 요청에 대해 특정 URL로 이동을 요청할 수 있다.
		//이를 리다이렉트라고 한다. 데이터 없이 단순이동일때 주로 사용한다.
		//URL에 데이터를 넣어서 전송할 때 url뒤에 ?로 하고 
		//[변수이름=데이터] >>이렇게 넣을 수 있다.
		//sendRedirect는 get 방식과 같아서
		// 다른 jsp에서 request.getParameter() 메소드로 받을 수 있다.
		
	%>

</body>
</html>