package kh.web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.dao.MemberDAO;
import kh.web.dto.MemberDTO;


@WebServlet("*.co")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());

			System.out.println(command);

			MemberDAO dao = new MemberDAO();
			boolean isRedirect = true;
			String dst = null;

			if (command.equals("/LoginController.co")) {
				String email = request.getParameter("email");
				String pw = request.getParameter("pw");
				boolean result = dao.isIdPw(email, pw);
				if (result) {

					request.getSession().setAttribute("loginId", email);

					request.setAttribute("result", result);
					request.setAttribute("id", email);
					request.setAttribute("pw", pw);

					isRedirect = false;
					dst = "loginview.jsp";

				} else {

				}

			} else if (command.equals("/signUpPage.co")) {

				isRedirect = true;

				dst = "signUpPage.jsp";

			} else if (command.equals("/signUpApply.co")) {

				String name = (String) request.getParameter("name");
				String email = (String) request.getParameter("email");
				String pw = (String) request.getParameter("pw");

				
				System.out.println( name + email + pw );
				
				MemberDAO mDAO = new MemberDAO();
				MemberDTO dto = new MemberDTO();

				dto.setName(name);
				dto.setEmail(email);
				dto.setPw(pw);

				boolean result = mDAO.signUpApply(dto);

				if (result) {
					isRedirect = false;

					request.setAttribute("id", email);

					dst = "signUpPage.jsp";

				} else {
					isRedirect = true;
					dst = "signUpPage.jsp";
				}

			} else if (command.equals("/LogoutController.co")) {
				request.getSession().removeAttribute("loginId");

				isRedirect = true;
				dst = "main.jsp";
			}

			if (isRedirect == false) {
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			} else {
				response.sendRedirect(dst);
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
