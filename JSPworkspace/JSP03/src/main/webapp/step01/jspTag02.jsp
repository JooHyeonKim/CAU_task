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
		선언(declaration)문 알아보기
		
		JSP 페이지 내에서 사용되는 전역변수 또는 메소드를 선언할 때 사용
		여기서 선언된 변수 및 메소드는 전역의 의미로 사용된다.
		
	 --%>
	 
	 <%!
	 	String name="김주현";
	 	int age=23;
	 %>
	 
	 <%!
	 	public int add(int x, int y){
		 return x+y;
	 }
	 %>
	 
	 <%
	 	out.print("이름 : "+name+"<br>");
	 	out.print("나이 : "+age+"<br>");
	 	
	 	out.print("10 + 20 : "+add(10,20) +"<br>");
	 	
	 %>

</body>
</html>