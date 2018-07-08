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

import com.google.gson.Gson;

import kh.web.dao.AdminDAO;
import kh.web.dao.GroupDAO;
import kh.web.dao.MemberDAO;
import kh.web.dto.AttendDTO;
import kh.web.dto.GroupDTO;
import kh.web.dto.GroupMemberDTO;
import kh.web.dto.GroupPicDTO;
import kh.web.dto.MeetingDTO;
import kh.web.dto.MemberCountDTO;
import kh.web.dto.MemberDTO;
import kh.web.dto.MygroupDTO;

@WebServlet("*.group")
public class GroupController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());

			response.setCharacterEncoding("utf8");
			PrintWriter out = response.getWriter();

			System.out.println(command);
			MemberDAO dao1 = new MemberDAO();
			GroupDAO dao = new GroupDAO();
			boolean isRedirect = true;
			String dst = null;
			String ajax_group= null;
			String ajax_dist = null;
			String ajax_nameCheck = null;
			String ajax_pay = null;
			List<String> distResult = null;
			List<MygroupDTO> allGroupList = null;
			// String member_email =
			// request.getSession().getAttribute("loginId").toString();

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
	            
	            
//	            System.out.println("컨트롤러 : "+memberCount.size());
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
            
            String leader_email = result.get(0).getMember_email();
            List<MemberDTO> leaderInfo = dao.LeaderInfo(leader_email);
            
            int count = 0;
            
            if(dto != null) {
               count = dto.getCount();
            }
            
            
            String originName = result.get(0).getGroup_name();
            
            
            List<GroupPicDTO> groupPagePic = dao.groupPagePic(groupSeq);
            int groupPagePicCount = dao.groupPicCount(groupSeq);
            
            
            System.out.println("인원수"+count);
            System.out.println("그룹시퀀스 : "+result.get(0).getGroup_seq());
            System.out.println("그룹사진갯수" + groupPagePicCount);
            
            
            //meeting 내용
            
            List<MeetingDTO> nextMeeting = dao.nextMeetup(groupSeq);
            List<MeetingDTO> lastMeeting = dao.lastMeeting(groupSeq);
            List<MeetingDTO> nextAllMeeting = dao.nextAllMeeting(groupSeq);
            
            int meeting_seq = 0;
            
            if(nextMeeting.size() !=0) {
               meeting_seq = nextMeeting.get(0).getMeeting_seq();
            }
            
            List<MeetingDTO> preMeeting = dao.preMeeting(groupSeq, meeting_seq);
            
            System.out.println("다음미팅 시퀀스  : "+ meeting_seq);
            System.out.println("지난 미팅"+lastMeeting.size());
            System.out.println("예정미팅"+preMeeting.size());
            System.out.println("다음전체미팅"+nextAllMeeting.size());
            // 세션에  그룹 시퀀스값 저장
            request.getSession().setAttribute("groupSeq", groupSeq);
            //  페이지 들어갈때가마다 그룹시퀀스 값 변경되어 글어감
            
            //member 내용
            List<GroupMemberDTO> memberList = dao.memberList(groupSeq);
            
            
            System.out.println("멤버리스트 사이즈 : "+memberList.size());
            
            request.setAttribute("groupPagePicCount", groupPagePicCount);
            request.setAttribute("groupPagePic", groupPagePic);
            request.setAttribute("result", result);
            request.setAttribute("count", count);
            request.setAttribute("nextMeeting", nextMeeting);
            request.setAttribute("lastMeeting", lastMeeting);
            request.setAttribute("preMeeting", preMeeting);
            request.setAttribute("isGroupMember", isGroupMember);
            request.setAttribute("nextAllMeeting", nextAllMeeting);
            request.setAttribute("memberList", memberList);
            request.setAttribute("leader_email", leader_email);
            request.setAttribute("leaderInfo", leaderInfo);
            
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
            }else if(page.equals("photo")) {
            	isRedirect = false;
                dst="groupPhoto.jsp";
            }
            
            
            
         }else if(command.equals("/attendMem.group")) {
        	 
        	 String meetingSep = request.getParameter("meetingSep");
        	 int meeting_seq = Integer.parseInt(meetingSep);
        	 System.out.println(meetingSep);

        	 List<AttendDTO> attendMemberPic = dao.attendMemberPic(meeting_seq);

        	 System.out.println(attendMemberPic.size());
        	 
        	 response.setCharacterEncoding("utf8");
        	 response.setContentType("application/json");

        	 new Gson().toJson(attendMemberPic, response.getWriter());

        	 ajax_dist = "null";
        	 ajax_pay = "null";
        	 ajax_nameCheck = "null";
        	 ajax_group = "group";
        	 
         }else if(command.equals("/join.group")) {
             
             String member_email = request.getSession().getAttribute("loginId").toString();
             String groupSeq = request.getParameter("group_seq");
             int group_seq = Integer.parseInt(groupSeq);
             String group_name = request.getParameter("group_name");
             String member_name = dao1.memberName(member_email);
             
             int joinGroup = dao.joinMyGroup(member_email,group_seq,group_name);
             int addGroupMember = dao.addGroupMember(member_email, group_seq, member_name);
             
             System.out.println("email: "+member_email+"seq : " +groupSeq+"/ group_name :" + group_name);
             
             JSONObject json = new JSONObject();
             
             json.put("name", "회원입니다.");
             
             response.setCharacterEncoding("utf8");
             response.setContentType("application/json");
             
             response.getWriter().print(json);
             response.getWriter().flush();
             response.getWriter().close();
             
            ajax_dist = "null";
			ajax_pay = "null";
			ajax_nameCheck = "null";
            ajax_group = "group";
             
             
          }else if(command.equals("/out.group")) {
         	 
         	 System.out.println(11111);
             
             String member_email = request.getSession().getAttribute("loginId").toString();
             String groupSeq = request.getParameter("group_seq");
             int group_seq = Integer.parseInt(groupSeq);
             
             int result = dao.MygroupOut(group_seq, member_email);
             int removeGroupMember = dao.removeGroupMember(member_email);
             
             isRedirect = false;
             dst="groupMain.group?group_seq="+groupSeq+"&page=info";
             
         }else if (command.equals("/createRequest.group")) {
        	 
			    /*String isMyGroup = request.getAttribute("isMyGroup").toString();*/
				String member_email = (String) request.getSession().getAttribute("loginId");

				ajax_dist = "null";
				ajax_pay = "null";
				ajax_nameCheck = "null";

				if (((String) request.getSession().getAttribute("loginId")) != null) {
					isRedirect = false;

					String payCheck = dao.payCheck(member_email);
					System.out.println("페이유무 : " + payCheck);
					if (payCheck.equals("y")) {
						isRedirect = false;
						String memberEmail=(String) request.getSession().getAttribute("loginId");
						String memberName=dao1.memberName(memberEmail);
						request.setAttribute("member_name", memberName);
						dst = "create.jsp";
					} else if (payCheck.equals("n")) {

						String name = dao1.memberName(member_email);
						request.setAttribute("member_name", name);
						request.setAttribute("member_email", member_email);
						isRedirect = false;
						dst = "pay.jsp";
					}
				} else {
					isRedirect = true;
					dst = "login.jsp";
				}
			} else if (command.equals("/groupNameCheck.group")) {
				ajax_dist = "null";
				ajax_pay = "null";
				ajax_nameCheck = "ajax_nameCheck";

			} else if (command.equals("/create.group")) {

				request.setCharacterEncoding("UTF-8");
				String loginId = (String)request.getSession().getAttribute("loginId");
				String memberName=request.getParameter("member_name");
				String location = (String) request.getParameter("location");
				String tags = (String) request.getParameter("tags");
				String groupTitle = (String) request.getParameter("eventName");
				String groupContents = (String) request.getParameter("eventContents");
                int seq = dao.seq();
	

				System.out.println("memberName : " + memberName + "/" + "location : " + location + "/" + "tags : " + tags
						+ "/" + "groupTitle : " + groupTitle + "/" + "groupContents : " + groupContents);

				GroupDTO dto = new GroupDTO();
				dto.setGroup_leader(memberName);
				dto.setGroup_location(location);
				dto.setGroup_interests(tags);
				dto.setGroup_name(groupTitle);
				dto.setGroup_info(groupContents);
				dto.setMember_email(loginId);
				int result = dao.insertGroup(dto);
				int joinMyGroup = dao.joinMyGroup(loginId, seq+1, groupTitle);
                
				if (result > 0) {
					String[] printResult = dao.printNameGroup(groupTitle);
					String gseq = printResult[0];
					String gTitle = printResult[1];

					request.setAttribute("group_seq", gseq);
					request.setAttribute("groupName", gTitle);
					isRedirect = false;
					dst = "groupCreateConfirm.jsp";

				} else {
					isRedirect = true;
					dst = "createRequest.group";
				}

			} else if (command.equals("/payEnd.group")) {
				ajax_dist = "null";
				ajax_nameCheck = "null";
				ajax_pay = "ajax_pay";

			} else if(command.equals("/distanceKm.group")) {
				
				ajax_dist = "ajax_dist";
				String fiveKm = request.getParameter("value");
				String dist = request.getParameter("distance");
				System.out.println(dist);
				String lat = fiveKm.split(":")[0];
				String lng = fiveKm.split(":")[1];
				System.out.println(lat);
				System.out.println(lng);
				distResult = dao.DistanceSearch(lat, lng, dist);
				
				
				
				
			}

			if (isRedirect == false) {
				System.out.println("값test");
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);

			}else if(ajax_group.equals("group")) {
				
			}else if (ajax_dist.equals("ajax_dist")) {

				JSONObject json = new JSONObject();
				json.put("distResult", distResult);

				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
				System.out.println(json);
				new Gson().toJson(json, response.getWriter());
			} else if (ajax_nameCheck.equals("ajax_nameCheck")) {
				String groupName = request.getParameter("groupName");
				boolean check = dao.groupNameCheck(groupName);
				System.out.println("groupController boolean:  " + check);
				if (check == true) {
					System.out.println("check==true 들어오나?");
					out.println("그룹명이 중복입니다. 다른 그룹명으로 작성해주세요");
				} else {
					if (groupName == null) {
						return;
					}
				}
			} else if (ajax_pay.equals("ajax_pay")) {
				String buyer_email = request.getParameter("buyer_email");
				System.out.println("buyer_email" + buyer_email);
				int result = dao.payFinish(buyer_email);
				if (result > 0) {
					System.out.println("result들어옴");
					out.println("success");
				}

			}// ----------------밑으로 인형----------------
	         else if (command.equals("/groupreport.group")) {
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
	             response.sendRedirect(dst);
	          } else if (command.equals("/memberprofile.group")) {
	             System.out.println("in memberprofile");
	             String member_email = request.getParameter("member_email");
	             System.out.println(member_email);

	             isRedirect = false;
	             dst = "memberprofile.jsp";
	          }
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}