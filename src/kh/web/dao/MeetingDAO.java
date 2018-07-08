package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
   
   
   
   
   public List<ShowMeetingDTO> selectMeet(Date bigindate) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select MEETING_SEQ,to_char(meeting_start_time,'yyyy\"년\"mm\"월\"dd\"일\" day'),to_char(meeting_start_time,'HH24:mi'),group_name,meeting_title ,meeting_location "
				+ "from (select * from MEETING where meeting_start_time >= SYSDATE) where meeting_start_time >= TO_char(?,'YYYYMMDD') order by meeting_start_time ";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setDate(1, new java.sql.Date(bigindate.getTime()));
		ResultSet rs = pstat.executeQuery();
		List<ShowMeetingDTO> list = new ArrayList<>();
		while(rs.next()) {
			ShowMeetingDTO smdto = new ShowMeetingDTO();
			smdto.setMeetseq(rs.getInt(1));
			smdto.setDat_month(rs.getString(2));
			smdto.setHour_minut(rs.getString(3));
			smdto.setGroup_name(rs.getString(4));
			smdto.setMeeting_title(rs.getString(5));
			smdto.setMeeting_location(rs.getString(6));
			list.add(smdto);
		}
		rs.close();
		pstat.close();
		con.close();
		
		return list;
	}
   
  
   
   public int countAttendMembers(int meeting_seq) throws Exception {
      Connection con = DBUtils.getConnection();
      String sql = "select count(*) count from attend where meeting_seq = ? ";
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
   // select * from attend where MEMBER_EMAIL in (select MEMBER_EMAIL from MEETING where member_email = 'abc@abc.com');
   
   public List<ShowMeetingDTO> selectMeetCheck(Date bigindate , String loginId) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select MEETING_SEQ,to_char(meeting_start_time,'yyyy\"년\"mm\"월\"dd\"일\" day'),to_char(meeting_start_time,'HH24:mi'),group_name,meeting_title ,meeting_location "
				+ "from (select * from MEETING where meeting_start_time >= SYSDATE) where meeting_start_time >= TO_char(?,'YYYYMMDD') and "
				+ "MEETING_SEQ IN (select MEETING_SEQ from attend where MEMBER_EMAIL in (select MEMBER_EMAIL from member where member_email = ? )) "
				+ "order by meeting_start_time";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setDate(1, new java.sql.Date(bigindate.getTime()));
		pstat.setString(2, loginId);
		ResultSet rs = pstat.executeQuery();
		List<ShowMeetingDTO> list = new ArrayList<>();
		while(rs.next()) {
			ShowMeetingDTO smdto = new ShowMeetingDTO();
			smdto.setMeetseq(rs.getInt(1));
			smdto.setDat_month(rs.getString(2));
			smdto.setHour_minut(rs.getString(3));
			smdto.setGroup_name(rs.getString(4));
			smdto.setMeeting_title(rs.getString(5));
			smdto.setMeeting_location(rs.getString(6));
			list.add(smdto);
		}
		rs.close();
		pstat.close();
		con.close();
		
		return list;
	}
   
   
   public List<ShowMeetingDTO> selectMyMeet(Date bigindate , String loginId) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select MEETING_SEQ,to_char(meeting_start_time,'yyyy\"년\"mm\"월\"dd\"일\" day'),to_char(meeting_start_time,'HH24:mi'),group_name,meeting_title ,meeting_location "
				+ "from (select * from MEETING where meeting_start_time >= SYSDATE) where meeting_start_time >= TO_char(?,'YYYYMMDD') and "
				+ "member_email IN (select member_email from member where MEMBER_EMAIL in (select MEMBER_EMAIL from member where member_email = ? )) "
				+ "order by meeting_start_time";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setDate(1, new java.sql.Date(bigindate.getTime()));
		pstat.setString(2, loginId);
		ResultSet rs = pstat.executeQuery();
		List<ShowMeetingDTO> list = new ArrayList<>();
		while(rs.next()) {
			ShowMeetingDTO smdto = new ShowMeetingDTO();
			smdto.setMeetseq(rs.getInt(1));
			smdto.setDat_month(rs.getString(2));
			smdto.setHour_minut(rs.getString(3));
			smdto.setGroup_name(rs.getString(4));
			smdto.setMeeting_title(rs.getString(5));
			smdto.setMeeting_location(rs.getString(6));
			list.add(smdto);
		}
		rs.close();
		pstat.close();
		con.close();
		
		return list;
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
   public List<String> DistanceSearchMeet(String lat, String lng, String distance, String city, String word,String day) throws Exception{

		Connection con = DBUtils.getConnection();
		String sql = null;
		double latitude = Double.parseDouble(lat);
		PreparedStatement pstat = null;
		double longitude =Double.parseDouble(lng);
		if(word.equals("")) {
		sql = 
		"select group_seq, group_name,meeting_lat,meeting_lng,meeting_location,meeting_start_time, to_char(meeting_start_time,'HH24:mi')as time from meeting where meeting_location like ? and meeting_start_time >= to_date(?,'YYYYMMDD') order by meeting_start_time";
		pstat = con.prepareStatement(sql);
		pstat.setString(1, "%" + city + "%");
		pstat.setString(2, day);
		}else {
			sql = 
		"select group_seq, group_name,meeting_lat,meeting_lng,meeting_location,meeting_start_time, to_char(meeting_start_time,'HH24:mi')as time from meeting where meeting_location like ? and group_interests like ? and meeting_start_time >= to_date(20180709,'YYYYMMDD') order by meeting_start_time";
		pstat = con.prepareStatement(sql);
		pstat.setString(1, "%" + city + "%");
		pstat.setString(2, word);
		pstat.setString(3, day);
		}
		
		ResultSet rs = pstat.executeQuery();
		
		List<String> fiveList = new ArrayList<>();
		List<String> tenList = new ArrayList<>();
		List<String> fifteenList = new ArrayList<>();
		List<String> allList = new ArrayList<>();

		while(rs.next()) {
			
			int dbGroupSeq = rs.getInt("group_seq");
			String dbGroupName = rs.getString("group_name");
			double dbMeetingLat = Double.parseDouble(rs.getString("meeting_lat"));
			double dbMeetingLng = Double.parseDouble(rs.getString("meeting_lng"));
			Date dbMeetingDate = rs.getDate("meeting_start_time");
			String dbMeetingLocation = rs.getString("meeting_location");
			
			double theta = longitude - dbMeetingLng;
			double dist = Math.sin(deg2rad(latitude)) * Math.sin(deg2rad(dbMeetingLat)) + Math.cos(deg2rad(latitude))
			*Math.cos(deg2rad(dbMeetingLat)) * Math.cos(deg2rad(theta));

			dist = Math.acos(dist);
			dist = rad2deg(dist);
			dist = dist * 60 * 1.1515;
			dist = dist * 1.609344; //km일때
			//		 	 dist = dist * 1609.344; meter 일때
			System.out.println("계산된 거리 : " + dist);
			
			if(dist <= 5) {
				fiveList.add(dbGroupSeq+":"+dbGroupName +":"+ dbMeetingLocation + ":" + dbMeetingDate);
				
			}
			if(dist <= 10) {
				tenList.add(dbGroupSeq+":"+dbGroupName +":"+ dbMeetingLocation + ":" + dbMeetingDate);
				
			}
			if(dist <= 15) {
				fifteenList.add(dbGroupSeq+":"+dbGroupName +":"+ dbMeetingLocation + ":" + dbMeetingDate);
			
			}
			if(dist != 0) {
				allList.add(dbGroupSeq+":"+dbGroupName +":"+ dbMeetingLocation + ":" + dbMeetingDate);
			}
			
		}
		
		if(distance.equals("5") || distance.equals("5km")){
			System.out.println("거리가 5km 인 그룹 : " + fiveList);
			con.close();
			pstat.close();
			return fiveList;
		}else if(distance.equals("10") || distance.equals("10km")){
			System.out.println("거리가 10km 인 그룹 : " + tenList);
			con.close();
			pstat.close();
			return tenList;
		}else if(distance.equals("15") || distance.equals("15km")){
			con.close();
			pstat.close();
			return fifteenList;
		}
		else {
			System.out.println("모든거리 인 그룹" + allList);
			con.close();
			pstat.close();
			return allList;
		}
		
	}
	public double deg2rad(double deg){  
		return (double)(deg * Math.PI / (double)180d);  
	}  
	public double rad2deg(double rad) {
		return (double)(rad*(double)180d / Math.PI);
	}
  
   
}