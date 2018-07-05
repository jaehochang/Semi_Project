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

import org.json.simple.JSONObject;

import kh.web.dao.GroupDAO;
import kh.web.dao.MemberDAO;
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
         	MemberDAO dao1 = new MemberDAO();
			GroupDAO dao = new GroupDAO();
			boolean isRedirect = true;
			String dst = null;
			String ajax = null;
			String ajax_dist = null;
			String ajax_nameCheck=null;
			String ajax_pay=null;
			List<String> distResult = null;
			List<MygroupDTO> allGroupList = null;
//			String member_email = request.getSession().getAttribute("loginId").toString();

			
         if (command.equals("/list.group")) {
            
           String member_email = request.getSession().getAttribute("loginId").toString();
            
        
            
			List<GroupDTO> groupList = dao.allgroups();
			List<GroupPicDTO> groupPicList = dao.allgroupsPictures();
//			List<MygroupDTO> myGroupList = dao.myGroupList(member_email);
			List<MemberCountDTO> memberCount =  new ArrayList<>();
			
			boolean isMyGroup = dao1.isMyGroup(member_email);
			
			if(isMyGroup) {
				List<MygroupDTO> myGroupList = dao.myGroupList(member_email);
			
            
            
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
            request.setAttribute("isMyGroup", isMyGroup);

            isRedirect = false;
            dst="loginview.jsp";
			
			}else {
				
				    request.setAttribute("groupList", groupList);		            
		            request.setAttribute("isMyGroup", isMyGroup);

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
            
            int count = 0;
            
            if(dto != null) {
               count = dto.getCount();
            }
            
            
            
            List<GroupPicDTO> groupPagePic = dao.groupPagePic(groupSeq);
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
            
            request.setAttribute("groupPagePic", groupPagePic);
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
            }else if(page.equals("photo")) {
            	isRedirect = false;
                dst="groupPhoto.jsp";
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
            
//            String member_email = request.getSession().getAttribute("loginId").toString();
            String groupSeq = request.getParameter("group_seq");
            int group_seq = Integer.parseInt(groupSeq);
            
            /*int result = dao.groupMemberOut(group_seq, member_email);*/
            
            isRedirect = false;
            dst="groupInfo.jsp";
         }else if (command.equals("/createRequest.group")) {
        	 
			    /*String isMyGroup = request.getAttribute("isMyGroup").toString();*/
				String member_email = (String) request.getSession().getAttribute("loginId");
				
				ajax_dist = "null";
				ajax_pay="null";
				ajax_nameCheck="null";
				
				if (((String) request.getSession().getAttribute("loginId")) != null) {
					isRedirect = false;
                  
					String payCheck=dao.payCheck(member_email);
                    System.out.println("페이유무 : "+payCheck);
					if(payCheck.equals("y")) {
						isRedirect = false;
						dst = "create.jsp";
					}else if(payCheck.equals("n")){
						
						String name=dao1.memberName(member_email);
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
				String loginId = (String)request.getSession().getAttribute("loginId");
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
				ajax_dist="null";
				ajax_nameCheck="null";
				ajax_pay="ajax_pay";
				

			} else if (command.equals("/join.group")) {

				String member_email = request.getSession().getAttribute("loginId").toString();

			}else if(command.equals("/distanceKm.group")) {
				
				ajax_dist = "ajax_dist";
				String fiveKm = request.getParameter("value");
				String dist = request.getParameter("distance");
				System.out.println(dist);
				String lat = fiveKm.split(":")[0];
				String lng = fiveKm.split(":")[1]; 
				System.out.println(lat);
				System.out.println(lng);
				distResult = dao.DistanceSearch(lat, lng, dist);
				
				
				
				
			}else if(command.equals("/join.group")) {
				
			String member_email = request.getSession().getAttribute("loginId").toString();

				String groupSeq = request.getParameter("group_seq");
				int group_seq = Integer.parseInt(groupSeq);
				String group_name = request.getParameter("group_name");

				int joinGroup = dao.joinGroup(member_email, group_seq, group_name);

				System.out.println("email: " + member_email + "seq : " + groupSeq + "/ group_name :" + group_name);

				JSONObject json = new JSONObject();

				json.put("name", "회원입니다.");

				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");

				response.getWriter().print(json);
				response.getWriter().flush();
				response.getWriter().close();

				isRedirect = false;
				dst = "groupInfo.jsp";

			} else if (command.equals("/out.group")) {

				String member_email = request.getSession().getAttribute("loginId").toString();
				String groupSeq = request.getParameter("group_seq");
				int group_seq = Integer.parseInt(groupSeq);

				int result = dao.groupMemberOut(group_seq, member_email);

				isRedirect = false;
				dst = "groupInfo.jsp";
			}


			if (isRedirect == false) {
				System.out.println("값test");
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
				
			}else if(ajax_dist.equals("ajax_dist")) {
				
				JSONObject json = new JSONObject();
				json.put("distResult", distResult);
				
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
				System.out.println(json);
				new Gson().toJson(json, response.getWriter());
			}else if(ajax_nameCheck.equals("ajax_nameCheck")) {
				String groupName=request.getParameter("groupName");
				boolean check=dao.groupNameCheck(groupName);
				System.out.println("groupController boolean:  "+check);
				if(check==true) {
					System.out.println("check==true 들어오나?");
					out.println("그룹명이 중복입니다. 다른 그룹명으로 작성해주세요");
				}else {
					if(groupName == null) {
						return;
					}
				}
			}else if(ajax_pay.equals("ajax_pay")) {
				String buyer_email=request.getParameter("buyer_email");
				System.out.println("buyer_email"+buyer_email);
				int result=dao.payFinish(buyer_email);
				if(result>0) {
                  System.out.println("result들어옴");
                  out.println("success");
				}
			}
			else{
				
				response.sendRedirect(dst);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}