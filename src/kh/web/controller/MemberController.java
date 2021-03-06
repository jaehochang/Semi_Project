package kh.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.dao.MemberDAO;
import kh.web.dto.MemberDTO;
import kh.web.dto.SnsDTO;

@WebServlet("*.co")
public class MemberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());

			request.setCharacterEncoding("utf8");
			response.setCharacterEncoding("utf8");

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

			} else if (command.equals("/isThisFbIdRegistered.co")) {

				String fbId = request.getParameter("facebookUserId");

				MemberDAO mDAO = new MemberDAO();
				boolean result = mDAO.isThisFbIdExist(fbId);

				isRedirect = false;
				if (result) {
					System.out.println("해당 페이스북 아이디 이미 존재");
					request.getSession().setAttribute("loginId", fbId);
					dst = "main.jsp"; // 그냥 해당 아이디로 로그인 시켜버리기
				} else {
					response.getWriter().print(result);
				}

			}	 else if (command.equals("/kakaoIdDplCheck.co")) {

				String kakao_id = request.getParameter("kakao_id");
				String kakao_nickname = request.getParameter("kakao_nickname");

				System.out.println("/kakaoId - from ajax: " + kakao_id);
				System.out.println("/kakaoNickName - from ajax: " + kakao_nickname);

				MemberDAO mDAO = new MemberDAO();
				SnsDTO sDTO = new SnsDTO();

				sDTO.setKakao_id(kakao_id);
				sDTO.setKakao_nickName(kakao_nickname);

				boolean dplChck = mDAO.kakaoDplChck(sDTO);

				System.out.println("/kakaoIdDplCheck.co : 카카오톡 중복 아이디 유무 (false = 무 / true = 유) : " + dplChck);

				isRedirect = false;

				if (dplChck) {
					request.getSession().setAttribute("loginId", kakao_id); // 세션 담기
					dst = "main.jsp";

				} else {
					request.setAttribute("kakaoSecretNumId", kakao_id);
					dst = "kakaoSignUpPage.jsp";
				}

			} else if (command.equals("/signUpWithKakao.co")) {

				String kakaoId = request.getParameter("kakao_id");
				String kakaoNickName = request.getParameter("kakao_nickname");
				String kakaoEmail = request.getParameter("kakao_email");
				String kakaoPhoto = request.getParameter("kakao_photo");

				System.out.println("/kakaoId : " + kakaoId);
				System.out.println("/kakaoNickName : " + kakaoNickName);
				System.out.println("/kakaoEmail : " + kakaoNickName);
				System.out.println("/kakaoPhoto : " + kakaoPhoto);

				MemberDAO mDAO = new MemberDAO();
				SnsDTO sDTO = new SnsDTO();

				sDTO.setKakao_id(kakaoId);
				sDTO.setKakao_nickName(kakaoNickName);
				sDTO.setKakao_email(kakaoEmail);
				sDTO.setKakao_photo(kakaoPhoto);

				boolean dplChck = mDAO.kakaoDplChck(sDTO);
				if (dplChck) {// 카톡 아이디 중복체크, true면 존재 > main page로

					isRedirect = true;
					request.getSession().setAttribute("loginId", kakaoId);
					dst = "main.jsp";

				} else { // true가 아니면, 없음 -> 회원가입 > main.jsp 로 세션 담아 보내기

					boolean result = mDAO.signUpWithKakao(sDTO);
					System.out.println(result);

					if (result) {

						isRedirect = false;
						request.getSession().setAttribute("loginId", kakaoId);
						request.setAttribute("result", result);
						dst = "main.jsp";
					} else {
						dst = "error.html";
					}

				}

			} else if (command.equals("/login.co")) {

				String memberEmail = (String) request.getParameter("member_email");
				String pwd = (String) request.getParameter("pwd");

				MemberDAO mDAO = new MemberDAO();
				MemberDTO mDTO = new MemberDTO();

				mDTO.setMember_email(memberEmail);
				mDTO.setMember_pwd(pwd);

				boolean result = mDAO.login(mDTO);

				isRedirect = false;

				if (result) {
					request.getSession().setAttribute("loginId", memberEmail);
					dst = "list.group";
				} else {
					request.setAttribute("loginResult", result);
					dst = "login.jsp";
				}

			} else if (command.equals("/mypage.co")) {
					String loginId = (String)request.getSession().getAttribute("loginId");
					MemberDAO mDAO = new MemberDAO();
					
					MemberDTO accntInfo = mDAO.getAccountInfo(loginId);
					
					request.setAttribute("userName", accntInfo.getMember_name());
					request.setAttribute("userEmail", accntInfo.getMember_email());
					request.setAttribute("userLocation", accntInfo.getMember_location());
					request.setAttribute("userPicture", accntInfo.getMember_picture());
					request.setAttribute("userInterests", accntInfo.getMember_interests());
					request.setAttribute("userJoinDate", accntInfo.getMember_joindate());
					
					isRedirect = false;
					dst = "mypage.jsp";

				System.out.println("/mypage.co 의 session Login Id : " + loginId);
			

			} else if (command.equals("/signUpApply.co")) {

				String memberName = (String) request.getParameter("member_name");
				String memberEmail = (String) request.getParameter("member_email");
				String pwd = (String) request.getParameter("pwd");

				System.out.println(memberName + memberEmail + pwd);

				MemberDAO mDAO = new MemberDAO();
				MemberDTO dto = new MemberDTO();

				dto.setMember_name(memberName);
				dto.setMember_email(memberEmail);
				dto.setMember_pwd(pwd);

				boolean emailDplRslt = mDAO.isThisEmailExist(dto.getMember_email());// 이메일 중복 검사 실시

				if (emailDplRslt) { // 있으면 return true 존재한다고 보내기?

					request.setAttribute("emailDplRslt", emailDplRslt);
					dst = "main.jsp";

				} else { // 없는 경우 signUp 시키기

					boolean result = mDAO.signUpApply(dto);

					if (result) {

						isRedirect = false;
						request.setAttribute("loginId", memberEmail);
						dst = "main.jsp";

					} else {

						isRedirect = true;
						dst = "signUpFailure.jsp";

					}

				}

			} else if (command.equals("/LogoutController.co")) {
				request.getSession().removeAttribute("loginId");

				isRedirect = true;
				dst = "main.jsp";
			} else if (command.equals("/isThisKakaoIdExist.co")) {
				String loginKakaoId = request.getParameter("kakaoId");

				MemberDAO mDAO = new MemberDAO();

				boolean result = mDAO.isKakaoIdExist(loginKakaoId);
				if (result) { // 통과
					// 세션 제공
					request.getSession().setAttribute("loginId", loginKakaoId);
					response.getWriter().print(result);

				}

			} else if (command.equals("/signUpWithFaceBook.co")) {

				String fb_email = request.getParameter("fb_email");
				String fb_name = request.getParameter("fb_name");
				String fb_uid = request.getParameter("fb_uid");
				String fb_photoURL = request.getParameter("fb_photoURL");

				MemberDAO mDAO = new MemberDAO();
				SnsDTO sDTO = new SnsDTO();
				sDTO.setFb_uid(fb_uid);
				sDTO.setFb_name(fb_name);
				sDTO.setFb_email(fb_email);
				sDTO.setFb_photoURL(fb_photoURL);

				// 먼저 해당 facebook_uid가 db에 있는지 중복 확인
				boolean isFbUidExist = mDAO.isFbUidExist(sDTO);

				isRedirect = false;

				if (isFbUidExist) { // 점검해봤더니 아이디가 이미 있음
					// 이미 아이디가 존재

					request.getSession().setAttribute("loginId", fb_uid);
					request.setAttribute("isFbUidExist", isFbUidExist);
					dst = "main.jsp";// 바로 메인화면으로 세션 담아서 넘겨줌
					System.out.println(1);
				} else {
					boolean fbSignUpResult = mDAO.signUpWithFb(sDTO); // 없는 경우는 바로 아이디 만들어줌
					request.setAttribute("fbSignUpResult", fbSignUpResult);
					System.out.println(2);
					if (fbSignUpResult) {
						isRedirect = false;
						request.getSession().setAttribute("loginId", fb_uid);
						dst = "main.jsp";
						System.out.println(3);
					} else {
						System.out.println(4);
						dst = "error.jsp";

					}

				}

			} else if (command.equals("/ggAccntProc.co")) {

				// https://developers.google.com/identity/sign-in/web/backend-auth

				String ggId = request.getParameter("ggId");
				String ggName = request.getParameter("ggName");
				String ggImgUrl = request.getParameter("ggImgUrl");
				String ggEmail = request.getParameter("ggEmail");

				System.out.println(ggId + "/" + ggName + "/" + ggImgUrl + "/" + ggEmail);

				MemberDAO mDAO = new MemberDAO();
				SnsDTO sDTO = new SnsDTO();
				sDTO.setGgid(ggId);
				sDTO.setGgname(ggName);
				sDTO.setGgimgUrl(ggImgUrl);
				sDTO.setGgEmail(ggEmail);

				boolean DupleResult = mDAO.SignUpWithGoogle(sDTO);
				System.out.println("mDAO.SignUpWithGoogle.regResult : " + DupleResult);

				isRedirect = false;

				// response.reset();
				response.getWriter().print(DupleResult);
				request.setAttribute("DupleResult", DupleResult);
				request.getSession().setAttribute("loginId", ggId);

				return;

			}

			if (isRedirect == false) {
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			} else {
				response.sendRedirect(dst);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("에러 발생");
			response.sendRedirect("error.html");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
