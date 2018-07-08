package kh.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.share")
public class ShareController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			 String requestURI = request.getRequestURI();
			 String contextPath = request.getContextPath();
			 String command = requestURI.substring(contextPath.length());
			 
			 System.out.println(command);
			 
			 boolean isRedirect = true;
			 String dst = null;
			 
			 if(command.equals("kakao.share")) {
				 String groupSeq = request.getParameter("group_seq");
				 
				 
				 
			 }
			 
		}catch(Exception e) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
