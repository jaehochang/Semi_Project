package kh.web.dao;

import java.sql.Connection;
import java.util.Date;
import java.util.Iterator;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.ListIterator;

import kh.web.dto.AttendDTO;
import kh.web.dto.GroupMemberDTO;
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
   
   public String getMeetingStartTime(int meeting_seq) throws Exception {
	      Connection con = DBUtils.getConnection();
	      String sql = "select to_char(meeting_start_time, 'yyyy-MM-dd hh24:mi:ss') time from meeting where meeting_seq = ?";
	      PreparedStatement pstat = con.prepareStatement(sql);
	      pstat.setInt(1, meeting_seq);
	      ResultSet rs = pstat.executeQuery();
	      rs.next();
	      
	      String result = rs.getString("time");
	      
	      rs.close();
	      pstat.close();
	      con.close();
	      
	      return result;
	      
	}
   
   
   public String getMeetingEndTime(int meeting_seq) throws Exception {
	      Connection con = DBUtils.getConnection();
	      String sql = "select to_char(meeting_end_time, 'yyyy-MM-dd hh24:mi:ss') time from meeting where meeting_seq = ?";
	      PreparedStatement pstat = con.prepareStatement(sql);
	      pstat.setInt(1, meeting_seq);
	      ResultSet rs = pstat.executeQuery();
	      rs.next();
	      
	      String result = rs.getString("time");
	      
	      rs.close();
	      pstat.close();
	      con.close();
	      
	      return result;
	      
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
   /* 더미 값   혹시 모르니 삭제 하시지 마시길 바랍니다
   public int updateMettingBasic(MeetingDTO mdto , int meetseq) throws Exception {
      Connection con = DBUtils.getConnection();
      String sql = "update meeting set GROUP_NAME = ? , MEETING_TITLE = ?, MEETING_CONTENTS = ? where MEETING_SEQ = ?";
      PreparedStatement pstat = con.prepareStatement(sql);
      pstat.setString(1, mdto.getGroup_name());
      pstat.setString(2, mdto.getMeeting_title());
      pstat.setString(3, mdto.getMeeting_contents());
      pstat.setInt(4, meetseq);
      int result = pstat.executeUpdate();
      pstat.close();
      con.close();
      return result;
   }
   */
   
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
   
   public int insertNewMeeting(MeetingDTO mdto) throws Exception{
      Connection con = DBUtils.getConnection();
      String sql = "insert into meeting values(meeting_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?)";
      PreparedStatement pstat = con.prepareStatement(sql);
      pstat.setInt(1,mdto.getGroup_seq());
      pstat.setString(2, mdto.getGroup_name());
      pstat.setString(3, mdto.getGroup_leader());
      pstat.setString(4, mdto.getMeeting_title());
      pstat.setString(5,mdto.getMeeting_contents());
      pstat.setTimestamp(6, new java.sql.Timestamp(mdto.getMeeting_start_time().getTime()));
      pstat.setTimestamp(7, new java.sql.Timestamp(mdto.getMeeting_end_time().getTime()));
      pstat.setString(8, mdto.getMeeting_location());
      pstat.setString(9, mdto.getMeeting_lat());
      pstat.setString(10, mdto.getMeeting_lng());
      pstat.setString(11, mdto.getMeeting_picture());
      pstat.setString(12, mdto.getMember_email());
      int result = pstat.executeUpdate();
      
      con.commit();
      pstat.close();
      con.close();
      
      return result;
   }
   
   public List<ShowMeetingDTO> selectMeet(java.util.Date bigindate) throws Exception {
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
   
}