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
import kh.web.dao.ReportDAO;
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

			request.setCharacterEncoding("utf8");
			response.setCharacterEncoding("utf8");
			PrintWriter out = response.getWriter();

			System.out.println(command);
			ReportDAO rdao = new ReportDAO();
			MemberDAO dao1 = new MemberDAO();
			GroupDAO dao = new GroupDAO();
			boolean isRedirect = true;
			String dst = null;
			String ajax_group= null;
			String ajax_dist = null;
			String ajax_nameCheck = null;
			String ajax_pay = null;
			List<String> distResult = null;
			List<String> distSearchCount = null;
			List<MygroupDTO> allGroupList = null;
			// String member_email =
			// request.getSession().getAttribute("loginId").toString();

			if (command.equals("/list.group")) {
				
				if(request.getSession().getAttribute("loginId") == null) {
	            String member_email = request.getSession().getAttribute("loginId").toString();
	               List<GroupPicDTO> groupPicList = dao.allgroupsPictures();
	               List<GroupDTO> groupList = dao.allgroups();
	            
	               List<MemberCountDTO> memberCount =  new ArrayList<>();
	               List<MygroupDTO> myGroupList = dao.myGroupList(member_email);
	               
	               
	               if(myGroupList.size() != 0) {
	                  for(int i=0 ; i<myGroupList.size() ; i++) {
	                     memberCount.add(dto);
	                     MemberCountDTO dto = dao.MemberCount(myGroupList.get(i).getGroup_seq());
	                     
	                  }
	               }
	               
	               System.out.println("MemberCount"  + memberCount.size());
	               
	               request.setAttribute("myGroupList", myGroupList);
	               request.setAttribute("groupList", groupList);
	               request.setAttribute("groupPicList", groupPicList);
	               
	               request.setAttribute("memberCount", memberCount);
	               
//	               System.out.println("컨트롤러 : "+memberCount.size());
	               dst="loginview.jsp";
	               isRedirect = false;
				}else {
					String member_email = request.getSession().getAttribute("loginId").toString();
					   MemberDAO mDAO = new MemberDAO();
		               List<GroupDTO> groupList = dao.allgroups();
		               List<GroupPicDTO> groupPicList = dao.allgroupsPictures();
		               List<MygroupDTO> myGroupList = dao.myGroupList(member_email);
		               List<MemberCountDTO> memberCount =  new ArrayList<>();
		               boolean isMyGroup = mDAO.isMyGroup(member_email);
		               
		               if(myGroupList.size() != 0) {
		                  for(int i=0 ; i<myGroupList.size() ; i++) {
		                     MemberCountDTO dto = dao.MemberCount(myGroupList.get(i).getGroup_seq());
		                     
		                     memberCount.add(dto);
		               }
		               
		                  }
		               request.setAttribute("isMyGroup", isMyGroup);
		               System.out.println("MemberCount"  + memberCount.size());
		               request.setAttribute("groupPicList", groupPicList);
		               request.setAttribute("myGroupList", myGroupList);
		               request.setAttribute("groupList", groupList);
		               request.setAttribute("memberCount", memberCount);
		               
		               
//		               System.out.println("컨트롤러 : "+memberCount.size());
		               isRedirect = false;
		               dst="loginview.jsp";
				}
					
			}else if(command.equals("/groupMain.group")) {
           String member_email = request.getSession().getAttribute("loginId").toString();
            
            String page = request.getParameter("page");
            String group_seq = request.getParameter("group_seq");
            
            int groupSeq = Integer.parseInt(group_seq);
            
            List<GroupDTO> result = dao.groupInfo(group_seq);
            MemberCountDTO dto = dao.MemberCount(groupSeq);
            boolean isGroupMember = dao.isGroupMember(groupSeq, member_email);
            
				boolean isBlockedGroup = dao.isBlockedGroup(groupSeq);
            int count = 0;
            
            if(dto != null) {
               count = dto.getCount();
            }
            
            
            String originName = result.get(0).getGroup_name();
            
            
            List<GroupPicDTO> groupPagePic = dao.groupPagePic(groupSeq);
            int groupPagePicCount = dao.groupPicCount(groupSeq);
            
            
            System.out.println("인원수"+count);
            System.out.println("그룹사진갯수" + groupPagePicCount);
            System.out.println("그룹시퀀스 : "+result.get(0).getGroup_seq());
            //meeting 내용
            
            List<MeetingDTO> nextMeeting = dao.nextMeetup(groupSeq);
            List<MeetingDTO> lastMeeting = dao.lastMeeting(groupSeq);
            List<MeetingDTO> nextAllMeeting = dao.nextAllMeeting(groupSeq);
            
            int meeting_seq = 0;
            
            if(nextMeeting.size() !=0) {
               meeting_seq = nextMeeting.get(0).getMeeting_seq();
            
            }
				List<MeetingDTO> preMeeting = dao.nextMeetup(groupSeq, meeting_seq, "pre");
				System.out.println("다음미팅 시퀀스  : " + meeting_seq);
				System.out.println("지난 미팅" + lastMeeting.size());
				System.out.println("예정미팅" + preMeeting.size());
				// 세션에 그룹 시퀀스값 저장
				request.getSession().setAttribute("groupSeq", groupSeq);
				// 페이지 들어갈때가마다 그룹시퀀스 값 변경되어 글어감

				List<GroupMemberDTO> memberList = dao.memberList(groupSeq);
				System.out.println("멤버리스트 사이즈 : " + memberList.size());

				request.setAttribute("isBlockedGroup", isBlockedGroup);
				request.setAttribute("groupPagePicCount", groupPagePicCount);
				request.setAttribute("groupPagePic", groupPagePic);
				request.setAttribute("count", count);
				request.setAttribute("nextMeeting", nextMeeting);
				request.setAttribute("result", result);
				request.setAttribute("preMeeting", preMeeting);
				request.setAttribute("lastMeeting", lastMeeting);
				request.setAttribute("isGroupMember", isGroupMember);
				request.setAttribute("nextAllMeeting", nextAllMeeting);
				request.setAttribute("memberList", memberList);
            request.setAttribute("preMeeting", preMeeting);
            if(page.equals("info")) {
               System.out.println("info");
               
               isRedirect = false;
               dst="groupInfo.jsp";
               
            request.setAttribute("leader_email", leader_email);
            request.setAttribute("leaderInfo", leaderInfo);
               isRedirect = false;
            }else if(page.equals("meetupLast")) {
               dst="groupMeetupNext.jsp";
               System.out.println("meetupLast");
               
               isRedirect = false;
               dst="groupMeetupLast.jsp";
               isRedirect = false;
            }else if(page.equals("member")) {
               dst="groupMemberList.jsp";
               dst="groupLeader.jsp";
               isRedirect = false;
            }else if(page.equals("leader")) {
            }else if(page.equals("photo")) {
            	isRedirect = false;
            }
                dst="groupPhoto.jsp";
         }else if(command.equals("/attendMem.group")) {
        	 
        	 int meeting_seq = Integer.parseInt(meetingSep);

        	 System.out.println(attendMemberPic.size());

        	 List<AttendDTO> attendMemberPic = dao.attendMemberPic(meeting_seq);
        	 System.out.println(meetingSep);
        	 String meetingSep = request.getParameter("meetingSep");
        	 
        	 response.setContentType("application/json");
        	 response.setCharacterEncoding("utf8");

        	 new Gson().toJson(attendMemberPic, response.getWriter());
        	 ajax_dist = "null";
        	 ajax_pay = "null";
        	 ajax_nameCheck = "null";
        	 ajax_group = "group";
         }else if(command.equals("/join.group")) {
             
             String groupSeq = request.getParameter("group_seq");
             int group_seq = Integer.parseInt(groupSeq);
             String member_email = request.getSession().getAttribute("loginId").toString();
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
             
			ajax_pay = "null";
            ajax_dist = "null";
			ajax_nameCheck = "null";
            ajax_group = "group";
             
             
          }else if(command.equals("/out.group")) {
         	 
         	 System.out.println(11111);
             
             String groupSeq = request.getParameter("group_seq");
             int group_seq = Integer.parseInt(groupSeq);
             String member_email = request.getSession().getAttribute("loginId").toString();
             
             int removeGroupMember = dao.removeGroupMember(member_email);
             int result = dao.MygroupOut(group_seq, member_email);
             
             dst="groupMain.group?group_seq="+groupSeq+"&page=info";
             isRedirect = false;
         }else if (command.equals("/createRequest.group")) {
             
			    /*String isMyGroup = request.getAttribute("isMyGroup").toString();*/
        	 
            String leader_email = result.get(0).getMember_email();
            List<MemberDTO> leaderInfo = dao.LeaderInfo(leader_email);
				String member_email = (String) request.getSession().getAttribute("loginId");
				String group_name = request.getParameter("group_name");
				String report_reason = request.getParameter("report_reason");
				String etc_reason = request.getParameter("etc_reason");

				int result = rdao.insertGroupReport(member_email, group_name, report_reason, etc_reason);

				if (result > 0) {
					isRedirect = false;
					dst = "list.group";
				}
			} else if (command.equals("/membereportcomplete.group")) {
				String caller = (String) request.getSession().getAttribute("loginId");
				String calleeMember = request.getParameter("member_email");
				String reason = request.getParameter("reason");
				String etcReason = request.getParameter("etcreason");
				System.out.println("memberreport");
				System.out.println(caller);
				System.out.println(calleeMember);
				System.out.println(reason);
				System.out.println(etcReason);

				int result = rdao.insertMemberReport(caller, calleeMember, reason, etcReason);

				isRedirect = false;
				dst = "list.group";
			}
			// 여기까지 인형

			else if (command.equals("/out.group")) {

				System.out.println(11111);

				String member_email = request.getSession().getAttribute("loginId").toString();
				String groupSeq = request.getParameter("group_seq");
				int group_seq = Integer.parseInt(groupSeq);

				int result = dao.MygroupOut(group_seq, member_email);
				int removeGroupMember = dao.removeGroupMember(member_email);

				isRedirect = false;
				dst = "groupMain.group?group_seq=" + groupSeq + "&page=info";

			} else if (command.equals("/createRequest.group")) {

				/* String isMyGroup = request.getAttribute("isMyGroup").toString(); */
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
			}else if(command.equals("/groupNameCheck.group")) {
				ajax_dist="null";
				ajax_pay="null";
				ajax_nameCheck="ajax_nameCheck";
				
				
			
			}else if (command.equals("/create.group")) {
					
				
				request.setCharacterEncoding("UTF-8");
                groupContents=groupContents.replace("\r\n", "<br>");
                int seq = dao.seq();
	            String loginId = (String)request.getSession().getAttribute("loginId");
	            String memberName = request.getParameter("member_name");
	            String location = (String) request.getParameter("location");
	            String lat = (String)request.getParameter("lat");
	            String lng = (String)request.getParameter("lng");
	            String tags = (String) request.getParameter("tags");
	            String groupTitle = (String) request.getParameter("eventName");
	            String groupContents = (String) request.getParameter("eventContents");
	                
	            
	            System.out.println("위도  : " + lat );
	            System.out.println("경도  : " + lng );
	            System.out.println("memberName : " + memberName + "/" + "location : " + location + "/" + "tags : " + tags
	                  + "/" + "groupTitle : " + groupTitle + "/" + "groupContents : " + groupContents);

	            GroupDTO dto = new GroupDTO();
	            dto.setGroup_leader(memberName);
	            dto.setGroup_location(location);
	            dto.setGroup_latitude(lat);
	            dto.setGroup_longitude(lng);
	            dto.setGroup_interests(tags);
	            dto.setGroup_name(groupTitle);
	            dto.setGroup_info(groupContents);
	            dto.setMember_email(loginId);
	            int result = dao.insertGroup(dto);
	                
	            if (result > 0) {
	               String[] printResult = dao.printNameGroup(groupTitle);
	               String gseq=printResult[0];
	               String gTitle=printResult[1];
	               
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

			} else if (command.equals("/distanceKm.group")) {

				ajax_dist = "ajax_dist";
				String val = request.getParameter("value");
				String dist = request.getParameter("distance");
				String loc = request.getParameter("location");
				String word = request.getParameter("word");
				
				System.out.println("value 값  : " + val + "dist 값  : " + dist + "location 값  : " + loc);
				String lat = val.split(":")[0];
				String lng = val.split(":")[1];
				String city = loc;
				
				System.out.println("lat 값  : " + lat + "lng 값  : " + lng + "city 값  : " + city + "word 값" + word);
				
				
				distResult = dao.DistanceSearch(lat, lng, dist, city, word);
				for(int j=0; j<distResult.size(); j++) {
				System.out.println(distResult);
				}
				distSearchCount = dao.distSearchCount(distResult);
				for(int i=0; i<distSearchCount.size(); i++) {
					
					System.out.println(distSearchCount.get(i));
				}
			}else if(command.equals("/toupdate.group")) {
				String groseq = request.getParameter("groupSeq");
				 List<GroupDTO> result = dao.groupInfo(groseq);
				 request.setAttribute("result", result);
				isRedirect = false;
				dst="changeMettingGroupBasic.jsp";
			}else if(command.equals("/updatebasic.group")){
				String group_seq = request.getSession().getAttribute("groupSeq").toString();
				int groupseq = Integer.parseInt(group_seq);
				System.out.println(groupseq);

				String groupName = request.getParameter("groupname");
				System.out.println(groupName);
				String groupDescripton = request.getParameter("description");
				System.out.println(groupDescripton);
				String location = request.getParameter("location");
				System.out.println(groupDescripton);
				GroupDTO dto = new GroupDTO();
				dto.setGroup_name(groupName);
				dto.setGroup_info(groupDescripton);
				dto.setGroup_location(location);
				int result = dao.updateMettingBasic(dto, groupseq);
				System.out.println(result);
				
				if(result > 0) {
					isRedirect = false;
					dst="list.group";
				}else {
					isRedirect = true;
					dst="list.group";
				}
				
			}else if(command.equals("/duplecheck.group")) {
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
				String newname = request.getParameter("val");
				System.out.println(newname);
				boolean duplechk = dao.duplecheckGroup(newname);
				System.out.println(duplechk);
				ajax_dist = "ajax_dist";
				JSONObject json = new JSONObject();
				json.put("names", duplechk);
				
				response.getWriter().flush();
				response.getWriter().close();
				response.getWriter().print(json);
			}

			if (isRedirect == false) {
				System.out.println("값test");
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);

			} else if (command.equals("/memberprofile.group")) {
				String member_email = request.getParameter("member_email");
				int group_seq = Integer.parseInt(request.getParameter("group_seq"));
				System.out.println("in memberprofile");
				System.out.println(member_email);
				System.out.println(group_seq);
				List<MygroupDTO> mglist = dao.getJoinGroup(member_email);
				String names = "";
				System.out.println("그룹이름:" + mglist.size());

				for (int i = 0; i < mglist.size(); i++) {
					names += mglist.get(i).getGroup_name() + "  ";
				}
				System.out.println("names:" + names);
				MemberDTO mdto = dao.getProfile(member_email, group_seq);

				JSONObject json = new JSONObject();
				json.put("names", names);
				json.put("mdto", mdto);
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");

				new Gson().toJson(json, response.getWriter());

			} else if (command.equals("/groupmembersearch.group")) {
				int group_seq = Integer.parseInt(request.getParameter("group_seq"));
				String text = request.getParameter("text");
				JSONObject json = new JSONObject();
				List<MemberDTO> gmlist = dao.searchGroupMember(group_seq, text);
				System.out.println("controller-size:"+gmlist.size());
				json.put("gmlist", gmlist);
				System.out.println("groupmembersearch.group:");
				System.out.println(group_seq);
				System.out.println(text);
				
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");

				new Gson().toJson(json, response.getWriter());

			} else if (ajax_dist.equals("ajax_dist")) {

				JSONObject json = new JSONObject();
				json.put("distSearchCount", distSearchCount);
				
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
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}