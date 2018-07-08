package kh.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.dao.GroupDAO;
import kh.web.dao.MemberDAO;
import kh.web.dto.MemberDTO;
import kh.web.dto.SnsDTO;
import kh.web.utils.PwFinder;

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

			System.out.println("-------------------------------------");
			System.out.println(command);
			MemberDAO dao = new MemberDAO();
			GroupDAO gDAO = new GroupDAO();

			boolean isRedirect = true;
			String dst = null;

			request.setAttribute("tmp", "haha");

			if (command.equals("/LoginController.co")) {
				String email = request.getAttribute("member_email").toString();
				String pw = request.getAttribute("pwd").toString();
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
					dst = "Oops.jsp";
				}

			} else if (command.equals("/kakaoIdDplCheck.co")) {

				String kakao_id = request.getParameter("kakao_id");
				String kakao_nickname = request.getParameter("kakao_nickname");

				System.out.println("/kakaoId - from ajax: " + kakao_id);
				System.out.println("/kakaoNickName - from ajax: " + kakao_nickname);

				MemberDAO mDAO = new MemberDAO();
				SnsDTO sDTO = new SnsDTO();

				sDTO.setKakao_id(kakao_id);
				sDTO.setKakao_nickname(kakao_nickname);

				boolean dplChck = mDAO.kakaoDplChck(sDTO);

				System.out.println("/kakaoIdDplCheck.co : 카카오톡 중복 아이디 유무 (false = 무 / true = 유) : " + dplChck);

				isRedirect = false;

				if (dplChck) {
					request.getSession().setAttribute("loginId", kakao_id); // 세션 담기

					dst = "login.jsp";

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
				System.out.println("/kakaoEmail : " + kakaoEmail);
				System.out.println("/kakaoPhoto : " + kakaoPhoto); // 잘됨 나옴

				System.out.println(1);
				MemberDAO mDAO = new MemberDAO();
				SnsDTO sDTO = new SnsDTO();

				sDTO.setKakao_id(kakaoId);
				sDTO.setKakao_nickname(kakaoNickName);
				sDTO.setKakao_email(kakaoEmail);
				sDTO.setKakao_photo(kakaoPhoto);

				System.out.println(2);
				boolean dplChck = mDAO.kakaoDplChck(sDTO);

				if (dplChck) {// 카톡 아이디 중복체크, true면 존재 > index page로

					System.out.println(kakaoId + " : 해당 카톡 아이디가 있어 그냥 로그인 됩니다.");
					isRedirect = false;
					request.getSession().setAttribute("loginId", kakaoEmail);
					request.getSession().setAttribute("snsId", kakaoId);
					request.setAttribute("kakaoIdAlreadyExist", true);
					dst = "login.jsp";
					System.out.println(3);

				} else { // true가 아니면, 없음 -> 회원가입 > index.jsp 로 세션 담아 보내기, 또는 해당 이메일로 가입된 아이디가 이미 있음
					try {

						SnsDTO sDTOrebirth = new SnsDTO();
						sDTOrebirth.setKakao_id(kakaoId);
						sDTOrebirth.setKakao_nickname(kakaoNickName);
						sDTOrebirth.setKakao_email(kakaoEmail);
						sDTOrebirth.setKakao_photo(kakaoPhoto);
						System.out.println(4);
						System.out.println(kakaoPhoto);

						boolean result = mDAO.signUpWithKakao(sDTOrebirth);

						System.out.println(result);

						if (result) { // 최초 가입 성공시 - index로 세션 담아 보내주기

							isRedirect = false;
							request.getSession().setAttribute("loginId", kakaoEmail);
							request.getSession().setAttribute("snsId", kakaoId);

							request.setAttribute("loginSuccess", true);
							dst = "login.jsp";

							System.out.println(5);
						}

					} catch (Exception e) {
						if (e.getMessage().contains("unique")) { // DB서 email Unique 에러가 발생할 경우
							isRedirect = false;
							request.setAttribute("emailExist", true); // emailExist라는 변수에 true를 담아 보낸다
							dst = "login.jsp";
							System.out.println(6);
						} else {
							dst = "error.jsp";
						}

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
					boolean isMyGroup = mDAO.isMyGroup(memberEmail);

					request.setAttribute("isMyGroup", isMyGroup);
					System.out.println("membercontroller 값 : " + isMyGroup);

					dst = "list.group";
				} else {
					request.setAttribute("loginResult", result);
					dst = "login.jsp";
				}

			} else if (command.equals("/mypage.co")) {

				String loginId = (String) request.getSession().getAttribute("loginId");
				String snsId = (String) request.getSession().getAttribute("snsId");

				System.out.println("/mypage.co 의 session Login Id's email : " + loginId);
				System.out.println("/mypage.co 의 session Login snsId : " + snsId);

				MemberDAO mDAO = new MemberDAO();

				MemberDTO accntInfo = mDAO.getAccountInfo(snsId, loginId);
				System.out.println("getAccountInfo 에서 나옴 : " + 1);

				// if (accntInfo == null) {
				// isRedirect = true;
				// dst = "login.jsp";
				// System.out.println(2);
				// }

				String[] interests = {};
				try {
					interests = accntInfo.getMember_interests().split(",");
				} catch (Exception e) {
					interests = null;
				}

				String payCheck = gDAO.payCheck(loginId);

				try {

					System.out.println("/accntInfo.getMember_picture() : " + accntInfo.getMember_picture());

					if ((accntInfo.getMember_picture().equals("null")) || (accntInfo.getMember_picture() == null)) {
						System.out.println(3);
						accntInfo.setMember_picture("img/default_member.png");
						System.out.println(4);
					}

				} catch (Exception e) {
					if (e.getMessage().contains("null")) {
						System.out.println(5);
						isRedirect = false;
						request.setAttribute("null", true);
						dst = "Oops.jsp";

					}
				}

				System.out.println(6 + accntInfo.getMember_picture() + "?!");
				request.setAttribute("userPicture", accntInfo.getMember_picture());
				request.setAttribute("userName", accntInfo.getMember_name());
				request.setAttribute("userEmail", accntInfo.getMember_email());
				request.setAttribute("userLocation", accntInfo.getMember_location());
				request.setAttribute("userGender", accntInfo.getMember_gender());
				request.setAttribute("userAge", accntInfo.getMember_age());

				System.out.println(7);
				request.setAttribute("userPicture", accntInfo.getMember_picture());
				request.setAttribute("userInterests", interests);
				// request.setAttribute("userInterests", accntInfo.getMember_interests());
				request.setAttribute("userJoinDate", accntInfo.getMember_joindate());

				if (payCheck.equals("y")) {
					request.setAttribute("payCheck", "subscribed");
				} else if (payCheck.equals("n")) {
					request.setAttribute("payCheck", "unsubscribed");
				}

				isRedirect = false;
				dst = "mypage.jsp";

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

				isRedirect = false;
				boolean emailDplRslt = mDAO.isThisEmailExist(dto.getMember_email());// 이메일 중복 검사 실시

				if (emailDplRslt) { // 있으면 return true 존재한다고 보내기?

					request.setAttribute("emailExist", true);
					dst = "login.jsp";

				} else { // 없는 경우 signUp 시키기

					boolean result = mDAO.signUpApply(dto);

					if (result) {

						request.setAttribute("loginId", memberEmail);
						request.setAttribute("signUpSuccess", true);
						dst = "login.jsp";

					} else {
						dst = "signUpFailure.jsp";

					}

				}

			} else if (command.equals("/LogoutController.co")) {

				request.getSession().removeAttribute("loginId");
				request.getSession().removeAttribute("snsId");
				isRedirect = true;

				dst = "index.jsp";
				System.out.println(dst);
				System.out.println("------------------------------------------------------");

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

					isRedirect = false;
					request.getSession().setAttribute("loginId", fb_email);
					request.getSession().setAttribute("snsId", fb_uid);

					request.setAttribute("loginSuccess", true);

					dst = "login.jsp";// 바로 login.jsp로 아이디 이미 존재한다는 것 / 동시에 로그인? 알려줌
				} else {
					System.out.println(1);
					boolean fbSignUpResult = mDAO.signUpWithFb(sDTO); // 없는 경우는 바로 아이디 만들어줌
					// request.setAttribute("fbSignUpResult", fbSignUpResult);

					if (fbSignUpResult) {
						isRedirect = false;
						request.getSession().setAttribute("loginId", fb_email);
						request.getSession().setAttribute("snsId", fb_uid);

						request.setAttribute("signUpSuccess", true); // 최초 회원가입 성공시
						dst = "login.jsp";
						System.out.println(2);
					} else {// unique 로 인해 fbSignUpResult가 false를 반환한 경우
						System.out.println("MemberController : unique 로 인해 fbSignUpResult가 false를 반환");
						isRedirect = false;
						boolean emailExist = true;
						System.out.println("emailExist :" + emailExist);
						request.setAttribute("emailExist", emailExist);
						dst = "login.jsp";
						System.out.println(3);
					}

				}

			} else if (command.equals("/ggAccntProc.co")) {

				// https://developers.google.com/identity/sign-in/web/backend-auth

				String ggId = request.getParameter("ggId");
				String ggName = request.getParameter("ggName");
				String ggImgUrl = request.getParameter("ggImgUrl");
				String ggEmail = request.getParameter("ggEmail");

				System.out.println(ggId);
				System.out.println(ggName);
				System.out.println(ggImgUrl);
				System.out.println(ggEmail);

				MemberDAO mDAO = new MemberDAO();
				SnsDTO sDTO = new SnsDTO();
				sDTO.setGgid(ggId);
				sDTO.setGgname(ggName);
				sDTO.setGgimgUrl(ggImgUrl);
				sDTO.setGgEmail(ggEmail);

				boolean ggDupleResult = mDAO.isGgIdExist(sDTO);
				System.out.println(1);

				if (ggDupleResult) { // 중복되는 아이디가 이미 있는 경우
					// 아니 바로 로그인 시켜버리기
					System.out.println(2);
					isRedirect = false;
					request.getSession().setAttribute("loginId", ggEmail);
					request.getSession().setAttribute("snsId", ggId);
					request.setAttribute("loginSuccess", true);
					dst = "login.jsp";

				} else {
					System.out.println(3);
					boolean ggSignUpResult = mDAO.SignUpWithGoogle(sDTO);

					if (ggSignUpResult) {
						System.out.println(4);
						isRedirect = false;
						request.getSession().setAttribute("loginId", ggEmail);
						request.getSession().setAttribute("snsId", ggId);
						request.setAttribute("signUpSuccess", true);
						dst = "login.jsp";

					} else {
						System.out.println(5);
						isRedirect = false;
						request.setAttribute("emailExist", true);
						dst = "login.jsp";
					}

				}

			} else if (command.equals("/updateUserInfo.co")) {

				String loginId = (String) request.getSession().getAttribute("loginId");
				String snsId = (String) request.getSession().getAttribute("snsId");

				System.out.println(1);
				String member_name = request.getParameter("member_name");
				String member_location = request.getParameter("member_location");
				String member_gender = request.getParameter("member_gender");
				String member_age = request.getParameter("member_age");

				System.out.println(2);
				System.out.println("============================================");
				System.out.println("/mypage.co 의 session Login Id : " + loginId);
				System.out.println("/mypage.co 의 session snsId : " + snsId);
				System.out.println(member_name);
				System.out.println(member_location);
				System.out.println(member_gender);
				System.out.println(member_age);
				System.out.println("============================================");

				MemberDAO mDAO = new MemberDAO();
				MemberDTO mDTO = new MemberDTO();

				System.out.println(3);
				mDTO.setMember_name(member_name);
				mDTO.setMember_location(member_location);
				mDTO.setMember_gender(member_gender);
				mDTO.setMember_age(member_age);
				System.out.println(4);

				int result = mDAO.updateUserInfo(loginId, snsId, mDTO);
				System.out.println("updateUserInfo / result : " + result);
				isRedirect = false;
				if (result > 0) {
					System.out.println(5);
					request.setAttribute("infoUpdateSuccess", true);
					dst = "mypage.co";
				} else {
					System.out.println(6);
					request.setAttribute("infoUpdateSuccess", false);
					dst = "mypage.co";
				}
			} else if (command.equals("/insertInterest.co")) {
				String loginId = (String) request.getSession().getAttribute("loginId");
				String interest = request.getParameter("interests");
				System.out.println("loginId : " + loginId + "  // interest : " + interest);
				int result = dao.insertInterest(loginId, interest);

				if (result > 0) {
					request.getSession().setAttribute("loginId", loginId);
					dst = "index.jsp";
				} else {
					System.out.println("안들어가짐 ㄷㄷ");
					isRedirect = true;
					dst = "index.jsp";
				}

			} else if (command.equals("/modifyInterests.co")) {
				System.out.println(1);

				String loginId = (String) request.getSession().getAttribute("loginId");
				String modifywords = request.getParameter("hiddenTag");
				System.out.println("제발 들어와라 : " + modifywords);
				int result = dao.insertInterest(loginId, modifywords);

				if (result > 0) {
					dst = "mypage.co";
				} else {
					System.out.println("안들어가짐 ㄷㄷ");
					isRedirect = true;
					dst = "main.meet";
				}

			} else if (command.equals("/pwFinder.co")) {

				MemberDAO mDAO = new MemberDAO();

				String finderEmail = request.getParameter("finder-email");
				String memberPwd = mDAO.getPwThroughGmail(finderEmail);

				System.out.println("finderEmail : " + finderEmail);
				System.out.println("memberPwd : " + memberPwd);

				PwFinder pf = new PwFinder();

				boolean result = pf.PwFinder(finderEmail, memberPwd);

				isRedirect = false;
				if (result) {
					request.setAttribute("emailRspSuccess", true);
					dst = "login.jsp";
				} else {
					request.setAttribute("emailRspSuccess", false);
					dst = "login.jsp";
				}
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
			response.sendRedirect("Oops.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}