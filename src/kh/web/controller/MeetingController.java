         
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
            String member_email = (String) request.getSession().getAttribute("loginId");
            
            MeetingDTO result = mdao.getEachMeetingData(meeting_seq);
            List<AttendDTO> result_attend = adao.getAttendMembers(meeting_seq);
            
            int result_countAttendMembers = mdao.countAttendMembers(meeting_seq);
            int result_countWithPeople = mdao.countWithPeople(meeting_seq);
            
            boolean result_areYouAttend = adao.areYouAttend(meeting_seq, member_email);
            
            
            request.setAttribute("result", result);
            request.setAttribute("result_attend", result_attend);
            request.setAttribute("result_countAttendMembers", result_countAttendMembers+result_countWithPeople);
            request.setAttribute("result_areYouAttend", result_areYouAttend);
            isRedirect = false;
            dst = "meeting.jsp";
         } else if (command.equals("/attend.meet")) {
            int meeting_seq = Integer.parseInt(request.getParameter("meeting_seq"));
            String member_email = (String) request.getSession().getAttribute("loginId");
            int people = Integer.parseInt(request.getParameter("people"));
            
            boolean result_areYouAttend = adao.areYouAttend(meeting_seq, member_email);
            
            if (result_areYouAttend == false) {
               int result = adao.addAttendMember(meeting_seq, member_email, people);
            } else {
               System.out.println("이미 가입되어있습니다. ");
            }
            
            isRedirect = false;
            dst = "meeting.meet?seq="+meeting_seq;
         } else if (command.equals("/attendCancel.meet")) {
            int meeting_seq = Integer.parseInt(request.getParameter("meeting_seq"));
             String member_email = (String) request.getSession().getAttribute("loginId");
             int result = adao.deleteAttendMember(meeting_seq, member_email);
             if(result!=0) {
                System.out.println("참석 취소 성공");
             }
             isRedirect = false;
             dst = "meeting.meet?seq="+meeting_seq;
                
         } else if (command.equals("/attendMember.meet")) {
        	 int meeting_seq = Integer.parseInt(request.getParameter("meeting_seq"));
        	 String result_group_name = mdao.groupName(meeting_seq);
        	 List<AttendDTO> result = mdao.getAttendData(meeting_seq);
        	 
        	 int result_countAttendMembers = mdao.countAttendMembers(meeting_seq);
             int result_countWithPeople = mdao.countWithPeople(meeting_seq);
        	 
             // 그룹 이름
        	 request.setAttribute("result_group_name", result_group_name);
        	 // 참석하는 명단 받아오는 list
        	 request.setAttribute("result", result);
        	 // 총 참석자 (참석인 + 데리고오는 사람)
        	 request.setAttribute("result_countAttendMembers", result_countAttendMembers+result_countWithPeople);
        	 
        	 isRedirect = false;
        	 dst = "meeting_member_list.jsp";
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