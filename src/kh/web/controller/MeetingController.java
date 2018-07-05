package kh.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javafx.scene.Group;
import kh.web.dao.GroupDAO;
import kh.web.dao.MeetingDAO;
import kh.web.dto.GroupDTO;
import kh.web.dto.MeetingDTO;

/**
 * Servlet implementation class GroupController
 */
@WebServlet("*.meet")
public class MeetingController extends HttpServlet {
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      try {
         String requestURI = request.getRequestURI();
         String contextPath = request.getContextPath();
         String command = requestURI.substring(contextPath.length()); 
         
         System.out.println(command); 
         
         GroupDAO gdao = new GroupDAO();
         MeetingDAO dao = new MeetingDAO();
         boolean isRedirect = true;
         String dst = null;
         
         if(command.equals("/main.meet")) {
            List<MeetingDTO> result = dao.getMeetingData();
            request.setAttribute("result", result);
            isRedirect = false;
            dst = "main.jsp";
         } else if (command.equals("/meeting.meet")) {
            int meeting_seq = Integer.parseInt(request.getParameter("seq"));
            MeetingDTO result = dao.getEachMeetingData(meeting_seq);
            request.setAttribute("result", result);
            isRedirect = false;
            dst = "meeting.jsp";
            
         } else if(command.equals("/newmeeting.meet")) {
        	 System.out.println("in newmeeting.meet");
//        	 int group_seq = Integer.parseInt(request.getParameter("group_seq"));
//        	 GroupDTO gdto = gdao.getGroupData(group_seq);
        	 MeetingDTO mdto = new MeetingDTO();
        	 String meeting_title = request.getParameter("sub2_textarea");
        	 String meeting_contents = request.getParameter("sub5_textarea");
        	 String meeting_location = request.getParameter("loc");
        	 String meeting_latlng = request.getParameter("latlng");
        	 // 지혜야 그림파일 넣어라
        	 String meeting_picture = "default.jpg";
        	 
        	 System.out.println("newmeeting.meet:");
        	 System.out.println(meeting_title);
        	 System.out.println(meeting_contents);
        	 System.out.println(meeting_location);
        	 System.out.println(meeting_latlng);
        	 
        	 mdto.setMeeting_contents(meeting_contents);
//        	 mdto.setMeeting_lat(meeting_lat);
//        	 mdto.setMeeting_lng(meeting_lng);
        	 mdto.setMeeting_location(meeting_location);
        	 mdto.setMeeting_title(meeting_title);
        	 mdto.setMeeting_picture(meeting_picture);
        	 
//        	 int result = dao.insertNewMeeting(gdto, mdto);
        	 
        	 isRedirect = false;
        	 dst="NewFile.html";
         }
         
         if(isRedirect) {
            response.sendRedirect(dst);
         } else {
            RequestDispatcher rd = request.getRequestDispatcher(dst);
            rd.forward(request, response);
         }
      
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      
      response.getWriter().append("Served at: ").append(request.getContextPath());
   }
   
   
   
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}