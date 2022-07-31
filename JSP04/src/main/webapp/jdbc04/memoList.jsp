<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.jsp.memo.MemoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jsp.memo.MemoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	table, th, td{
		border : 1px solid black;
		border-collapse: collapse;
		margin: 0 auto;
	}
	
	table{
		width: 700px;
	}
	
	th, td {
		text-align : center;
		height: 50px;
	}
	
	h1, h3{
		text-align : center;
	}
	
</style>

</head>
<body>
	
	<%--
		<table> 태그를 사용해서 메모장 만들기
		1. DAO객체 생성하기
		2. memoList 메소드 호출하여 데이터 얻기 (ArrayList)
		3. 닉네임 메모작성글 작성일자 (삭제) 
	 --%>
	
	<h1>나의 메모장</h1>
	
	<%
		MemoDAO dao = MemoDAO.getInstance();
		ArrayList<MemoDTO> list = dao.memoList();
	%>
	
	<table>
		
		<tr>
			<th>닉네임</th>
			<th>메모</th>
			<th>메모작성일</th>
			<th>메모삭제</th>
		</tr>
		
		<%
			for(int i = 0; i < list.size(); i++){
				
				MemoDTO dto = list.get(i);
				
				Timestamp regTime = dto.getRegTime();
				SimpleDateFormat format = new SimpleDateFormat("MM월 dd일");
				
				String date = format.format(regTime);
				
		%>
				
		<tr>
			<td><%=dto.getNickName() %></td>
			<td><%=dto.getContents() %></td>
			<td><%=date %></td>
			<td><a href="memoDelete.jsp?memoId=<%=dto.getMemoId()%>">삭제</a></td>
		</tr>
		
		
		<%
			}
		%>
		
	</table>
	
	<h3><a href="memoForm.html">메모작성</a></h3>
	
</body>
</html>