package kh.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import kh.web.dto.GroupDTO;
import kh.web.dto.GroupMemberDTO;
import kh.web.dto.MemberDTO;
import kh.web.dto.ReportDTO;

@WebServlet("*.ao")
public class AdminController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());

			response.setCharacterEncoding("utf8");
			PrintWriter out = response.getWriter();

			System.out.println("get : " + command);

			AdminDAO adao = new AdminDAO();

			boolean isRedirect = true;
			String dst = null;

			String adminId = (String) request.getSession().getAttribute("adminId");
			System.out.println("adminId: " + adminId);
			if (adminId == null) {
				isRedirect = false;
				dst = "loginForm.jsp";
			} else {
				if (command.equals("/admin/login.ao")) {
					isRedirect = false;
					dst = "loginForm.jsp";

				} else if (command.equals("/admin/logout.ao")) {
					request.getSession().invalidate();
					isRedirect = false;
					dst = "login.ao";
				} else if (command.equals("/admin/main.ao")) {
					isRedirect = false;
					dst = "index.jsp";

				} else if (command.equals("/admin/member.ao")) {
					String text = request.getParameter("text");
					String subject = request.getParameter("subject");

					System.out.println("controller-text: " + text);
					System.out.println("controller-subject: " + subject);
					int currentPage = 0;
					String currentPageString = request.getParameter("currentPage");
					if (currentPageString == null) {
						currentPage = 1;
					} else {
						currentPage = Integer.parseInt(currentPageString);
					}
					List<MemberDTO> list = adao.memberList(currentPage * 10 - 9, currentPage * 10, subject, text);

					String page = adao.getMemberPageNavi(currentPage, subject, text);

					request.setAttribute("list", list);
					request.setAttribute("page", page);

					isRedirect = false;
					dst = "member/member.jsp";

				} else if (command.equals("/admin/meetup.ao")) {
					isRedirect = false;
					dst = "meetup/meetup.jsp";

				} else if (command.equals("/admin/group.ao")) {
					String text = request.getParameter("text");
					String subject = request.getParameter("subject");

					System.out.println("controller-text: " + text);
					System.out.println("controller-subject: " + subject);
					int currentPage = 0;
					String currentPageString = request.getParameter("currentPage");
					if (currentPageString == null) {
						currentPage = 1;
					} else {
						currentPage = Integer.parseInt(currentPageString);
					}

					List<GroupDTO> list = adao.allGroupList(currentPage * 10 - 9, currentPage * 10, subject, text);
					String page = adao.getGroupPageNavi(currentPage, subject, text);

					request.setAttribute("list", list);
					request.setAttribute("page", page);

					isRedirect = false;
					dst = "group/group.jsp";

				} else if (command.equals("/admin/memberpage.ao")) {
					String member_email = request.getParameter("member_email");
					int state = Integer.parseInt(request.getParameter("state"));
					System.out.println("state:"+state);
					if (state == 0) {
						adao.modifyReportState(0, member_email, 0);
					}
					
					System.out.println("memberpage:" + member_email);

					MemberDTO mdto = adao.getMember(member_email);

					Map<String, Object> map = adao.memGroupMemJoin(mdto.getMember_name());
					List mlist = (List) map.get("mlist");
					List gmlist = (List) map.get("gmlist");

					System.out.println("map 출력: " + mlist.get(0));
					System.out.println("map 출력: " + gmlist.get(0));

					MemberDTO mlistdto = (MemberDTO) mlist.get(0);
					GroupMemberDTO gmlistdto = (GroupMemberDTO) gmlist.get(0);

					System.out.println("mlistdto:" + mlistdto.getMember_interests());
					System.out.println("gmlistdto:" + gmlistdto.getGroup_name());

					request.setAttribute("mdto", mdto);
					request.setAttribute("mlistdto", mlistdto);
					request.setAttribute("gmlistdto", gmlistdto);

					isRedirect = false;
					dst = "member/memberpage.jsp";

				} else if (command.equals("/admin/grouppage.ao")) {
					int group_seq = Integer.parseInt(request.getParameter("group_seq"));
					int state = Integer.parseInt(request.getParameter("state"));

					GroupDTO gdto = new GroupDTO();
					gdto = adao.getGroupData(group_seq);
					List<GroupMemberDTO> list = new ArrayList<>();
					list = adao.getGroupMember(group_seq);
					int size = list.size();
					System.out.println("groupmember_size: " + list.size());

					if (state == 1) {
						adao.modifyReportState(1, "", group_seq);
					}

					request.setAttribute("size", size);
					request.setAttribute("gdto", gdto);

					isRedirect = false;
					dst = "group/grouppage.jsp?group_seq='" + group_seq + "'";

				} else if (command.equals("/admin/report.ao")) {
					isRedirect = false;
					dst = "memberreport.ao";

				} else if (command.equals("/admin/memberreport.ao")) {
					List<ReportDTO> list = new ArrayList<>();
					list = adao.getAllReport(0);
					request.setAttribute("list", list);

					isRedirect = false;
					dst = "report/memberreport.jsp";

				} else if (command.equals("/admin/groupreport.ao")) {
					List<ReportDTO> list = new ArrayList<>();
					list = adao.getAllGroupReport(1);
					request.setAttribute("list", list);

					isRedirect = false;
					dst = "report/groupreport.jsp";

				} else if (command.equals("/admin/meetupreport.ao")) {
					List<ReportDTO> list = new ArrayList<>();
					list = adao.getAllReport(2);
					request.setAttribute("list", list);

					isRedirect = false;
					dst = "report/meetupreport.jsp";

				} else if (command.equals("/admin/warning.ao")) {
					JSONObject json = new JSONObject();

					if (request.getParameter("distinction").equals("member")) {
						System.out.println("memberwarning");
						String member_email = request.getParameter("member_email");

						int result = adao.plusMemberWarningNumber(member_email);
						MemberDTO mdto = adao.getMember(member_email);

						String warningdate = mdto.getMember_warningdate();
						String expiredate = mdto.getMember_expiredate();
						int warningnumber = mdto.getMember_warningnumber();
						int betweendate = mdto.getMember_betweendate();

						if (result > 0) {
							json.put("betweendate", betweendate);
							json.put("warningnumber", warningnumber);
							json.put("warningdate", warningdate);
							json.put("expiredate", expiredate);
						}

					} else if (request.getParameter("distinction").equals("group")) {
						System.out.println("groupwarning");
						int group_seq = Integer.parseInt(request.getParameter("group_seq"));

						int result = adao.plusGroupWarningNumber(group_seq);
						GroupDTO gdto = adao.getGroupData(group_seq);

						String warningdate = gdto.getGroup_warningdate();
						String expiredate = gdto.getGroup_expiredate();
						int warningnumber = gdto.getGroup_warningnumber();
						int betweendate = gdto.getGroup_betweendate();

						if (result > 0) {
							json.put("betweendate", betweendate);
							json.put("warningnumber", warningnumber);
							json.put("warningdate", warningdate);
							json.put("expiredate", expiredate);
						}
					}

					response.setCharacterEncoding("UTF-8");
					response.setContentType("application/json");

					response.getWriter().print(json);
					response.getWriter().flush();
					response.getWriter().close();

				} else if (command.equals("/admin/search.ao")) {
					String subject = request.getParameter("subject");
					String text = request.getParameter("text");

					System.out.println("subject : " + subject);
					System.out.println("text : " + text);
					List<MemberDTO> mlist = new ArrayList<>();
					List<GroupDTO> glist = new ArrayList<>();

					if (request.getParameter("distinction").equals("member")) {
						int currentPage = 0;
						String currentPageString = request.getParameter("currentPage");

						if (currentPageString == null) {
							currentPage = 1;
						} else {
							currentPage = Integer.parseInt(currentPageString);
						}
						System.out.println("currentpage: " + currentPage);
						System.out.println("currentpageString: " + currentPageString);

						if (text.equals("")) {
							mlist = adao.memberList(currentPage * 10 - 9, currentPage * 10, subject, text);
						} else {
							mlist = adao.searchMemberList(currentPage * 10 - 9, currentPage * 10, subject, text);
						}

						System.out.println("list.size(): " + mlist.size());
						String page = adao.getMemberPageNavi(currentPage, subject, text);

						for (int i = 0; i < mlist.size(); i++) {
							System.out.println("controller-search.ao:" + mlist.get(i).getMember_email());
						}
						System.out.println("controller-page:" + page);
						response.setContentType("application/json");
						response.setCharacterEncoding("UTF-8");

						Map<String, Object> map = new HashMap<>();
						map.put("mlist", mlist);
						map.put("page", page);

						new Gson().toJson(map, response.getWriter());

					} else if (request.getParameter("distinction").equals("group")) {
						int currentPage = 0;
						String currentPageString = request.getParameter("currentPage");

						if (currentPageString == null) {
							currentPage = 1;
						} else {
							currentPage = Integer.parseInt(currentPageString);
						}
						System.out.println("currentpage: " + currentPage);
						System.out.println("currentpageString: " + currentPageString);

						if (text.equals("")) {
							glist = adao.allGroupList(currentPage * 10 - 9, currentPage * 10, subject, text);
						} else {
							glist = adao.searchGroupList(currentPage * 10 - 9, currentPage * 10, subject, text);
						}

						System.out.println("list.size(): " + mlist.size());
						String page = adao.getGroupPageNavi(currentPage, subject, text);

						for (int i = 0; i < glist.size(); i++) {
							System.out.println("controller-search.ao:" + glist.get(i).getGroup_name());
						}
						System.out.println("controller-page:" + page);
						response.setContentType("application/json");
						response.setCharacterEncoding("UTF-8");

						Map<String, Object> map = new HashMap<>();
						map.put("glist", glist);
						map.put("page", page);

						new Gson().toJson(map, response.getWriter());
					}
				}

			}

			if (isRedirect == false) {
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			} else {
				// response.sendRedirect(dst);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// response.sendRedirect("error.html");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			request.setCharacterEncoding("UTF-8");

			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());

			response.setCharacterEncoding("utf8");
			PrintWriter out = response.getWriter();

			System.out.println("post : " + command);

			AdminDAO adao = new AdminDAO();
			boolean isRedirect = true;
			String dst = null;

			if (command.equals("/admin/login.ao")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				System.out.println("id : " + id);
				System.out.println("pw : " + pw);
				boolean result = adao.loginAdmin(id, pw);
				System.out.println(result);

				if (result) {
					request.getSession().setAttribute("adminId", id);
					isRedirect = false;
					dst = "index.jsp";
				} else {
					isRedirect = true;
					dst = "loginForm.jsp";
				}
			}

			if (isRedirect == false) {
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			} else {
				response.sendRedirect(dst);
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}

	}

}
