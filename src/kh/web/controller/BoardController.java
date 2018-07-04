package kh.web.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.dao.BoardDAO;
import kh.web.dto.BoardDTO;

/**
 * Servlet implementation class GroupController
 */
@WebServlet("*.bo")
public class BoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length()); 
			
			System.out.println(command); 
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
					"yyyyMMdd");
			SimpleDateFormat showDateFormat = new SimpleDateFormat(
					"yyyy년MM월dd일");
			BoardDAO dao = new BoardDAO();
			boolean isRedirect = true;
			String dst = null;
			
			if(command.equals("/main.bo")) {
				List<BoardDTO> result = dao.getBoardData();
				request.setAttribute("result", result);
				isRedirect = false;
				dst = "main.jsp";
			}else if(command.equals("/calenSearch.bo")) {
				String value = request.getParameter("val");
				Date tempDate = simpleDateFormat.parse(value);
				System.out.println(tempDate);
				System.out.println(showDateFormat.format(tempDate));
				
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
			}
			
			if(isRedirect) {
				response.sendRedirect(dst);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
