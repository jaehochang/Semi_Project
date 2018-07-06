package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kh.web.dto.AttendDTO;
import kh.web.dto.GroupMemberDTO;
import kh.web.dto.MeetingDTO;
import kh.web.utils.DBUtils;

public class MeetingDAO {
   public List<MeetingDTO> getMeetingData() throws Exception {
      Connection con = DBUtils.getConnection();
      String sql = "select * from meeting";
      PreparedStatement pstat = con.prepareStatement(sql);
      
      List<MeetingDTO> result = new ArrayList<>();
      ResultSet rs = pstat.executeQuery();
      
      while(rs.next()) {
         MeetingDTO dto = new MeetingDTO();
         dto.setMeeting_seq(rs.getInt("meeting_seq"));
         dto.setGroup_seq(rs.getInt("group_seq"));
         dto.setGroup_name(rs.getString("group_name"));
         dto.setGroup_leader(rs.getString("group_leader"));
         dto.setMeeting_title(rs.getString("meeting_title"));
         dto.setMeeting_contents(rs.getString("meeting_contents"));
         dto.setMeeting_start_time(rs.getDate("meeting_start_time"));
         dto.setMeeting_end_time(rs.getDate("meeting_end_time"));
         dto.setMeeting_location(rs.getString("meeting_location"));
         dto.setMeeting_picture(rs.getString("meeting_picture"));
         dto.setMeeting_lat(rs.getString("meeting_lat"));
         dto.setMeeting_lng(rs.getString("meeting_lng"));
         dto.setMember_email(rs.getString("member_email"));
         result.add(dto);
      }
      rs.close();
      pstat.close();
      con.close();
      return result;
   }
   
   public MeetingDTO getEachMeetingData(int meeting_seq) throws Exception {
      Connection con = DBUtils.getConnection();
      String sql = "select * from meeting where meeting_seq = ? ";
      PreparedStatement pstat = con.prepareStatement(sql);
      pstat.setInt(1, meeting_seq);
      ResultSet rs = pstat.executeQuery();
      
      MeetingDTO dto = new MeetingDTO();
      
      while(rs.next()) {
         dto.setMeeting_seq(rs.getInt("meeting_seq"));
         dto.setGroup_seq(rs.getInt("group_seq"));
         dto.setGroup_name(rs.getString("group_name"));
         dto.setGroup_leader(rs.getString("group_leader"));
         dto.setMeeting_title(rs.getString("meeting_title"));
         dto.setMeeting_contents(rs.getString("meeting_contents"));
         dto.setMeeting_start_time(rs.getDate("meeting_start_time"));
         dto.setMeeting_end_time(rs.getDate("meeting_end_time"));
         dto.setMeeting_location(rs.getString("meeting_location"));
         dto.setMeeting_picture(rs.getString("meeting_picture"));
         dto.setMeeting_lat(rs.getString("meeting_lat"));
         dto.setMeeting_lng(rs.getString("meeting_lng"));
         dto.setMember_email(rs.getString("member_email"));
         
      }
      rs.close();
      pstat.close();
      con.close();
      return dto;
   }
   
   public int countAttendMembers(int meeting_seq) throws Exception {
      Connection con = DBUtils.getConnection();
      String sql = "select count(*) count from attend where meeting_seq = ?";
      PreparedStatement pstat = con.prepareStatement(sql);
      pstat.setInt(1, meeting_seq);
      ResultSet rs = pstat.executeQuery();
      rs.next();
      int result = rs.getInt("count");
      
      rs.close();
      pstat.close();
      con.close();
      
      return result;
      
   }
   
   public int countWithPeople(int meeting_seq) throws Exception {
      Connection con= DBUtils.getConnection();
         String sql = "select sum(attend_people) people_sum from attend where meeting_seq = ?";
         PreparedStatement pstat = con.prepareStatement(sql);
         pstat.setInt(1, meeting_seq);
         ResultSet rs = pstat.executeQuery();
         rs.next();
         
         int result = rs.getInt("people_sum");
         
         rs.close();
         pstat.close();
         con.close();
         
         return result;
   }
   
   		public String groupName(int meeting_seq) throws Exception {
	      Connection con= DBUtils.getConnection();
	         String sql = "select group_name from meeting where meeting_seq = ?";
	         PreparedStatement pstat = con.prepareStatement(sql);
	         pstat.setInt(1, meeting_seq);
	         ResultSet rs = pstat.executeQuery();
	         rs.next();
	         
	         String result = rs.getString("group_name");
	         
	         rs.close();
	         pstat.close();
	         con.close();
	         
	         return result;
	   }
   		
   		public List<AttendDTO> getAttendData(int meeting_seq) throws Exception {
   	      Connection con = DBUtils.getConnection();
   	      String sql = "select * from attend where meeting_seq = ? ";
	   	   PreparedStatement pstat = con.prepareStatement(sql);
	       pstat.setInt(1, meeting_seq);
	       ResultSet rs = pstat.executeQuery();
	       
	       List<AttendDTO> result = new ArrayList<>();
	       
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
   		
   		public int groupSeq(int meeting_seq) throws Exception {
  	      Connection con= DBUtils.getConnection();
  	         String sql = "select group_seq from meeting where meeting_seq = ?";
  	         PreparedStatement pstat = con.prepareStatement(sql);
  	         pstat.setInt(1, meeting_seq);
  	         ResultSet rs = pstat.executeQuery();
  	         rs.next();
  	         
  	         int result = rs.getInt("group_seq");
  	         
  	         rs.close();
  	         pstat.close();
  	         con.close();
  	         
  	         return result;
  	   }
   		
   		public List<GroupMemberDTO> getGroupMemberData(int group_seq) throws Exception {
     	   Connection con = DBUtils.getConnection();
     	   String sql = "select * from group_member where group_seq = ? ";
  	   	   PreparedStatement pstat = con.prepareStatement(sql);
  	   	   pstat.setInt(1, group_seq);
  	       ResultSet rs = pstat.executeQuery();
  	       
  	       List<GroupMemberDTO> result = new ArrayList<>();
  	       
  	       while(rs.next()) {
  	    	  GroupMemberDTO dto = new GroupMemberDTO();
  	    	  dto.setGroup_member_seq(rs.getInt("group_member_seq"));
  	    	  dto.setMember_name(rs.getString("member_name"));
  	    	  dto.setGroup_seq(rs.getInt("group_seq"));
  	    	  dto.setJoin_date(rs.getDate("join_date"));
  	    	  dto.setMember_email(rs.getString("member_email"));
  	          result.add(dto);
  	       }
  	       rs.close();
  	       pstat.close();
  	       con.close();
  	       return result;
     	   }
   
}