package kh.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.dao.GroupDAO;
import kh.web.dao.MemberDAO;
import kh.web.dto.GTableDTO;
import kh.web.dto.GroupDTO;
import kh.web.dto.GtablePictureDTO;
import kh.web.dto.MemberCountDTO;
import kh.web.dto.MygroupDTO;

@WebServlet("*.group")
public class GroupController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());

			System.out.println(command);

			GroupDAO dao = new GroupDAO();

			boolean isRedirect = true;
			String dst = null;

			if (command.equals("/list.group")) {

				List<GTableDTO> groupList = dao.allgroups();
				List<GtablePictureDTO> groupPicList = dao.allgroupsPictures();
				List<MygroupDTO> myGroupList = dao.myGroupList();
				List<MemberCountDTO> memberCount = new ArrayList<>();

				if (myGroupList.size() > 4) {

				}

				if (myGroupList.size() != 0) {
					for (int i = 0; i < myGroupList.size(); i++) {
						MemberCountDTO dto = dao.MemberCount(myGroupList.get(i).getGroup_seq());

						memberCount.add(dto);
					}
				}

				System.out.println("MemberCount" + memberCount.size());

				request.setAttribute("groupList", groupList);
				request.setAttribute("groupPicList", groupPicList);
				request.setAttribute("myGroupList", myGroupList);
				request.setAttribute("memberCount", memberCount);

				// System.out.println("컨트롤러 : "+memberCount.size());
				isRedirect = false;
				dst = "loginview.jsp";

			} else if (command.equals("/groupMain.group")) {

				String group_seq = request.getParameter("group_seq");
				int groupSeq = Integer.parseInt(group_seq);

				List<GTableDTO> result = dao.groupInfo(group_seq);

				MemberCountDTO dto = dao.MemberCount(groupSeq);
				int count = dto.getCount();

				System.out.println("인원수" + count);

				request.setAttribute("result", result);
				request.setAttribute("count", count);

				isRedirect = false;
				dst = "groupMain.jsp";

			} else if (command.equals("/createRequest.group")) {

				System.out.println("createRequest.group 들어옴");
				MemberDAO mDAO = new MemberDAO();
				
				if (((String) request.getSession().getAttribute("loginId")) != null) {
					isRedirect = true;
					dst = "create.jsp";
				} else {
					isRedirect = true;
					dst = "signUpPage.jsp";

				}
			} else if (command.equals("/create.group")) {

				request.setCharacterEncoding("UTF-8");
				String loginId = "plmn8550@naver.com";
				/* (String)request.getSession().getAttribute("loginId"); */
				String location = (String) request.getParameter("location");
				String tags = (String) request.getParameter("tags");
				String groupTitle = (String) request.getParameter("eventName");
				String groupContents = (String) request.getParameter("eventContents");

				System.out.println("loginId : " + loginId + "/" + "location : " + location + "/" + "tags : " + tags
						+ "/" + "groupTitle : " + groupTitle + "/" + "groupContents : " + groupContents);

				GroupDTO dto = new GroupDTO();
				dto.setGroup_leader(loginId);
				dto.setGroup_location(location);
				dto.setGroup_interests(tags);
				dto.setGroup_name(groupTitle);
				dto.setGroup_info(groupContents);
				int result = dao.insertGroup(dto);

				if (result > 0) {
					String printResult = dao.printNameGroup(groupTitle);

					request.setAttribute("groupName", printResult);
					isRedirect = false;
					dst = "groupCreateConfirm.jsp";
				} else {
					isRedirect = true;
					dst = "create.jsp";
				}

			}

			// ------------------

			if (isRedirect == false) {
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			} else {
				response.sendRedirect(dst);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
