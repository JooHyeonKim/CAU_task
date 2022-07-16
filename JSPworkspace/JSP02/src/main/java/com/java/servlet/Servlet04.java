package com.java.servlet;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Servlet04")
public class Servlet04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		Enumeration<String> e=request.getParameterNames(); //id, pw
		//getParameterNames : 반환타입이 Enumeration 으로
		//요청페이지의 모든 파라미터 이름이 저장된 목록을 반환한다.
		//Enumeration 인터페이스는 컬렉션 프레임워크가 만들어지기 전
		//Iterator의 이전 버전이다.
		
		while(e.hasMoreElements()) {
			//다음 읽어올 요소가 있는지 확인 후 true / false 반환
			
			String name=e.nextElement();
			//다음 요소를 읽어온다.
			
			String[] values=request.getParameterValues(name);
			
			for(String value : values) {
				System.out.println("name : "+name+", value : "+value);
			}
		}
	}

}
