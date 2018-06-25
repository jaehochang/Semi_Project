package kh.web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.web.dao.MemberDAO;
import kh.web.dto.MemberDTO;

@WebServlet("*.co")
public class MemberController extends HttpServlet {

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
				String email = request.getParameter("member_email");
				String pw = request.getParameter("pwd");
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

			} else if (command.equals("/login.co")) {

				String memberEmail = (String) request.getParameter("member_email");
				String pwd = (String) request.getParameter("pwd");

				MemberDAO mDAO = new MemberDAO();
				MemberDTO mDTO = new MemberDTO();

				mDTO.setMember_email(memberEmail);
				mDTO.setPwd(pwd);

				boolean result = mDAO.login(mDTO);

				if (result) {
					isRedirect = false;
					request.getSession().setAttribute("loginId", memberEmail);
					dst = "meetNowFindPage.jsp";
				} else {
					isRedirect = true;
					dst = "login.jsp";
				}

			} else if (command.equals("/mypage.co")) {
				HttpSession ssn = request.getSession();
				if (ssn != null) {
					String ssnId = ssn.getId();

					System.out.println("session Id : " + ssnId);
					MemberDAO mDAO = new MemberDAO();
					mDAO.getAccountInfo(ssnId);

					isRedirect = false;
					dst = "mypage.jsp";

				}

			} else if (command.equals("/signUpPage.co")) {

				isRedirect = true;

				dst = "signUpPage.jsp";

			} else if (command.equals("/signUpApply.co")) {

				String memberName = (String) request.getParameter("member_name");
				String memberEmail = (String) request.getParameter("member_email");
				String pwd = (String) request.getParameter("pwd");

				System.out.println(memberName + memberEmail + pwd);

				MemberDAO mDAO = new MemberDAO();
				MemberDTO dto = new MemberDTO();

				dto.setMember_name(memberName);
				dto.setMember_email(memberEmail);
				dto.setPwd(pwd);

				boolean result = mDAO.signUpApply(dto);

				if (result) {
					isRedirect = false;

					request.setAttribute("id", memberEmail);

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
