package kh.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import kh.web.dao.TagDAO;
import kh.web.dto.TagDTO;

@WebServlet("*.autocomplete")
public class TagController extends HttpServlet {

	JsonArray checkedList = new JsonArray();
	Gson gson = new Gson();
	JsonObject json = new JsonObject();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setCharacterEncoding("utf8");
		HttpSession session = request.getSession();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		PrintWriter out = response.getWriter();
		TagDAO tagdao = new TagDAO();
		
		if (command.equals("/tag.autocomplete")) {

			try {

				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");

				String searchterm = request.getParameter("term");

				TagDTO result = tagdao.printTag(searchterm);

				if (result != null) {
					System.out.println("가져온것:" + result.getTag_category_words());

					String words = result.getTag_category_words();
					String[] wordsArray = words.split(",");
					JsonArray uncheckedList = new JsonArray();

					for (int i = 0; i < wordsArray.length; i++) {
						uncheckedList.add(wordsArray[i]);
					}

					for (int i = 0; i < uncheckedList.size(); i++) {
						System.out.println(i + "uncheckedList 단어들 > " + uncheckedList.get(i));

						/*
						 * out.println("<span class=\"button-checkbox\"><label for=\"" + "tag" + i +
						 * "\" id=\"label" + i + "\"class=\"btn btn-default\">" + "<input id=\"tag" + i
						 * + "\" type=\"checkbox\" class=\"badgebox\" name=\"check\" value=\"" +
						 * uncheckedList.get(i) +
						 * "\"  style=\"width:10;height:5;background-color:white;border:1px\" >"+
						 * uncheckedList.get(i)
						 * +"&nbsp;<span class=\"badge\">&check;</span></label></span>");
						 */

					}
					json.add("checkedList", checkedList);
					json.add("uncheckedList", uncheckedList);

					System.out.println("json : " + json);
					new Gson().toJson(json, response.getWriter());

					System.out.println("Gson : " + gson.toJson(uncheckedList));

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
			String word=request.getParameter("checkedBox");
			ArrayList<String> arr=new ArrayList<String>();
			ArrayList<String> arr2 = new ArrayList<String>();
			arr.add(word);
			
			for(int i=0;i<arr.size();i++) {
				if(!arr2.contains(arr.get(i)))
					arr2.add(arr.get(i));
			}
			
			for(int i=0;i<arr2.size();i++) {
					checkedList.add(arr2.get(i));
					System.out.println("checkedSet.get(i) : "+checkedList.get(i));
			}
			
			session.setAttribute("checkedList", checkedList);
			/*checkedList = (JsonArray) session.getAttribute("checkedList");*/
			// 동일 값 저장 안되도록 하는것 나중에 넣기
			
			for (int i = 0; i < checkedList.size(); i++) {
				System.out.println("session에 저장된 값 : " + checkedList.get(i));
			}
		} else if (command.equals("/unchecked.autocomplete")) {
			String uncheckedterm = request.getParameter("uncheckedBox");

			for (int i = 0; i < checkedList.size(); i++) {
				if (checkedList.get(i).equals(uncheckedterm)) {
					session.removeAttribute(uncheckedterm);
				}
			}

			System.out.println("삭제된용어 : " + uncheckedterm);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
