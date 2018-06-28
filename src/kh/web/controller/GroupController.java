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

import kh.web.dao.GroupDAO;
import kh.web.dto.GroupDTO;
import kh.web.dto.GroupPicDTO;
import kh.web.dto.MemberCountDTO;
import kh.web.dto.MygroupDTO;


@WebServlet("*.group")
public class GroupController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length()); 
			PrintWriter out = response.getWriter();
			System.out.println(command); 

			GroupDAO dao = new GroupDAO();
			boolean isRedirect = true;
			String dst = null;
			String ajax_dist = null;
			List<String> distResult = null;
			
			if (command.equals("/list.group")) {
				
				List<GroupDTO> groupList = dao.allgroups();
				List<GroupPicDTO> groupPicList = dao.allgroupsPictures();
				List<MygroupDTO> myGroupList = dao.myGroupList();
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
				
				
				
				
			}else if(command.equals("/groupMain.group")) {
				
				
				
				String page = request.getParameter("page");
				String group_seq = request.getParameter("group_seq");
				
				int groupSeq = Integer.parseInt(group_seq);
				
				List<GroupDTO> result = dao.groupInfo(group_seq);
				
				
				MemberCountDTO dto = dao.MemberCount(groupSeq);
				int count = dto.getCount();
				
				System.out.println("인원수"+count);
				System.out.println("그룹시퀀스 : "+result.get(0).getGroup_seq());
				
				request.setAttribute("result", result);
				request.setAttribute("count", count);
				
				if(page.equals("info")) {
					System.out.println("info");
					
					isRedirect = false;
					dst="groupInfo.jsp";
				}else if(page.equals("meetup")) {
					System.out.println("meetup");
					
					isRedirect = false;
					dst="groupMeetup.jsp";
				}
				
				
				
			}
			
			
			//------------------

			if (isRedirect == false) {
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			}else if(ajax_dist.equals("ajax_dist")) {
				JSONObject json = new JSONObject();
				json.put("distResult", distResult);
				
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
				System.out.println(json);
				new Gson().toJson(distResult, response.getWriter());
			}
			else {
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
