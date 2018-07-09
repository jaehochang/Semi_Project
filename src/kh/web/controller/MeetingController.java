
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
import kh.web.dao.GroupDAO;
import kh.web.dao.MeetingDAO;
import kh.web.dto.AttendDTO;
import kh.web.dto.GroupDTO;
import kh.web.dto.MeetingDTO;
import kh.web.dto.ShowMeetingDTO;

/**
 * Servlet implementation class GroupController
 */
@WebServlet("*.meet")
public class MeetingController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());

			System.out.println(command);

			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("utf8");
			GroupDAO gdao = new GroupDAO();
			MeetingDAO dao = new MeetingDAO();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
			MeetingDAO mdao = new MeetingDAO();
			AttendDAO adao = new AttendDAO();
			boolean isRedirect = true;
			String dst = null;
			boolean isajax = false;

			if (command.equals("/main.meet")) {
				List<MeetingDTO> result = mdao.getMeetingData();
				request.setAttribute("result", result);
				isRedirect = false;

				if (request.getSession().getAttribute("loginId") != null) {
					dst = "list.group";
				} else {
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
				request.setAttribute("result_countAttendMembers", result_countAttendMembers + result_countWithPeople);
				request.setAttribute("result_areYouAttend", result_areYouAttend);
				isRedirect = false;
				dst = "meeting.jsp";

			} else if (command.equals("/newmeetingform.meet")) {
				int group_seq = Integer.parseInt(request.getParameter("group_seq"));
				System.out.println(group_seq);
				request.setAttribute("group_seq", group_seq);

				isajax = false;
				isRedirect = false;
				dst = "newmeetingform.jsp";

			} else if (command.equals("/newmeeting.meet")) {
				System.out.println("in newmeeting.meet");
				GroupDTO gdto = new GroupDTO();
				MeetingDTO mdto = new MeetingDTO();
				String member_email = (String) request.getSession().getAttribute("loginId");
				int group_seq = Integer.parseInt(request.getParameter("group_seq"));
				System.out.println(member_email);
				System.out.println(group_seq);
				String meeting_title = request.getParameter("sub2_textarea");
				String meeting_contents = request.getParameter("sub5_textarea");
				String meeting_location = request.getParameter("loc");
				String meeting_latlng = request.getParameter("latlng");
				String meeting_start_time = request.getParameter("start");
				String meeting_end_time = request.getParameter("end");
				// 지혜야 그림파일 넣어라
				String meeting_picture = "default.jpg";

				System.out.println("newmeeting.meet:");
				System.out.println(meeting_title);
				System.out.println(meeting_contents);
				System.out.println(meeting_location);
				System.out.println(meeting_latlng);
				System.out.println(meeting_start_time);
				System.out.println(meeting_end_time);

				String meeting_lat = meeting_latlng.split(",")[0];
				String meeting_lng = meeting_latlng.split(",")[1];
				meeting_lat = meeting_lat.substring(1);
				meeting_lng = meeting_lng.substring(1, 11);
				System.out.println(meeting_lat);
				System.out.println(meeting_lng);

				String[] startArr = meeting_start_time.split("/");
				String[] endArr = meeting_end_time.split("/");
				String start = startArr[0] + startArr[1] + startArr[2] + startArr[3] + startArr[4];
				String end = endArr[0] + endArr[1] + endArr[2] + endArr[3] + endArr[4];
				System.out.println("start:" + start);
				System.out.println("end:" + end);

				SimpleDateFormat simpleFullDateFormat = new SimpleDateFormat("yyyyMMddHHmm");

				Date startDate = simpleFullDateFormat.parse(start);
				Date endDate = simpleFullDateFormat.parse(end);
				System.out.println(startDate);
				System.out.println(endDate);

				gdto = gdao.getGroupData(group_seq);
				mdto.setGroup_seq(group_seq);
				mdto.setGroup_name(gdto.getGroup_name());
				mdto.setGroup_leader(gdto.getGroup_name());
				mdto.setMeeting_title(meeting_title);
				mdto.setMeeting_contents(meeting_contents);
				mdto.setMeeting_lat(meeting_lat);
				mdto.setMeeting_lng(meeting_lng);
				mdto.setMeeting_location(meeting_location);
				mdto.setMeeting_picture(meeting_picture);
				mdto.setMeeting_start_time(startDate);
				mdto.setMeeting_end_time(endDate);
				mdto.setMember_email(member_email);

				int result = dao.insertNewMeeting(mdto);

				isRedirect = false;
				dst = "groupMain.group?group_seq=" + group_seq + "&page=info";

			} else if (command.equals("/modifyMeetingForm.meet")) {
//				int meeting_seq = Integer.parseInt(request.getParameter("meeting_seq"));
				MeetingDTO mdto = dao.getEachMeetingData(1);
				request.setAttribute("mdto", mdto);
				
				isRedirect=false;
				dst = "modifyMeetingForm.jsp";
			}else if(command.equals("/modifyMeeting.meet")) {
				System.out.println("in newmeeting.meet");
				GroupDTO gdto = new GroupDTO();
				MeetingDTO mdto = new MeetingDTO();
				String member_email = (String) request.getSession().getAttribute("loginId");
				int group_seq = Integer.parseInt(request.getParameter("group_seq"));
				System.out.println(member_email);
				System.out.println(group_seq);
				String meeting_title = request.getParameter("sub2_textarea");
				String meeting_contents = request.getParameter("sub5_textarea");
				String meeting_location = request.getParameter("loc");
				String meeting_latlng = request.getParameter("latlng");
				String meeting_start_time = request.getParameter("start");
				String meeting_end_time = request.getParameter("end");
				// 지혜야 그림파일 넣어라
				String meeting_picture = "default.jpg";

				System.out.println("newmeeting.meet:");
				System.out.println(meeting_title);
				System.out.println(meeting_contents);
				System.out.println(meeting_location);
				System.out.println(meeting_latlng);
				System.out.println(meeting_start_time);
				System.out.println(meeting_end_time);

				String meeting_lat = meeting_latlng.split(",")[0];
				String meeting_lng = meeting_latlng.split(",")[1];
				meeting_lat = meeting_lat.substring(1);
				meeting_lng = meeting_lng.substring(1, 11);
				System.out.println(meeting_lat);
				System.out.println(meeting_lng);

				String[] startArr = meeting_start_time.split("/");
				String[] endArr = meeting_end_time.split("/");
				String start = startArr[0] + startArr[1] + startArr[2] + startArr[3] + startArr[4];
				String end = endArr[0] + endArr[1] + endArr[2] + endArr[3] + endArr[4];
				System.out.println("start:" + start);
				System.out.println("end:" + end);

				SimpleDateFormat simpleFullDateFormat = new SimpleDateFormat("yyyyMMddHHmm");

				Date startDate = simpleFullDateFormat.parse(start);
				Date endDate = simpleFullDateFormat.parse(end);
				System.out.println(startDate);
				System.out.println(endDate);

				gdto = gdao.getGroupData(group_seq);
				mdto.setGroup_seq(group_seq);
				mdto.setGroup_name(gdto.getGroup_name());
				mdto.setGroup_leader(gdto.getGroup_name());
				mdto.setMeeting_title(meeting_title);
				mdto.setMeeting_contents(meeting_contents);
				mdto.setMeeting_lat(meeting_lat);
				mdto.setMeeting_lng(meeting_lng);
				mdto.setMeeting_location(meeting_location);
				mdto.setMeeting_picture(meeting_picture);
				mdto.setMeeting_start_time(startDate);
				mdto.setMeeting_end_time(endDate);
				mdto.setMember_email(member_email);

//				int result = dao.insertNewMeeting(mdto);

				isRedirect = false;
				dst = "groupMain.group?group_seq=" + group_seq + "&page=info";
			}

			else if (command.equals("/attend.meet")) {
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
				dst = "meeting.meet?seq=" + meeting_seq;
			} else if (command.equals("/attendCancel.meet")) {
				int meeting_seq = Integer.parseInt(request.getParameter("meeting_seq"));
				String member_email = (String) request.getSession().getAttribute("loginId");
				int result = adao.deleteAttendMember(meeting_seq, member_email);
				if (result != 0) {
					System.out.println("참석 취소 성공");
				}
				isRedirect = false;
				dst = "meeting.meet?seq=" + meeting_seq;

			} else if (command.equals("/calendarchoice.meet")) {
				try {
					JSONArray jarray = new JSONArray();
					response.setCharacterEncoding("utf8");
					response.setContentType("application/json");
					String value = request.getParameter("val");
					System.out.println(value);
					String[] datecase = value.split("/");
					String alldata = null;
					String year = datecase[0];
					String month = datecase[1];
					String day = datecase[2];
					for (int i = 0; i < datecase.length; i++) {
						if (i == 0) {
							alldata = datecase[i];
						} else {
							alldata += datecase[i];
						}
					}
					Date tempDate = simpleDateFormat.parse(alldata);
					System.out.println(tempDate);
					List<ShowMeetingDTO> showlist = mdao.selectMeet(tempDate);
					isajax = true;
					for (int i = 0; i < showlist.size(); i++) {
						JSONObject json = new JSONObject();
						json.put("date", showlist.get(i).getDat_month());
						json.put("hour", showlist.get(i).getHour_minut());
						json.put("groupName", showlist.get(i).getGroup_name());
						json.put("groupTitle", showlist.get(i).getMeeting_title());
						json.put("location", showlist.get(i).getMeeting_location());
						jarray.add(json);
					}

					// request.setAttribute("showlist", showlist);
					// System.out.println(jarray);
					System.out.println(jarray);
					new Gson().toJson(jarray, response.getWriter());
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (command.equals("/calendarfirst.meet")) {
				JSONArray jarray = new JSONArray();
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
				String value = request.getParameter("val");
				System.out.println(value);
				String[] datecase = value.split("/");
				String alldata = null;
				String year = datecase[0];
				String month = datecase[1];
				String day = datecase[2];
				for (int i = 0; i < datecase.length; i++) {
					if (i == 0) {
						alldata = datecase[i];
					} else {
						alldata += datecase[i];
					}
				}
				Date tempDate = simpleDateFormat.parse(alldata);
				System.out.println(tempDate);
				List<ShowMeetingDTO> showlist = mdao.selectMeet(tempDate);
				isajax = true;
				for (int i = 0; i < showlist.size(); i++) {
					JSONObject json = new JSONObject();
					json.put("date", showlist.get(i).getDat_month());
					json.put("hour", showlist.get(i).getHour_minut());
					json.put("groupName", showlist.get(i).getGroup_name());
					json.put("groupTitle", showlist.get(i).getMeeting_title());
					json.put("location", showlist.get(i).getMeeting_location());
					jarray.add(json);
				}

				// request.setAttribute("showlist", showlist);
				// System.out.println(jarray);
				System.out.println(jarray);
				new Gson().toJson(jarray, response.getWriter());
			} else if (command.equals("/recommend.meet")) {
				JSONArray jarray = new JSONArray();
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");

			} else if (command.equals("/mymeet.meet")) {
				JSONArray jarray = new JSONArray();
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");

			} else if (command.equals("/checkup.meet")) {
				JSONArray jarray = new JSONArray();
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
			} else if (command.equals("/updatebasic.meet")) {

			}

			if (isajax) {

			} else {

				if (isRedirect) {
					response.sendRedirect(dst);
				} else {
					RequestDispatcher rd = request.getRequestDispatcher(dst);
					rd.forward(request, response);
				}
				// response.getWriter().append("Served at: ").append(request.getContextPath());

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