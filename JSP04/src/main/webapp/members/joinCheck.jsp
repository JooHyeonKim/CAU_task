<%@page import="com.jsp.members.MembersDAO"%>
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
		1. 넘어온 데이터 받기 (DTO 객체 생성)
		2. DAO 객체 생성 후 confirmId 메소드 호출해서 
		   같은 아이디가 없을 경우 insertMember 메소드 호출해서
		   회원가입하기. 회원가입 후 로그인 페이지로 이동하기.
	 --%>
	
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	
	<jsp:useBean id="dto" class="com.jsp.members.MembersDTO" />
	
	<jsp:setProperty property="*" name="dto"/>	
	
	<%--
		property 속성값을 *로 주면 넘어오는 파라미터의 값이 프로퍼티로 셋팅된다.
		주의할 점은 폼으로부터 넘어오는 파라미터의 이름과 프로퍼티의 이름이 일치해야 한다는 것이다.
	 --%>
	
	<%
		MembersDAO dao = MembersDAO.getInstance();
	
		
		if(dao.confirmId(dto.getId()) == 1){
			// 아이디를 체크해서 같은 아이디가 있다면
	%>
			<script type="text/javascript">
				alert('아이디가 이미 존재합니다.');
				history.back();
			</script>
	
	<%
		}else{ // 같은 아이디가 없다면
			
			int result = dao.insertMember(dto); // DB에 데이터 넣기
			
			if(result == 1){
				
	%>
				<script>
					alert('회원가입을 축하합니다.');
					window.location = 'login.jsp';
				</script>
	
	
	<%
				
			}else{
				
	%>
				<script>
					alert('회원가입에 실패했습니다.');
					window.location = 'join.jsp';
				</script>
	
	<%
				
			}
			
		}
	%>
	
	
	
</body>
</html>