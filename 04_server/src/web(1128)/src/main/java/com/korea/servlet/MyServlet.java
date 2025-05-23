package com.korea.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	
	private final String RED = "\033[91m";
	private final String GREEN = "\033[92m";
	private final String END = "\033[0m";
	public MyServlet() {
		super();
		System.out.println("MyServlet Created");
	}
	
	// GET 방식으로 호출하면 반드시 doGet이 호출됨
	protected void doGet(HttpServletRequest request,
						 HttpServletResponse response)
	throws ServletException, IOException {
		System.out.println(RED + "[MyServlet] Get Called" + END);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h1>This Page was made using Servlet(GET)</h1><hr>");
		out.println("</body></html>");
	}
	
	// GET 방식으로 호출하면 반드시 doPost이 호출됨
	protected void doPost(HttpServletRequest request,
						 HttpServletResponse response)
	throws ServletException, IOException {
		System.out.println(GREEN + "[MyServlet] Post Called" + END);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h1>This Page was made using Servlet(POST)</h1><hr>");
		out.println("</body></html>");
	}
}
