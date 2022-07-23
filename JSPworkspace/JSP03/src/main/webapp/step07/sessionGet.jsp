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

	<%
	
	Object obj1 = session.getAttribute("sessionName");
	
	Object obj2 = session.getAttribute("sessionNumber");
	//getAttribute의 반환타입은 Object 이다.
	
	String sessionNameValue=(String)obj1;
	//Object 타입이므로 캐스팅 해줘야 한다.
	int sessionNumberValue=(Integer)obj2;
	
	out.print("sessionNameValue : "+sessionNameValue+"<br>");
	out.print("sessionNumberValue : "+sessionNumberValue+"<br>");
	
	out.print("<hr>");
	
	String sName;
	String sValue;
	
	Enumeration<String> e= session.getAttributeNames();
	//세션 객체 안의 모든 이름의 목록을 Enumeration<String> 타입으로 반환
	
	while(e.hasMoreElements()){
		//요소가 있다면 true 반환 //요소가 없다면 false 반환
		
		sName=e.nextElement();
		//다음 요소를 가져온다.
		
		sValue = session.getAttribute(sName).toString();
		
		out.print("세션 이름 : " + sName + "<br>");
		out.print("세션 값 : " + sValue + "<br>");
	}
	
	out.print("<hr>");
	
	session.getId();
	
	String sessionID=session.getId();
	//한 브라우저당 고유한 아이디가 생성된다.
	//브라우저별로 생성되어진 세션을 구분할 수 있다.
	out.print("세션 아이디 : "+sessionID + "<br>");
	
	int sessionInter = session.getMaxInactiveInterval();
	//세션의 유효시간 (기본 30분)
	
	out.print("세션의 유효시간 : "+sessionInter + "<br>");
	
	out.print("<hr>");
	
	session.removeAttribute("sessionName");
	//세션 안의 데이터 삭제 : removeAttribute
	
	e=session.getAttributeNames();
		
	while(e.hasMoreElements()){
		//요소가 있다면 true 반환 //요소가 없다면 false 반환
		
		sName=e.nextElement();
		//다음 요소를 가져온다.
		
		sValue = session.getAttribute(sName).toString();
		
		out.print("세션 이름 : " + sName + "<br>");
		out.print("세션 값 : " + sValue + "<br>");
	}
	
	out.print("<hr>");
	
	session.invalidate();
	//invalidate : 세션의 모든 데이터를 삭제한다.(세션 무효화)
	
	if(request.isRequestedSessionIdValid()){
		//유효한 세션이 있으면 true 반환, 없으면 false 반환
		out.print("유효한 세션이 있음");
	}else{
		out.print("유효한 세션이 없음");
	}
	
	%>

</body>
</html>