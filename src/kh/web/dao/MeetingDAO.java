package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
      con.close();
      pstat.close();
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
   
}