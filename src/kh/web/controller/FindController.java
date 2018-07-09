package kh.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.dao.GroupDAO;
import kh.web.dao.MemberDAO;
import kh.web.dto.GroupDTO;


@WebServlet("*.find")
public class FindController extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      try {
         String requestURI = request.getRequestURI();
         String contextPath = request.getContextPath();
         String command = requestURI.substring(contextPath.length());

         response.setCharacterEncoding("utf8");
         PrintWriter out = response.getWriter();

         System.out.println(command);
         GroupDAO dao = new GroupDAO();
         boolean isRedirect = true;
         String dst = null;
         
         if(command.equals("/tech.find")) {
            String keyword = request.getParameter("keyword");
            System.out.println(keyword);
            
            List<GroupDTO> findGroupList = dao.findGroupList(keyword);
            
            request.setAttribute("findGroupList", findGroupList);
            
            System.out.println(findGroupList.size());
            
            isRedirect=false;
            dst="findGroup.jsp";
         }
         
         
         
         
         if(isRedirect == false) {
               RequestDispatcher rd = request.getRequestDispatcher(dst);
               rd.forward(request, response);
            }else if(isRedirect == true) {
            response.sendRedirect(dst);
               
            }
      }catch(Exception e) {
         
      }
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}