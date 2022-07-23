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
 		1.  세션객체안의 모든 이름들을 Enumeration으로 받기
 		
 		2. 세션 이름과 세션값을 얻은 다음 세션값이 sung과 같다면
 			웹브라우저에 성춘향님 안녕하세요~! 출력하기
 			
 		3. a태그 사용해서 세션확인하는 링크와 로그아웃하는 링크 걸기
 		
 	 --%>
 	 
 	 <%
 	 	Enumeration<String> e = session.getAttributeNames();
 	 
		while(e.hasMoreElements()){
			
			String sName=e.nextElement();
			String sValue=session.getAttribute(sName).toString();
			
			if(sValue.equals("sung")){
				
				out.print("<h2> 성춘향님 안녕하세요~!!</h2>");
			}
		}
 	 %>
 	 
 	 <a href="sessionTest.jsp">세션 확인하기</a>
 	 &nbsp;&nbsp;&nbsp;
 	 
 	 <a href="sessionLogout.jsp">로그아웃</a>
 	 
 	 

</body>
</html>