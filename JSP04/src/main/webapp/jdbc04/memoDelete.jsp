<%@page import="com.jsp.memo.MemoDAO"%>
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
		String strId = request.getParameter("memoId");
	
		int memoId = Integer.parseInt(strId);
		
		MemoDAO dao = MemoDAO.getInstance();
		
		int result = dao.deleteMemo(memoId);
		
		if(result == 1){
	%>
			<script>
				alert('메모가 삭제되었습니다.');
				window.location = 'memoList.jsp';
			</script>
	<%
		}else{
	%>
			<script>
				alert('메모가 삭제되지 않았습니다.');
				window.location = 'memoList.jsp';
			</script>
	<%
		}
	%>
	
	
</body>
</html>