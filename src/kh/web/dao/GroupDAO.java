package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sun.javafx.css.PseudoClassState;

import kh.web.dto.AttendDTO;
import kh.web.dto.GroupDTO;
import kh.web.dto.GroupMemberDTO;
import kh.web.dto.GroupPicDTO;
import kh.web.dto.MeetingDTO;
import kh.web.dto.MemberCountDTO;
import kh.web.dto.MemberDTO;
import kh.web.dto.GroupDTO;
import kh.web.dto.MygroupDTO;
import kh.web.utils.DBUtils;

public class GroupDAO {
	public List<GroupDTO> allgroups() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from create_group";
		PreparedStatement pstat = con.prepareStatement(sql);

		ResultSet rs = pstat.executeQuery();
		List<GroupDTO> result = new ArrayList<>();

		while (rs.next()) {
			GroupDTO dto = new GroupDTO();
			dto.setGroup_seq(rs.getInt("group_seq"));
			dto.setGroup_leader(rs.getString("group_leader"));
			dto.setGroup_name(rs.getString("group_name"));
			dto.setGroup_location(rs.getString("group_location"));
			dto.setGroup_interests(rs.getString("group_interests"));
			dto.setGroup_info(rs.getString("group_info"));
			dto.setGroup_picture(rs.getString("group_picture"));

			result.add(dto);
		}

		con.close();
		rs.close();
		pstat.close();

		return result;
	}

	public List<GroupPicDTO> allgroupsPictures() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from group_picture";
		PreparedStatement pstat = con.prepareStatement(sql);

		ResultSet rs = pstat.executeQuery();
		List<GroupPicDTO> result = new ArrayList<>();

		while (rs.next()) {
			GroupPicDTO dto = new GroupPicDTO();

			dto.setGroup_picture_seq(rs.getInt("group_picture_seq"));
			dto.setGroup_seq(rs.getInt("group_seq"));
			dto.setOriginal_name(rs.getString("original_name"));
			dto.setSystem_name(rs.getString("system_name"));

			result.add(dto);

		}

		con.close();
		rs.close();
		pstat.close();

		return result;
	}

	public List<MygroupDTO> myGroupList(String member_email) throws Exception{
	      Connection con = DBUtils.getConnection();
	      String sql = "select my.mygroup_seq , g.group_picture, my.group_name, my.group_seq from mygroup my, create_group g "
	      		+ "where my.group_seq = g.group_seq and my.member_email=? order by my.mygroup_seq desc";
	      PreparedStatement pstat = con.prepareStatement(sql);
	      pstat.setString(1, member_email);
	      
	      ResultSet rs = pstat.executeQuery();
	      
	      List<MygroupDTO> result = new ArrayList<>();
	      
	      while(rs.next()) {
	         MygroupDTO dto = new MygroupDTO();
	         
	         dto.setGroup_seq(rs.getInt("group_seq"));
	         dto.setGroup_name(rs.getString("group_name"));
	         dto.setGroup_picture(rs.getString("group_picture"));
	         
	         result.add(dto);
	      }
	      
	      rs.close();
	      pstat.close();
	      con.close();
	      
	      return result;
	   }

	public MemberCountDTO MemberCount(int groupSeq) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select DISTINCT GROUP_SEQ, (select count(*) from group_member where GROUP_SEQ = ?) count from group_member where GROUP_SEQ = ? ";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, groupSeq);
		pstat.setInt(2, groupSeq);

		ResultSet rs = pstat.executeQuery();
		List<MemberCountDTO> result = new ArrayList<>();
		MemberCountDTO dto = null;

		if(rs.next()) {
			dto = new MemberCountDTO();

			dto.setGroup_seq(rs.getInt("group_seq"));
			dto.setCount(rs.getInt(2));

		}

		con.close();
		rs.close();
		pstat.close();

		return dto;

	}
	public List<String> DistanceSearch(String lat, String lng, String distance) throws Exception{

		Connection con = DBUtils.getConnection();
		
		String sql1 = "select group_seq, group_name,count(*) as count from group_member group by group_seq,group_name";
		PreparedStatement pstat1 = con.prepareStatement(sql1);
		ResultSet rs1 = pstat1.executeQuery();
		List<String> count = new ArrayList<>();
		
		while(rs1.next()) {
			count.add(rs1.getInt("group_seq")+":"+rs1.getInt("count"));
		}
		
		
		double latitude = Double.parseDouble(lat);
		
		double longitude =Double.parseDouble(lng);
		
		String sql = 
		"select a.GROUP_NAME,a.GROUP_LAT,a.GROUP_LNG,count(*) as member_count,c.system_name "
		+ "from create_group a, group_member b, group_picture c "
		+ "where a.GROUP_SEQ=b.GROUP_SEQ and a.group_seq = c.GROUP_SEQ "
		+ "group by b.GROUP_SEQ, a.GROUP_NAME,c.system_name,a.GROUP_LAT,a.GROUP_LNG";
		
		PreparedStatement pstat = con.prepareStatement(sql);
		
		ResultSet rs = pstat.executeQuery();
		List<String> fiveList = new ArrayList<>();
		List<String> tenList = new ArrayList<>();
		List<String> fifteenList = new ArrayList<>();
		List<String> allList = new ArrayList<>();

		while(rs.next()) {

			String dbGroupName = rs.getString("group_name");
			double dbGroupLat = Double.parseDouble(rs.getString("group_lat"));
			double dbGroupLng = Double.parseDouble(rs.getString("group_lng"));
			String dbGroupMemberCount = rs.getString("member_count");
			String dbGroupPicture = rs.getString("system_name");
			
			double theta = longitude - dbGroupLng;
			double dist = Math.sin(deg2rad(latitude)) * Math.sin(deg2rad(dbGroupLat)) + Math.cos(deg2rad(latitude))
			*Math.cos(deg2rad(dbGroupLat)) * Math.cos(deg2rad(theta));

			dist = Math.acos(dist);
			dist = rad2deg(dist);
			dist = dist * 60 * 1.1515;
			dist = dist * 1.609344; //km일때
			//		 	 dist = dist * 1609.344; meter 일때
			System.out.println("계산된 거리 : " + dist);
			
			if(dist <= 5) {
				fiveList.add(dbGroupName +":"+dbGroupMemberCount +":"+ dbGroupPicture);
				
			}
			if(dist <= 10) {
				tenList.add(dbGroupName +":"+dbGroupMemberCount +":"+ dbGroupPicture);
				
			}
			if(dist <= 15) {
				fifteenList.add(dbGroupName +":"+dbGroupMemberCount +":"+ dbGroupPicture);
			
			}
			if(dist != 0) {
				allList.add(dbGroupName);
			}
			
		}
		
		if(distance.equals("5")) {
			System.out.println("거리가 5km 인 그룹 : " + fiveList);
			con.close();
			pstat.close();
			return fiveList;
		}else if(distance.equals("10")) {
			System.out.println("거리가 10km 인 그룹 : " + tenList);
			con.close();
			pstat.close();
			return tenList;
		}else if(distance.equals("15")) {
			con.close();
			pstat.close();
			return fifteenList;
		}
		else {
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

	
	public List<GroupDTO> groupInfo(String seq) throws Exception{
		int group_seq = Integer.parseInt(seq);

		Connection con = DBUtils.getConnection();
		String sql = "select * from create_group where GROUP_SEQ=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, group_seq);
		ResultSet rs = pstat.executeQuery();

		List<GroupDTO> result = new ArrayList<>();

		if (rs.next()) {
			GroupDTO dto = new GroupDTO();

			dto.setGroup_seq(rs.getInt("group_seq"));
			dto.setGroup_leader(rs.getString("group_leader"));
			dto.setGroup_name(rs.getString("group_name"));
			dto.setGroup_location(rs.getString("group_location"));
			dto.setGroup_interests(rs.getString("group_interests"));
			dto.setGroup_info(rs.getString("group_info"));
			dto.setGroup_picture(rs.getString("group_picture"));
			dto.setMember_email(rs.getString("member_email"));
			
			
			result.add(dto);
		}

		con.close();
		pstat.close();
		rs.close();

		return result;
	}

	
	public String payCheck(String member_email) throws Exception{
		Connection con = DBUtils.getConnection();
		System.out.println("memberemail : "+member_email);
		String sql = "select payCheck from create_group_payment join member on member.member_seq=create_group_payment.member_seq where create_group_payment.member_email=?";
		
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, member_email);
		ResultSet rs = pstat.executeQuery();
		
	    rs.next();
		String pay=rs.getString("payCheck");
		System.out.println("paycheck :"+pay);
		
		rs.close();
		pstat.close();
		con.close();
		
		return pay;
	
		
	}
	
	

	public int insertGroup(GroupDTO dto) throws Exception{
		Connection con = DBUtils.getConnection();
		
		
		
		String sql = "insert into create_group values(group_seq.nextval,?,?,'위도','경도',?,?,?,'default.jpg',sysdate,0,sysdate,0,0,sysdate,?)";
		PreparedStatement  psat = con.prepareStatement(sql);
		psat.setString(1,dto.getGroup_leader());
		psat.setString(2, dto.getGroup_name());
		psat.setString(3, dto.getGroup_location());
		psat.setString(4, dto.getGroup_interests());
		psat.setString(5, dto.getGroup_info());
		psat.setString(6, dto.getMember_email());
		int result = psat.executeUpdate();
        
		
		con.commit();
		con.close();
		psat.close();
		
		return result;
		
		
	}
	public String[] printNameGroup(String groupTitle) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select group_seq,group_name from create_group where group_name=?";
		PreparedStatement psat = con.prepareStatement(sql);
		psat.setString(1, groupTitle);
		
		ResultSet rs = psat.executeQuery();
		rs.next();
		String group_seq=rs.getString("group_seq");
		String groupName=rs.getString("group_name");
		
		System.out.println("그룹이름:"+groupName+"그룹seq : "+group_seq);
		rs.close();
		psat.close();
		con.close();
		
		return new String[] {group_seq,groupName};
		
		
	}
	
	public List<MeetingDTO> preMeeting(int group_seq, int meeting_Seq) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select * from meeting where group_seq=? and meeting_start_time > sysdate and meeting_seq != ? order by meeting_start_time asc";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, group_seq);
		pstat.setInt(2, meeting_Seq);
		
		ResultSet rs = pstat.executeQuery();
		List<MeetingDTO> result = new ArrayList<>();
		if (rs.next()) {
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

		con.close();
		pstat.close();
		rs.close();

		return result;
		
		
	}
	
	public List<MeetingDTO> nextAllMeeting(int group_seq) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select * from meeting where group_seq=? and meeting_start_time > sysdate";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, group_seq);
		
		ResultSet rs = pstat.executeQuery();
		List<MeetingDTO> result = new ArrayList<>();
		while (rs.next()) {
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

		con.close();
		pstat.close();
		rs.close();

		return result;
		
	}
	
	public List<MeetingDTO> nextMeetup(int groupSeq) throws Exception{
		Connection con = DBUtils.getConnection();

		String sql = "select *from (select meeting.*, row_number()over(partition by group_seq order by meeting_start_time asc) rn "
				+ "from meeting where group_seq=? and meeting_start_time > sysdate) where rn = 1";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, groupSeq);

		ResultSet rs = pstat.executeQuery();

		List<MeetingDTO> result = new ArrayList<>();
		if (rs.next()) {
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

		con.close();
		pstat.close();
		rs.close();

		return result;
	}

	public List<MeetingDTO> lastMeeting(int groupSeq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from meeting where group_seq=? and meeting_start_time < sysdate";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, groupSeq);
		ResultSet rs = pstat.executeQuery();

		List<MeetingDTO> result = new ArrayList<>();
		while (rs.next()) {
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

		con.close();
		pstat.close();
		rs.close();

		return result;
	}
	
	public boolean isGroupMember(int group_seq, String member_email) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select * from mygroup where member_email=? and group_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, member_email);
		pstat.setInt(2, group_seq);
		
		ResultSet rs = pstat.executeQuery();
		
		if(rs.next()) {
			rs.close();
			pstat.close();
			con.close();
			return true;
		}
		rs.close();
		pstat.close();
		con.close();
		return false;
	}
	
	public int addGroupMember(String member_email, int group_seq,String member_name) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "insert into group_member values(group_member_seq.nextval,?,?,sysdate,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, member_name);
		pstat.setInt(2, group_seq);
		pstat.setString(3, member_email);
		
		int result = pstat.executeUpdate();
		
		con.commit();
		pstat.close();
		con.close();
		
		return result;
	}
	
	
	public int joinMyGroup(String member_email, int group_seq, String group_name) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "insert into mygroup values(mygroup_seq.nextval,?,?,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		
		
		pstat.setInt(1, group_seq);
		pstat.setString(2, group_name);
		pstat.setString(3, member_email);
		
		int result = pstat.executeUpdate();
		
		con.commit();
		con.close();
		pstat.close();
		
		return result;
	}
	
	public int removeGroupMember(String member_email) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "delete from group_member where member_email=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, member_email);
		
		int result = pstat.executeUpdate();
		
		con.commit();
		pstat.close();
		con.close();
		
		return result;
	}
	
	public int MygroupOut(int group_seq,String member_email) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "delete from mygroup where member_email=? and group_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		
		pstat.setString(1, member_email);
		pstat.setInt(2, group_seq);
		
		int result = pstat.executeUpdate();
		
		con.commit();
		con.close();
		pstat.close();
		
		return result;
	}
	
	public List<GroupMemberDTO> memberList(int group_seq) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select gm.*, m.member_picture, g.group_leader from group_member gm, member m, create_group g "
				+ "where gm.member_name=m.member_name and gm.group_seq = g.group_seq and gm.group_seq=?";
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
			dto.setMember_picture(rs.getString("member_picture"));
			dto.setGroup_leader(rs.getString("group_leader"));
			dto.setMember_email(rs.getString("member_email"));
			
			result.add(dto);
		}
		
		rs.close();
		pstat.close();
		con.close();
		
		return result;
		
	}
	
	public int payFinish(String email) throws Exception{
		Connection con = DBUtils.getConnection();
		
		String sql = "update create_group_payment set paycheck='y' where member_email=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		
		pstat.setString(1, email);
		
		int result = pstat.executeUpdate();
		
		con.commit();
		con.close();
		pstat.close();
		
		return result;
		
	}
	
	public boolean groupNameCheck(String group_name) throws Exception{

		Connection con = DBUtils.getConnection();	
		String sql = "select group_name from create_group where group_name=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, group_name);
		
		ResultSet rs = ps.executeQuery();
		
		boolean result=rs.next();
	
		con.close();
		rs.close();
		ps.close();
	
		return result;
		
	
	}
	
	
	 public List<GroupPicDTO> groupPagePic(int group_seq) throws Exception{
		   Connection con = DBUtils.getConnection();
		   String sql = "select * from group_picture where group_seq=? order by group_picture_seq desc";
		   PreparedStatement pstat = con.prepareStatement(sql);
		   pstat.setInt(1, group_seq);
		   
		   ResultSet rs = pstat.executeQuery();
		   List<GroupPicDTO> result = new ArrayList<>();
		   
		   while(rs.next()) {
			   GroupPicDTO dto = new GroupPicDTO();
			   
			   dto.setGroup_picture_seq(rs.getInt("group_picture_seq"));
			   dto.setGroup_seq(rs.getInt("group_seq"));
			   dto.setOriginal_name(rs.getString("original_name"));
			   dto.setSystem_name(rs.getString("system_name"));
			   
			   result.add(dto);
			   
		   }
		   
		   rs.close();
		   pstat.close();
		   con.close();
		   
		   return result;
		   
	   }
	 
	 public int groupPicCount(int group_seq) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select count(*) from group_picture where group_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, group_seq);
		
		ResultSet rs = pstat.executeQuery();
		int result = 0;
		
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
		rs.close();
		pstat.close();
		con.close();
		
		return result;
	 }
	
	public GroupDTO getGroupData(int group_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select create_group.*, floor(sysdate - group_expiredate) as bdate from create_group where group_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, group_seq);
		ResultSet rs = pstat.executeQuery();
		GroupDTO gdto = new GroupDTO();

		while (rs.next()) {
			gdto.setGroup_seq(rs.getInt("group_seq"));
			gdto.setGroup_leader(rs.getString("group_leader"));
			gdto.setGroup_name(rs.getString("group_name"));
			gdto.setGroup_location(rs.getString("group_location"));
			gdto.setGroup_interests(rs.getString("group_interests"));
			gdto.setGroup_info(rs.getString("group_info"));
			gdto.setGroup_picture(rs.getString("group_picture"));
			gdto.setGroup_warningdate(rs.getString("group_warningdate"));
			gdto.setGroup_warningnumber(rs.getInt("group_warningnumber"));
			gdto.setGroup_expiredate(rs.getString("group_expiredate"));
			gdto.setGroup_isblocked(rs.getInt("group_isblocked"));
			gdto.setGroup_createdate(rs.getString("group_createdate"));
			gdto.setGroup_alarm(rs.getInt("group_alarm"));
			gdto.setGroup_lat(rs.getString("group_lat"));
			gdto.setGroup_lng(rs.getString("group_lng"));
			if (rs.getString("bdate") != null) {
				gdto.setGroup_betweendate(rs.getInt("bdate"));
			}
		}
		
		rs.close();
		pstat.close();
		con.close();
		
		return gdto;
	}
	
	public int seq() throws Exception{
		Connection con =DBUtils.getConnection();
		String sql = "SELECT group_seq.NEXTVAL FROM DUAL";
		PreparedStatement pstat = con.prepareStatement(sql);
		
		ResultSet rs = pstat.executeQuery();
		
		int seq=0;
		if(rs.next()) {
			seq=rs.getInt(1);
		}
		
		con.commit();
		rs.close();
		pstat.close();
		con.close();
		
		return seq;
	}
	
    public int updateMettingBasic(GroupDTO gdto , int groupseq) throws Exception {
        Connection con = DBUtils.getConnection();
        String sql = "update create_group set GROUP_NAME = ? , GROUP_INFO = ? where GROUP_SEQ = ?";
        PreparedStatement pstat = con.prepareStatement(sql);
        pstat.setString(1, gdto.getGroup_name());
        pstat.setString(2, gdto.getGroup_info());
        pstat.setInt(3, groupseq);
        int result = pstat.executeUpdate();
        con.commit();
        pstat.close();
        con.close();
        return result;
     }

    public List<AttendDTO> attendMemberPic(int meeting_seq) throws Exception{
    	Connection con = DBUtils.getConnection();
    	String sql = "select a.meeting_seq,m.member_picture,(select count(*) from attend where meeting_seq=?)"
    			+ "from attend a,member m where meeting_seq=? and a.member_seq=m.member_seq";
    	PreparedStatement pstat = con.prepareStatement(sql);
    	pstat.setInt(1, meeting_seq);
    	pstat.setInt(2, meeting_seq);
    	
    	ResultSet rs = pstat.executeQuery();
    	List<AttendDTO> result = new ArrayList<>();
    	
    	while(rs.next()) {
    		AttendDTO dto = new AttendDTO();
    		
    		dto.setMeeting_seq(rs.getInt("meeting_seq"));
    		dto.setMember_picture(rs.getString("member_picture"));
    		dto.setCount(rs.getInt(3));
    		
    		result.add(dto);
    	}
    	
    	rs.close();
    	pstat.close();
    	con.close();
    	
    	return result;
    }
    
    public List<MemberDTO> LeaderInfo(String member_email) throws Exception{
    	Connection con = DBUtils.getConnection();
    	String sql = "select * from member where member_email=?";
    	PreparedStatement pstat = con.prepareStatement(sql);
    	pstat.setString(1, member_email);
    	
    	ResultSet rs = pstat.executeQuery();
    	List<MemberDTO> result = new ArrayList<>();
    	
    	if(rs.next()) {
    		MemberDTO dto = new MemberDTO();
    		
    		dto.setMember_email(rs.getString("member_email"));
    		dto.setMember_name(rs.getString("member_name"));
    		dto.setMember_picture(rs.getString("member_picture"));
    		
    		result.add(dto);
    	}
    	
    	rs.close();
    	pstat.close();
    	con.close();
    	
    	return result;
    }
}






