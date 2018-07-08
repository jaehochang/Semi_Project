package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kh.web.dto.AttendDTO;
import kh.web.utils.DBUtils;

public class AttendDAO {
   public List<AttendDTO> getAttendMembers(int meeting_seq) throws Exception {
      Connection con = DBUtils.getConnection();
      String sql = "select * from attend where meeting_seq = ?";      
      PreparedStatement pstat = con.prepareStatement(sql);
      pstat.setInt(1, meeting_seq);
      
      List<AttendDTO> result = new ArrayList<>();
      ResultSet rs = pstat.executeQuery();
      
      while(rs.next()) {
         AttendDTO dto = new AttendDTO();
         dto.setAttend_seq(rs.getInt("attend_seq"));
         dto.setMeeting_seq(rs.getInt("meeting_seq"));
         dto.setGroup_seq(rs.getInt("group_seq"));
         dto.setAttend_people(rs.getInt("attend_people"));
         dto.setMember_seq(rs.getInt("member_seq"));
         dto.setMember_email(rs.getString("member_email"));
         dto.setMember_name(rs.getString("member_name"));
         dto.setMember_picture(rs.getString("member_picture"));
         dto.setAttend_time(rs.getDate("attend_time"));
         result.add(dto);
      }
      
      rs.close();
      pstat.close();
      con.close();
      return result;
   }
   
   public int addAttendMember (int meeting_seq, String member_email, int attend_people) throws Exception {
      Connection con = DBUtils.getConnection();
      String sql = "insert into attend values (attend_seq.nextval, ?,(select group_seq from meeting where meeting_seq = ?),?,(select member_seq from member where member_email = ?), ?,(select member_name from member where member_email = ?),(select member_picture from member where member_email = ?),sysdate)";
      PreparedStatement pstat = con.prepareStatement(sql);
      pstat.setInt(1, meeting_seq);
      pstat.setInt(2, meeting_seq);
      pstat.setInt(3, attend_people);
      pstat.setString(4, member_email);
      pstat.setString(5, member_email);
      pstat.setString(6, member_email);
      pstat.setString(7, member_email);
      int result = pstat.executeUpdate();
      
      pstat.close();
      con.commit();
      con.close();
      return result;
   }
   
   public int deleteAttendMember (int meeting_seq, String member_email) throws Exception {
      Connection con = DBUtils.getConnection();
      String sql = "delete from attend where meeting_seq = ? and member_email = ?";
      PreparedStatement pstat = con.prepareStatement(sql);
      pstat.setInt(1, meeting_seq);
      pstat.setString(2, member_email);
      
      int result = pstat.executeUpdate();
      pstat.close();
      con.commit();
      con.close();
      return result;
   }
   
   public boolean areYouAttend (int meeting_seq, String member_email) throws Exception {
      Connection con = DBUtils.getConnection();
      String sql = "select * from attend where meeting_seq = ? and member_email = ?";
      PreparedStatement pstat = con.prepareStatement(sql);
      pstat.setInt(1, meeting_seq);
      pstat.setString(2, member_email);
      
      ResultSet rs = pstat.executeQuery();
      boolean result = rs.next();
      
      rs.close();
      pstat.close();
      con.close();
      return result;
   }
   
   public boolean checkMeetingDate (int meeting_seq) throws Exception {
	      Connection con = DBUtils.getConnection();
	      String sql = "select meeting_start_time from meeting where meeting_start_time >= sysdate and meeting_seq = ?";
	      PreparedStatement pstat = con.prepareStatement(sql);
	      pstat.setInt(1, meeting_seq);
	      
	      ResultSet rs = pstat.executeQuery();
	      boolean result = rs.next();
	      
	      rs.close();
	      pstat.close();
	      con.close();
	      return result;
	   }
   
   
}