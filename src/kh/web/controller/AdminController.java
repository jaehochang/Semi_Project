package kh.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kh.web.dao.AdminDAO;
import kh.web.dao.MemberDAO;
import kh.web.dto.MemberDTO;

@WebServlet("*.ao")
public class AdminController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());

			response.setCharacterEncoding("utf8");
			PrintWriter out = response.getWriter();

			System.out.println("get : " + command);

			AdminDAO adao = new AdminDAO();
			MemberDAO mdao = new MemberDAO();

			boolean isRedirect = true;
			String dst = null;

			if (command.equals("/admin/login.ao")) {
				isRedirect = false;
				dst = "loginForm.jsp";

			} else if (command.equals("/admin/main.ao")) {
				isRedirect = false;
				dst = "index.jsp";

			} else if (command.equals("/admin/member.ao")) {
				String member_email = request.getParameter("member_email");
				System.out.println(member_email);
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");
				if (currentPageString == null) {
					currentPage = 1;
				} else {
					currentPage = Integer.parseInt(currentPageString);
				}
				List<MemberDTO> list = mdao.memberList(currentPage * 10 - 9, currentPage * 10, "member_email", member_email);

				String page = mdao.getPageNavi(currentPage, member_email);

				request.setAttribute("list", list);
				request.setAttribute("page", page);

				isRedirect = false;
				dst = "member/member.jsp";

			} else if (command.equals("/admin/meetup.ao")) {
				isRedirect = false;
				dst = "meetup/meetup.jsp";

			} else if (command.equals("/admin/group.ao")) {
				isRedirect = false;
				dst = "group/group.jsp";

			} else if (command.equals("/admin/report.ao")) {
				isRedirect = false;
				dst = "report/report.jsp";

			} else if (command.equals("/admin/warning.ao")) {
				String member_email = request.getParameter("value");

				int result = mdao.plusWarningNumber(member_email);
				MemberDTO mdto = mdao.getMember(member_email);

				String warning_date = mdto.getMember_warningdate();
				String expire_date = mdto.getMember_expiredate();
				int number = mdto.getMember_warningnumber();
				int bdate = mdto.getMember_betweendate();

				JSONObject json = new JSONObject();

				if (result > 0) {
					json.put("number", number);
					json.put("bdate", bdate);
					json.put("warning_date", warning_date);
					json.put("expire_date", expire_date);
				}

				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");

				response.getWriter().print(json);
				response.getWriter().flush();
				response.getWriter().close();

			} else if (command.equals("/admin/search.ao")) {
				String value = request.getParameter("value");
				System.out.println(value);
				
				String member_email = request.getParameter("member_email");
				System.out.println(member_email);
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");
				if (currentPageString == null) {
					currentPage = 1;
				} else {
					currentPage = Integer.parseInt(currentPageString);
				}
				List<MemberDTO> list = mdao.memberList(currentPage * 10 - 9, currentPage * 10, "member_email", value);

				String page = mdao.getPageNavi(currentPage, member_email);

				JSONObject json = new JSONObject();

				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");

				response.getWriter().print(json);
				response.getWriter().flush();
				response.getWriter().close();
				
			}
				
			if (isRedirect == false) {
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			} else {
//				response.sendRedirect(dst);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			request.setCharacterEncoding("UTF-8");

			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());

			response.setCharacterEncoding("utf8");
			PrintWriter out = response.getWriter();

			System.out.println("post : " + command);

			AdminDAO adao = new AdminDAO();
			boolean isRedirect = true;
			String dst = null;

			if (command.equals("/admin/login.ao")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				System.out.println("id : " + id);
				System.out.println("pw : " + pw);
				boolean result = adao.loginAdmin(id, pw);
				System.out.println(result);

				if (result) {
					request.getSession().setAttribute("adminId", id);
					isRedirect = false;
					dst = "index.jsp";
				} else {
					isRedirect = true;
					dst = "loginForm.jsp";
				}
			}

			if (isRedirect == false) {
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			} else {
//				response.sendRedirect(dst);
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}

	}

}
