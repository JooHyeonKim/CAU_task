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
		EL은 자바빈의 프로퍼티(데이터)를 JSP 표현식이나
		액션태그를 사용하는 것보다 쉽고 간결하게 사용할 수 있다.
	 --%>
	
	<jsp:useBean id="elMember" class="com.jsp.el.MemberEL" />
	
	<jsp:setProperty name="elMember" property="name" value="홍길동" />
	<jsp:setProperty name="elMember" property="age" value="20" />
	<jsp:setProperty name="elMember" property="id" value="hong" />
	<jsp:setProperty name="elMember" property="pw" value="1234" />
	
	<h2>JSP 액션태그</h2>
	
	이름 : <jsp:getProperty property="name" name="elMember"/><br>
	나이 : <jsp:getProperty property="age" name="elMember"/><br>
	아이디 : <jsp:getProperty property="id" name="elMember"/><br>
	비밀번호 : <jsp:getProperty property="pw" name="elMember"/><br>
	
	<hr>
	
	<h2>JSP 표현식</h2>
	
	이름 : <%=elMember.getName() %><br>
	나이 : <%=elMember.getAge() %><br>
	아이디 : <%=elMember.getId() %><br>
	비밀번호 : <%=elMember.getPw() %><br>
	
	<hr>
	
	<%--
		EL은 jsp 액션태그나 표현식을 사용하는 것보다 
		간결하게 프로퍼티 값을 얻을 수 있다.
	 --%>
	
	<h2>EL 표현식</h2>
	
	이름 : ${elMember.name }<br>
	나이 : ${elMember.age }<br>
	아이디 : ${elMember.id }<br>
	비밀번호 : ${elMember.pw }<br>
	
	
</body>
</html>










