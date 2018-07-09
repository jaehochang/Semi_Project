package kh.web.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.web.dao.MemberDAO;
import kh.web.dao.TagDAO;
import kh.web.dto.TagDTO;

@WebServlet("*.interests")
public class interestsController extends HttpServlet {
	Gson igson = new Gson();
	JsonObject ijson = new JsonObject();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getSession().getAttribute("checkedList") == null) {
			request.getSession().setAttribute("checkedList", new HashSet<String>());
		}

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");

		System.out.println("-------------------------------------");
		System.out.println(command);
		MemberDAO dao = new MemberDAO();
		TagDAO tdao = new TagDAO();
		boolean isRedirect = true;
		String dst = null;

		if (command.equals("/modifyInterests.interests")) {

			try {
				String loginId = (String) request.getSession().getAttribute("loginId");
				System.out.println(loginId);
				String[] storedInterests = dao.printInterests(loginId).split(",");// dao에서 가져온 관심도

				System.out.println(" storedInterests : " + storedInterests);
				String searchTerm = request.getParameter("term");
				System.out.println("검색 단어 = " + searchTerm);
				TagDTO result = tdao.printTag(searchTerm);
				if (result != null) {

					String words = result.getTag_category_words();
					if (words == null) {
						new Gson().toJson(ijson, response.getWriter());
						return;
					}

					String[] printInterests = words.split(","); // 검색단어로 뿌리는 관심도

					JsonArray checkedList = new JsonArray();
					JsonArray uncheckedList = new JsonArray();

					/* Set<String> dbCheckedList = (HashSet) session.getAttribute("checkedList"); */

					for (String tmp : storedInterests) {
						
						if(tmp.equals("null") || tmp.equals("")) {
							checkedList.add(tmp);
							System.out.println("tmp : " + tmp);
						}
					}
					Set<String> sessionCheckedList = (HashSet) session.getAttribute("checkedList");

					for (String uncheckedTmp : printInterests) {

						if (!sessionCheckedList.contains(uncheckedTmp)) {
							uncheckedList.add(uncheckedTmp);
						}

					}
					for (String tmp : sessionCheckedList) {
						checkedList.add(tmp);
					}

					ijson.add("checkedList", checkedList);
					ijson.add("uncheckedList", uncheckedList);
					new Gson().toJson(ijson, response.getWriter());
				} else {

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/checked.interests")) {
			response.setCharacterEncoding("utf8");
			response.setContentType("application/json");
			/* String loginId = (String) request.getSession().getAttribute("loginId"); */
			String word = request.getParameter("checkedBox");

			
			
			Set<String> checkedList = (HashSet<String>) session.getAttribute("checkedList");
			checkedList.add(word);

			/* String[] storedInterests = dao.printInterests(loginId).split(","); */

			/*
			 * for(String tmp:storedInterests) { checkedList.add(tmp); }
			 */

			
			
			
		} else if (command.equals("/unchecked.interests")) {
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

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}