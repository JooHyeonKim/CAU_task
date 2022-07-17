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
		1~10까지 수 중 정수하나를 반환해주는 메소드 만들기
		(선언문, Math.random() 사용)
	 --%>
	 
	 
	  
	  <%! 
	  	public int randomSu(){
		 int randomSu= (int)(Math.random()*10)+1;
		 return randomSu;
	  }
	  %>
	  
	  <%--
	 	웹브라우저에 메소드 호출하여 오늘의 번호 출력하기
	  --%>
	  
	  <h2> 오늘의 번호는 : <%=randomSu() %></h2>

</body>
</html>