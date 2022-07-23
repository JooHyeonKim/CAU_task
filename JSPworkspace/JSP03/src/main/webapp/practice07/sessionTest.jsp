<%@page import="java.util.Enumeration"%>
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
		세션에 있는 이름과 값들을 모든 웹브라우저에 출력하기
		만약에 세션안의 데이터가 없다면 모든 세션이 삭제되었다고 웹브라우저에 출력하기
	 --%>


	<%
		Enumeration<String> e=session.getAttributeNames();
	
		int count=0;
	
		while(e.hasMoreElements()){
			
			count++;
			
			String sName=e.nextElement();
			String sValue=session.getAttribute(sName).toString();
			
			out.print("세션이름 : "+sName+"<br>");
			out.print("세션 값 : "+sValue+"<br>");
		}
		
		if(count==0){
			out.print("해당 세션이 모두 삭제되었습니다.");
		}
	
	
	%>


	 
	

</body>
</html>