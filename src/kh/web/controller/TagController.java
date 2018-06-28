package kh.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.dao.TagDAO;
import kh.web.dto.TagDTO;

@WebServlet("*.autocomplete")
public class TagController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		StringBuilder sb = new StringBuilder();
		PrintWriter out = response.getWriter();
		TagDAO tagdao = new TagDAO();
		String term = request.getParameter("term");
		if (command.equals("/tag.autocomplete")) {

			try {
				
				TagDTO result = tagdao.printTag(term);
              
				if(result!=null) {
				System.out.println("가져온것:"+result.getTag_category_words());
				
				String words=result.getTag_category_words();
				String[] wordsArray= words.split(",");
				List<String> listArray = new ArrayList<>();

				for(int i=0;i<wordsArray.length;i++) {
					listArray.add(wordsArray[i]);
				}
				
				for(int i=0;i<listArray.size();i++) {
					System.out.println(i + "TagCheck 단어들 > " + listArray.get(i));
					out.println("<label for=\"" + "tag" + i + "\" id=\"label" + i + "\"class=\"btn btn-default\">"
							+ "<input id=\"tag" + i + "\" type=\"checkbox\" class=\"badgebox\" name=\"check\" value=\""
							+ listArray.get(i) + "\" onclick=bindAction() >" + listArray.get(i)
							+ "<span class=\"badge\">&check;</span></label>");
				}
				
				
				}else {
					out.println(term+"검색 결과가 없습니다.");
					
				}
                
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
