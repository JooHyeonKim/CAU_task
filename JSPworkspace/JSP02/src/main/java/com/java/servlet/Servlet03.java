package com.java.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Servlet03")
public class Servlet03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//FromEx01.html
		//요청 한글처리하기
		//넘어온 데이터 받아서 해당변수에 저장하기
		request.setCharacterEncoding("UTF-8");
		
		String name=request.getParameter("name");
		String id=request.getParameter("id");
		String pw=request.getParameter("pwd");
		
		//데이터들을 한꺼번에 여러개 받을때
		String[] hobby=request.getParameterValues("hobby");
		//반환값이 String 배열
		//hobby 이름으로 저장된 데이터의 목록을 String[]으로 반환
		
		String major=request.getParameter("major");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out=response.getWriter();
		//웹브라우저에 출력할 출력스트림 얻기
		
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.print("<head>");
		out.print("<title>폼 데이터</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h1>폼에서 넘어온 데이터</h1>");
		out.print("이름 : "+name+"<br>");
		out.print("아이디 : "+id+"<br>");
		out.print("비밀번호 : "+pw+"<br>");
		out.print("취미 :"+Arrays.toString(hobby)+"<br>");
		out.print("전공 : "+major+"<br>");
		out.print("</body>");
		out.print("</html>");
		
		out.close();
	}
				

}
