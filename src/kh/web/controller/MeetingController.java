         
package kh.web.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import kh.web.dao.AttendDAO;
import kh.web.dao.MeetingDAO;
import kh.web.dto.AttendDTO;
import kh.web.dto.MeetingDTO;
import kh.web.dto.ShowMeetingDTO;

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
         SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
					"yyyyMMdd");
         MeetingDAO mdao = new MeetingDAO();
         AttendDAO adao = new AttendDAO();
         boolean isRedirect = true;
         String dst = null;
		 boolean isajax = false;
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
         }else if(command.equals("/calendarchoice.meet")) {
				try {
					JSONArray jarray =new JSONArray();
					response.setCharacterEncoding("utf8");
					response.setContentType("application/json");
					String value = request.getParameter("val"); 
					System.out.println(value);
					String[] datecase = value.split("/");
					String alldata = null;
					String year = datecase[0];
					String month = datecase[1];
					String day = datecase[2];
					for(int i=0;i<datecase.length;i++) {
						if(i==0) {
							alldata = datecase[i];
						}else {
							alldata += datecase[i];
						}
					}
					Date tempDate = simpleDateFormat.parse(alldata);
					System.out.println(tempDate);
					List<ShowMeetingDTO> showlist = mdao.selectMeet(tempDate);
					isajax = true;
					for(int i=0;i<showlist.size();i++) {
						JSONObject json = new JSONObject();
						json.put("date", showlist.get(i).getDat_month());
						json.put("hour", showlist.get(i).getHour_minut());
						json.put("groupName", showlist.get(i).getGroup_name());
						json.put("groupTitle", showlist.get(i).getMeeting_title());
						json.put("location", showlist.get(i).getMeeting_location());
						jarray.add(json);
					}

					//request.setAttribute("showlist", showlist);
					//System.out.println(jarray);
					System.out.println(jarray);
					new Gson().toJson(jarray,response.getWriter());
				}catch (Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/calendarfirst.meet")) {
				JSONArray jarray =new JSONArray();
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
				Date today = new Date();
				SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
				String str = date.format(today);
				System.out.println(str);
				String[] datecase = str.split("/");
				String alldata = null;
				String year = datecase[0];
				String month = datecase[1];
				String day = datecase[2];
				for(int i=0;i<datecase.length;i++) {
					if(i==0) {
						alldata = datecase[i];
					}else {
						alldata += datecase[i];
					}
				}
				Date tempDate = simpleDateFormat.parse(alldata);
				System.out.println(tempDate);
				List<ShowMeetingDTO> showlist = mdao.selectMeet(tempDate);

				isajax = true;
				for(int i=0;i<showlist.size();i++) {
					JSONObject json = new JSONObject();
					json.put("date", showlist.get(i).getDat_month());
					json.put("hour", showlist.get(i).getHour_minut());
					json.put("groupName", showlist.get(i).getGroup_name());
					json.put("groupTitle", showlist.get(i).getMeeting_title());
					json.put("location", showlist.get(i).getMeeting_location());
					jarray.add(json);
				}

				//request.setAttribute("showlist", showlist);

				System.out.println(jarray);
				new Gson().toJson(jarray,response.getWriter());
			}else if(command.equals("/recommend.meet")) {
				JSONArray jarray =new JSONArray();
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
				
			}else if(command.equals("/mymeet.meet")) {
				JSONArray jarray =new JSONArray();
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
				
			}else if(command.equals("/checkup.meet")) {
				JSONArray jarray =new JSONArray();
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
				
			}
         
         if(isajax) {
				
			}else {
				if(isRedirect) {
					response.sendRedirect(dst);
				} 
				else {
					RequestDispatcher rd = request.getRequestDispatcher(dst);
					rd.forward(request, response);
				}
//response.getWriter().append("Served at: ").append(request.getContextPath());
		}
      
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      
      
   }
   
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}