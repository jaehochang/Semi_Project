package kh.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kh.web.dao.GroupDAO;
import kh.web.dto.GroupDTO;
import kh.web.dto.GroupMemberDTO;
import kh.web.dto.GroupPicDTO;
import kh.web.dto.MeetingDTO;
import kh.web.dto.MemberCountDTO;
import kh.web.dto.MygroupDTO;


@WebServlet("*.group")
public class GroupController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length()); 
		
			response.setCharacterEncoding("utf8");
			PrintWriter out = response.getWriter();
			
			System.out.println(command); 

			GroupDAO dao = new GroupDAO();
			boolean isRedirect = true;
			String dst = null;
			
			if (command.equals("/list.group")) {
				
				String member_email = request.getSession().getAttribute("loginId").toString();
				
				List<GroupDTO> groupList = dao.allgroups();
				List<GroupPicDTO> groupPicList = dao.allgroupsPictures();
				List<MygroupDTO> myGroupList = dao.myGroupList(member_email);
				List<MemberCountDTO> memberCount =  new ArrayList<>();
				
				
				if(myGroupList.size() != 0) {
					for(int i=0 ; i<myGroupList.size() ; i++) {
						MemberCountDTO dto = dao.MemberCount(myGroupList.get(i).getGroup_seq());
						
						memberCount.add(dto);
					}
				}
				
				System.out.println("MemberCount"  + memberCount.size());
				
				request.setAttribute("groupList", groupList);
				request.setAttribute("groupPicList", groupPicList);
				request.setAttribute("myGroupList", myGroupList);
				request.setAttribute("memberCount", memberCount);
				
				
//				System.out.println("컨트롤러 : "+memberCount.size());
				isRedirect = false;
				dst="loginview.jsp";
				
			}else if(command.equals("/groupMain.group")) {
				String member_email = request.getSession().getAttribute("loginId").toString();
				
				String page = request.getParameter("page");
				String group_seq = request.getParameter("group_seq");
				
				int groupSeq = Integer.parseInt(group_seq);
				
				List<GroupDTO> result = dao.groupInfo(group_seq);
				MemberCountDTO dto = dao.MemberCount(groupSeq);
				boolean isGroupMember = dao.isGroupMember(groupSeq, member_email);
				
				int count = 0;
				
				if(dto != null) {
					count = dto.getCount();
				}
				
				
				
				
				System.out.println("인원수"+count);
				System.out.println("그룹시퀀스 : "+result.get(0).getGroup_seq());
				
				
				//meeting 내용
				
				List<MeetingDTO> nextMeeting = dao.nextMeetup(groupSeq,0,"one");
				List<MeetingDTO> lastMeeting = dao.lastMeeting(groupSeq);
				List<MeetingDTO> nextAllMeeting = dao.nextMeetup(groupSeq,0,"all");
				
				int meeting_seq = 0;
				
				if(nextMeeting.size() !=0) {
					meeting_seq = nextMeeting.get(0).getMeeting_seq();
				}
				
				List<MeetingDTO> preMeeting = dao.nextMeetup(0, meeting_seq,"pre");
				
				System.out.println("다음미팅 시퀀스  : "+ meeting_seq);
				System.out.println("지난 미팅"+lastMeeting.size());
				
				
				//member 내용
				
				List<GroupMemberDTO> memberList = dao.memberList(groupSeq);
				
				System.out.println("멤버리스트 사이즈 : "+memberList.size());
				
				request.setAttribute("result", result);
				request.setAttribute("count", count);
				request.setAttribute("nextMeeting", nextMeeting);
				request.setAttribute("lastMeeting", lastMeeting);
				request.setAttribute("preMeeting", preMeeting);
				request.setAttribute("isGroupMember", isGroupMember);
				request.setAttribute("nextAllMeeting", nextAllMeeting);
				request.setAttribute("memberList", memberList);
				
				if(page.equals("info")) {
					System.out.println("info");
					
					isRedirect = false;
					dst="groupInfo.jsp";
				}else if(page.equals("meetupNext")) {
					System.out.println("meetupNext");
					
					isRedirect = false;
					dst="groupMeetupNext.jsp";
				}else if(page.equals("meetupLast")) {
					System.out.println("meetupLast");
					
					isRedirect = false;
					dst="groupMeetupLast.jsp";
				}else if(page.equals("member")) {
					isRedirect = false;
					dst="groupMemberList.jsp";
				}else if(page.equals("leader")) {
					isRedirect = false;
					dst="groupLeader.jsp";
				}
				
				
				
			}else if(command.equals("/join.group")) {
				
				String member_email = request.getSession().getAttribute("loginId").toString();
				String groupSeq = request.getParameter("group_seq");
				int group_seq = Integer.parseInt(groupSeq);
				String group_name = request.getParameter("group_name");
				
				int joinGroup = dao.joinGroup(member_email,group_seq,group_name);
				
				System.out.println("email: "+member_email+"seq : " +groupSeq+"/ group_name :" + group_name);
				
				JSONObject json = new JSONObject();
				
				json.put("name", "회원입니다.");
				
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
				
				response.getWriter().print(json);
				response.getWriter().flush();
				response.getWriter().close();
				
				
				isRedirect = false;
				dst="groupInfo.jsp";
				
				
			}else if(command.equals("/out.group")) {
				
				String member_email = request.getSession().getAttribute("loginId").toString();
				String groupSeq = request.getParameter("group_seq");
				int group_seq = Integer.parseInt(groupSeq);
				
				int result = dao.groupMemberOut(group_seq, member_email);
				
				isRedirect = false;
				dst="groupInfo.jsp";
			}
			
			//------------------

			if (isRedirect == false) {
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			} else {
				response.sendRedirect(dst);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
