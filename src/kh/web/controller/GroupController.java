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
import kh.web.dto.GTableDTO;
import kh.web.dto.GtablePictureDTO;
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
			
			if (command.equals("/list.group")) {
				
				List<GTableDTO> groupList = dao.allgroups();
				List<GtablePictureDTO> groupPicList = dao.allgroupsPictures();
				List<MygroupDTO> myGroupList = dao.myGroupList();
				List<MemberCountDTO> memberCount =  new ArrayList<>();
				
				if(myGroupList.size()>4) {
					
				}
			
				
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
			}else if(command.equals("/five_km.group")) {
				
				String fiveKm = request.getParameter("value");
				String dist = request.getParameter("distance");
				System.out.println(dist);
				String lat = fiveKm.split(":")[0];
				String lng = fiveKm.split(":")[1]; 
				System.out.println(lat);
				System.out.println(lng);
				List<String> result = dao.DistanceSearch(lat, lng, dist);
				
				for(int i=0; i<result.size(); i++) {
					System.out.println(result.get(i));
					
				}
				JSONObject json = new JSONObject();
				json.put("result", result);
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
				
				out.println(json);
				out.flush();
				out.close();
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
