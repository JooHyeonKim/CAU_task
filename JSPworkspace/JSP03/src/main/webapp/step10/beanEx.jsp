<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="stu" class="com.java.jsp.Student" scope="page"/>
	
	<%--
		id    : jsp 페이지에서 자바빈 객체에 접근할 때 사용하는 이름 (자바빈 객체의 이름)
		class : 패키지이름을 포함한 자바빈 클래스의 완전한 이름
		scope : 자바빈 객체가 저장될 영역을 지정 (default 값은 page)
		(page, request, session, application)
		
	 --%>
	 
	 <jsp:setProperty name="stu" property="studentID" value="202207" />
	 <jsp:setProperty name="stu" property="name" value="홍길동" />
	 <jsp:setProperty name="stu" property="age" value="20" />
	 <jsp:setProperty name="stu" property="grade" value="1" />
	 
	 <%--
	 	name : 자바빈 이름
	 	property : 속성 이름
	 	value : 속성에 대한 값
	  --%>
	  
	  <%-- stu라는 객체에서 studentID라는 속성값을 얻어오겠다. --%>
	  학번 : <jsp:getProperty property="studentID" name="stu"/><br>
	  이름 : <jsp:getProperty property="name" name="stu"/><br>
	  나이 : <jsp:getProperty property="age" name="stu"/><br>
	  학년 : <jsp:getProperty property="grade" name="stu"/><br>

</body>
</html>