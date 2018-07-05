package kh.web.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kh.web.dto.GroupDTO;
import kh.web.dto.MeetingDTO;
import kh.web.dto.ShowMeetingDTO;
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
         
      }
      
      rs.close();
      pstat.close();
      con.close();
      return dto;
   }
   
   public List<ShowMeetingDTO> selectMeet(Date bigindate) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select to_char(meeting_start_time,'yyyy\"년\"mm\"월\"dd\"일\" day'),to_char(meeting_start_time,'HH24:mi'),group_name,meeting_title ,meeting_location "
				+ "from (select * from MEETING where meeting_start_time >= SYSDATE) where meeting_start_time >= TO_char(?,'YYYYMMDD') order by meeting_start_time";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setDate(1, new java.sql.Date(bigindate.getTime()));
		ResultSet rs = pstat.executeQuery();
		List<ShowMeetingDTO> list = new ArrayList<>();
		while(rs.next()) {
			ShowMeetingDTO smdto = new ShowMeetingDTO();
			smdto.setDat_month(rs.getString(1));
			smdto.setHour_minut(rs.getString(2));
			smdto.setGroup_name(rs.getString(3));
			smdto.setMeeting_title(rs.getString(4));
			smdto.setMeeting_location(rs.getString(5));
			list.add(smdto);
		}
		rs.close();
		pstat.close();
		con.close();
		
		return list;
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
   
}