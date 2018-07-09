package kh.web.utils;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;

import javax.mail.Session;

import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import javax.mail.internet.MimeMessage;

public class PwFinder {

		public boolean PwFinder(String finderEmail, String finderPwd) {
	         
	        Properties p = System.getProperties();
	        p.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
	        p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
	        p.put("mail.smtp.auth","true");                 // gmail은 무조건 true 고정
	        p.put("mail.smtp.port", "587");                 // gmail 포트
	           
	        
	        System.out.println("finderEmail : "+ finderEmail);
	        System.out.println("finderPwd : " +finderPwd);
	        
	        if(finderPwd==null) {
	        	finderPwd="비밀번호가 정해져있지 않습니다. SNS를 통해 로그인하세요.";
	        }
	        
	        Authenticator auth = new MyAuthentication();
	         
	        //session 생성 및  MimeMessage생성
	        Session session = Session.getDefaultInstance(p, auth);
	        MimeMessage msg = new MimeMessage(session);
	         
	        try{
	            //편지보낸시간
	            msg.setSentDate(new Date());
	             
	            InternetAddress from = new InternetAddress() ;
	             
	             
	            from = new InternetAddress("meetnow<meetnow@gmail.com>");
	             
	            // 이메일 발신자
	            msg.setFrom(from);
	             
	            // 이메일 수신자
	            InternetAddress to = new InternetAddress(finderEmail);
	            msg.setRecipient(Message.RecipientType.TO, to);
	             
	            // 이메일 제목
	            msg.setSubject("MeetNow 비밀번호 찾기 ", "UTF-8");
	             
	            // 이메일 내용
	            msg.setText("비밀번호는 다음과 같습니다. : " + finderPwd, "UTF-8");
	             
	            // 이메일 헤더
	            msg.setHeader("content-Type", "text/html");
	             
	            //메일보내기
	            javax.mail.Transport.send(msg);
	             
	            return true;
	        }catch (AddressException addr_e) {
	            addr_e.printStackTrace();
	        	return false;
	        }catch (MessagingException msg_e) {
	            msg_e.printStackTrace();
	        	return false;
	        }
		
	    }
	 
	}
	 
	 
	class MyAuthentication extends Authenticator {
	      
	    PasswordAuthentication pa;
	    
	 
	    public MyAuthentication(){
	         
	        String id = "meetnow.email.finder@gmail.com";       // 구글 ID
	        String pw = "20180707";          // 구글 비밀번호
	 
	        // ID와 비밀번호를 입력한다.
	        pa = new PasswordAuthentication(id, pw);
	      
	    }
	 
	    // 시스템에서 사용하는 인증정보
	    public PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }


//		String mailProtocol = "smtp";
//
//		String mailHost = "smtp.gmail.com";
//
//		String mailPort = "587";
//
//		String mailId = "meetnow.email.finder@gmail.com"; // 구글계정
//
//		String mailPassword = "20180707"; // 구글계정 비밀번호
//
//		String fromName = "MeetNow";
//
//		String fromEmail = "meetnow.email.finder@gmail.com"; // 보내는 사람 메일
//
//		String toName = "";
//
//		String toEmail = finderEmail; // 받는사람메일
//
//		String mailTitle = "MeetNow 이메일";
//
//		String mailContents = "회원님의 회원번호는 다음과 같습니다. : " + finderPwd;
//
//		String debugMode = "false";
//
//		String authMode = "true";
//
//		try {
//
//			boolean debug = Boolean.valueOf(debugMode).booleanValue();
//
//			Properties mailProps = new Properties();
//
//			mailProps.put("mail.smtp.starttls.enable", "true");
//
//			mailProps.setProperty("mail.transport.protocol", mailProtocol);
//
//			mailProps.put("mail.debug", debugMode);
//
//			mailProps.put("mail.smtp.host", mailHost);
//
//			mailProps.put("mail.smtp.port", mailPort);
//
//			mailProps.put("mail.smtp.connectiontimeout", "5000");
//
//			mailProps.put("mail.smtp.timeout", "5000");
//
//			mailProps.put("mail.smtp.auth", authMode);
//
//			Session msgSession = null;
//
//			if (authMode.equals("true")) {
//
//				Authenticator auth = new MyAuthentication(mailId, mailPassword);
//
//				msgSession = Session.getInstance(mailProps, auth);
//
//			} else {
//
//				msgSession = Session.getInstance(mailProps, null);
//
//			}
//
//			msgSession.setDebug(debug);
//
//			MimeMessage msg = new MimeMessage(msgSession);
//
//			msg.setFrom(new InternetAddress(fromEmail, fromName));
//
//			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail, toName));
//
//			msg.setSubject(mailTitle);
//
//			msg.setContent(mailContents, "text/html; charset=euc-kr");
//
//			// 스태틱함수로 직접 보내지 않고 객체를 이용해서 보내고 객체를 닫아준다.
//
//			Transport t = msgSession.getTransport(mailProtocol);
//
//			try {
//
//				t.connect();
//
//				t.sendMessage(msg, msg.getAllRecipients());
//
//				return true;
//
//			} finally {
//
//				t.close();
//
//			}
//
//		} catch (Exception e) {
//
//			e.printStackTrace();
//			return false;
//		}
//
//	}
//
//}
//
//class MyAuthentication extends Authenticator {
//
//	PasswordAuthentication pa;
//
//	public MyAuthentication(String mailId, String mailPass) {
//
//		pa = new PasswordAuthentication(mailId, mailPass);
//
//	}
//
//	public PasswordAuthentication getPasswordAuthentication() {
//
//		return pa;
//
//	}

}
