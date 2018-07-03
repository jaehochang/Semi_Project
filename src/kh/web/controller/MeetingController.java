         
package kh.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.dao.AttendDAO;
import kh.web.dao.MeetingDAO;
import kh.web.dto.AttendDTO;
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
         
         MeetingDAO mdao = new MeetingDAO();
         AttendDAO adao = new AttendDAO();
         boolean isRedirect = true;
         String dst = null;
         
         if(command.equals("/main.meet")) {
            List<MeetingDTO> result = mdao.getMeetingData();
            request.setAttribute("result", result);
            isRedirect = false;
            
            if(request.getSession().getAttribute("loginId") != null) {
               dst = "list.group";
            }else {
               dst = "main.jsp";
            }
            
         } else if (command.equals("/meeting.meet")) {
            int meeting_seq = Integer.parseInt(request.getParameter("seq"));
            MeetingDTO result = mdao.getEachMeetingData(meeting_seq);
            List<AttendDTO> result_attend = adao.getAttendMembers(meeting_seq);
            int result_countAttendMembers = mdao.countAttendMembers(meeting_seq);
            
            request.setAttribute("result", result);
            request.setAttribute("result_attend", result_attend);
            request.setAttribute("result_countAttendMembers", result_countAttendMembers);
            isRedirect = false;
            dst = "meeting.jsp";
         } else if (command.equals("/attend.meet")) {
            int meeting_seq = Integer.parseInt(request.getParameter("meeting_seq"));
            String member_email = (String) request.getSession().getAttribute("loginId");
            int result = adao.addAttendMember(meeting_seq, member_email);
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