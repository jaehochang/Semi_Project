package kh.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.web.dao.TagDAO;
import kh.web.dto.TagDTO;

@WebServlet("*.autocomplete")
public class TagController extends HttpServlet {

	Gson gson = new Gson();
	JsonObject json = new JsonObject();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getSession().getAttribute("checkedList") == null) {
			request.getSession().setAttribute("checkedList", new HashSet<String>());
		}

		response.setCharacterEncoding("utf8");
		HttpSession session = request.getSession();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println(command);
		boolean isRedirect = true;
		String dst = null;
		PrintWriter out = response.getWriter();
		TagDAO tagdao = new TagDAO();
		String ajax = null;
		if (command.equals("/tag.autocomplete")) {
			try {
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");

				String searchterm = request.getParameter("term");
				System.out.println("검색어 : " + searchterm);
				TagDTO result = tagdao.printTag(searchterm);
				if (result != null) {
					String words = result.getTag_category_words();
					if (words == null) {
						new Gson().toJson(json, response.getWriter());
						return;
					}
					String[] wordsArray = words.split(",");
					JsonArray uncheckedList = new JsonArray();
					JsonArray checkedList = new JsonArray();

					// wordsArray 안에 있는 내용이 checkedList(Session) 에 겹치는걸 제외하고 unchecked에 넣는다.

					Set<String> sessionCheckedList = (HashSet) session.getAttribute("checkedList");
					for (String tmp : wordsArray) {
						if (!sessionCheckedList.contains(tmp)) {
							uncheckedList.add(tmp);
						}
					}

					for (String tmp : sessionCheckedList) {
						checkedList.add(tmp);
					}

					json.add("checkedList", checkedList);
					json.add("uncheckedList", uncheckedList);

					new Gson().toJson(json, response.getWriter());
				} else {
					System.out.println("검색 결과가 없습니다.");
					out.println(searchterm + "검색 결과가 없습니다.");

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/checked.autocomplete")) {
			response.setCharacterEncoding("utf8");
			response.setContentType("application/json");
			String word = request.getParameter("checkedBox");

			Set<String> checkedList = (HashSet<String>) session.getAttribute("checkedList");
			checkedList.add(word);

		} else if (command.equals("/unchecked.autocomplete")) {

			String uncheckedterm = request.getParameter("uncheckedBox");

			Set<String> checkedList = (HashSet) session.getAttribute("checkedList");
			checkedList.remove(uncheckedterm);
			System.out.println("삭제된용어 : " + uncheckedterm);

			String[] removeallTerm = request.getParameterValues("removeallTerm");
			if (removeallTerm == null) {
				return;
			}
			for (String tmp : removeallTerm) {
				checkedList.remove(tmp);
			}

		}

		/*if (isRedirect == false) {
			System.out.println("값test");
			RequestDispatcher rd = request.getRequestDispatcher(dst);
			rd.forward(request, response);

		} else if (ajax.equals("ajax")) {
           
		}else{
			
			response.sendRedirect(dst);
		}*/
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
