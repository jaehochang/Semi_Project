package kh.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.web.dao.FilesDAO;


@WebServlet("*.file")
public class FileController extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      try {
         String requestURI = request.getRequestURI();
         String contextPath = request.getContextPath();
         String command = requestURI.substring(contextPath.length());
         
         System.out.println(command);
         
         FilesDAO filesDAO = new FilesDAO();
         
         boolean isRedirect = true;
         String dst = null;
         String ajax = null;

         if(command.equals("/upload.file")) {
        	 
        	String groupSeq = request.getParameter("group_seq");
        	int group_seq = Integer.parseInt(groupSeq);
        	 
            request.setCharacterEncoding("UTF-8");

            String realPath = request.getServletContext().getRealPath("/files/");

            System.out.println(realPath);
            //System.out.println(request.getServletContext());
            
            File f = new File(realPath);
            if(!f.exists()){
               f.mkdir();
            }

            int maxSize = 1024 * 1024 * 100;
            String enc = "utf8";

            MultipartRequest mr = new MultipartRequest(request, realPath, maxSize, enc,new DefaultFileRenamePolicy());
            
            Enumeration<String> names = mr.getFileNames();
            
            System.out.println(11);
            int fileResult=0;
            
            if(names != null){
               while(names.hasMoreElements()){
                  String paramName = names.nextElement();
                  String originalName = mr.getOriginalFileName(paramName);
                  String systemName = mr.getFilesystemName(paramName);

                  System.out.println(22);
                  
                  if(originalName != null){
                     try {
                        
                        System.out.println(33);
                        fileResult = filesDAO.groupMainPic(systemName,group_seq);
                        request.setAttribute("systemName", systemName);
                        
                     } catch (Exception e) {
                        e.printStackTrace();
                     }
                  }
               }
            }
            
            request.setAttribute("fileResult", fileResult);
            
            
            isRedirect = false;
            dst = "file.jsp";
            
            
         }else if(command.equals("/test.file")) {
        	 String systemName = request.getParameter("value");
        	System.out.println(systemName);
        	
        	
			String realPath = request.getServletContext().getRealPath("files");
			String fullPath = "files/" + systemName;
			
			System.out.println(fullPath);
			
			
			JSONObject json = new JSONObject();
			
			String html = "<img src= '"+fullPath+"'>";
			
			System.out.println(html);
			
			json.put("html", html);
			
			response.setCharacterEncoding("utf8");
			response.setContentType("application/json");
			
			response.getWriter().print(json);
			response.getWriter().flush();
			response.getWriter().close();
			
        	
        	isRedirect = true;
        	ajax = "ajax";
         }
         
         //-----------------------------
         
         if(isRedirect == false) {
            RequestDispatcher rd = request.getRequestDispatcher(dst);
            rd.forward(request, response);
         }else if(isRedirect == true) {
        	 if(ajax.equals("ajax")) {
					System.out.println("ajax성공");
				}else {
					response.sendRedirect(dst);
				}
         }
         
      }catch(Exception e) {
         
      }
   }


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}