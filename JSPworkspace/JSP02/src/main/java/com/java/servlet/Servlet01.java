package com.java.servlet;

import java.io.IOException;
import java.io.PrintWriter;

//어노테이션이란 메타데이터(데이터에 대한 속성정보, 데이터를 설명해주는 데이터)라고 볼 수 있다.
//프로그램 실행 관점에서 보면 프로그램이 처리할 메인데이터가 아니라
//실행과정에서 데이터를 어떻게 처리할 것인지 알려주는 서브데이터이다.
// 자바코드에 @를 사용해 주석처럼 달아 특수한 의미를 부여해준다.

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/HelloServlet") //이 요청이 들어오면 해당 서블릿을 실행하겠다.
public class Servlet01 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public Servlet01() {
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//request	: 클라이언트로부터의 요청처리 객체
		//예(로그인시) : 클라이언트의 아이디와 비밀번호 정보는 request 객체에 담겨져 온다.
		//response : 클라이언트로의 응답처리 객체
		//예(로그인시) : 회원인지 아닌지 정보를 클라이언트한테 보낸다.
		
		//url로 요청이 들어오면 doGet 메소드가 호출된다.
		
		response.setCharacterEncoding("UTF-8");
		//UTF-8로 웹브라우저에게 보낸다.
		
		response.setContentType("text/html; charset=UTF-8");
		//웹브라우저에게 html문서를 UTF-8로 해석하라는 뜻.
		
		PrintWriter out=response.getWriter();
		//웹브라우저에게 출력하기 위한 출력스트림 얻기.
		//ctrl + space로 import해줘야함.
		
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.print("<head>");
		out.print("<title>Servlet 시작!</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h2>서블릿 시작합니다!!!</h2>");
		out.print("</body>");
		out.print("</html>");
		
		out.close();
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
