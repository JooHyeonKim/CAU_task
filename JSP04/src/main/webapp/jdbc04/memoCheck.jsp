<%@page import="com.jsp.memo.MemoDAO"%>
<%@page import="java.sql.Timestamp"%>
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
		1. 넘어온 데이터 받기
		2. 현재시간으로 Timestamp 객체 생성하기
		3. DAO 객체 생성 후 insertMemo 메소드 호출하기
		4. 결과값을 받은 후 메모가 잘 들어갔다면 memoList 로 페이지 이동하기
		5. 잘 들어가지 않았다면 memoForm으로 페이지 이동하기
	 --%>
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		String nickName = request.getParameter("nickName");
		String contents = request.getParameter("contents");
		
		Timestamp regTime = new Timestamp(System.currentTimeMillis());
		// 현재 시간으로 Timestamp 객체 생성
		
		MemoDAO dao = MemoDAO.getInstance();
		
		int result = dao.insertMemo(nickName, contents, regTime);
		
		if(result == 1){
	%>
			<script>
				alert('메모가 등록되었습니다.');
				window.location = 'memoList.jsp';
			</script>
	
	<%
		}else{
	%>
			<script>
				alert('메모가 등록되지 않았습니다.');
				window.location = 'memoForm.html';
			</script>
	<%
		}
	%>
	
	
</body>
</html>










