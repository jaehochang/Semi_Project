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

import kh.web.dao.AdminDAO;
import kh.web.dao.GroupDAO;
import kh.web.dto.GroupDTO;
import kh.web.dto.GroupPicDTO;
import kh.web.dto.MeetingDTO;
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

			request.setCharacterEncoding("UTF-8");

			GroupDAO dao = new GroupDAO();
			boolean isRedirect = true;
			String dst = null;

			if (command.equals("/list.group")) {

				List<GroupDTO> groupList = dao.allgroups();
				List<GroupPicDTO> groupPicList = dao.allgroupsPictures();
				List<MygroupDTO> myGroupList = dao.myGroupList();
				List<MemberCountDTO> memberCount = new ArrayList<>();

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

				String page = request.getParameter("page");
				String group_seq = request.getParameter("group_seq");

				int groupSeq = Integer.parseInt(group_seq);

				List<GroupDTO> result = dao.groupInfo(group_seq);
				MemberCountDTO dto = dao.MemberCount(groupSeq);

				int count = 0;

				if (dto != null) {
					count = dto.getCount();
				}

				System.out.println("인원수" + count);
				System.out.println("그룹시퀀스 : " + result.get(0).getGroup_seq());

				// meeting 내용

				List<MeetingDTO> nextMeeting = dao.nextMeetup(groupSeq, 0);
				List<MeetingDTO> lastMeeting = dao.lastMeeting(groupSeq);

				int meeting_seq = 0;

				if (nextMeeting.size() != 0) {
					meeting_seq = nextMeeting.get(0).getMeeting_seq();
				}

				List<MeetingDTO> preMeeting = dao.nextMeetup(0, meeting_seq);

				System.out.println("다음미팅 시퀀스  : " + meeting_seq);
				System.out.println("지난 미팅" + lastMeeting.size());

				request.setAttribute("result", result);
				request.setAttribute("count", count);
				request.setAttribute("nextMeeting", nextMeeting);
				request.setAttribute("lastMeeting", lastMeeting);
				request.setAttribute("preMeeting", preMeeting);
				request.setAttribute("group_seq", group_seq);

				if (page.equals("info")) {
					System.out.println("info");

					isRedirect = false;
					dst = "groupInfo.jsp";
				} else if (page.equals("meetup")) {
					System.out.println("meetup");

					isRedirect = false;
					dst = "groupMeetup.jsp";
				}

				// ----------------밑으로 인형----------------
			} else if (command.equals("/groupreport.group")) {
				int group_seq = Integer.parseInt(request.getParameter("group_seq"));
				request.setAttribute("group_seq", group_seq);
				isRedirect = false;
				dst = "groupreport.jsp";

			} else if (command.equals("/groupreportproc.group")) {
				String report_reason = request.getParameter("report_select");
				int group_seq = Integer.parseInt(request.getParameter("group_seq"));
				AdminDAO adao = new AdminDAO();
				GroupDTO gdto = adao.getGroupData(group_seq);

				request.setAttribute("gdto", gdto);
				request.setAttribute("report_reason", report_reason);
				request.setAttribute("group_seq", group_seq);
				isRedirect = false;
				dst = "groupreportproc.jsp";

			} else if (command.equals("/greportcomplete.group")) {
				String member_email = (String) request.getSession().getAttribute("loginId");
				String group_name = request.getParameter("group_name");
				String report_reason = request.getParameter("report_reason");
				String etc_reason = request.getParameter("etc_reason");

				AdminDAO adao = new AdminDAO();
				int result = adao.insertGroupReport(member_email, group_name, report_reason, etc_reason);

				if (result > 0) {
					isRedirect = false;
					dst = "list.group";
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
