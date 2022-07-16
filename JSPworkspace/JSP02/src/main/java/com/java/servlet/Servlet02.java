package com.java.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Servlet02")
public class Servlet02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//이름과 나이가 request객체에 담겨서 온다
		System.out.println("doGet 메소드 입니다.");
		
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		
		System.out.println("넘어온 이름 : "+name);
		System.out.println("넘어온 나이 : "+age);
	
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 메소드 입니다.");
		
		request.setCharacterEncoding("UTF-8");
		//POST 방식의 요청 한글처리. POST 방식은 받을때마다 한글처리 해줘야함.
		
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		
		System.out.println("넘어온 이름 : "+name);
		System.out.println("넘어온 나이 : "+age);
	
	}

}
