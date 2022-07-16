package com.java.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/Servlet06")
public class Servlet06 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletConfig config=this.getServletConfig();
		//ServletConfig 객체는 서블릿이 초기화되는 동안
		//참조해야할 정보를 전달해주는 역할을 한다.
		
		String id=config.getInitParameter("id");
		String pw=config.getInitParameter("pw");
		
		System.out.println("아이디 : "+id);
		System.out.println("비밀번호 : "+pw);
		
	}

}
