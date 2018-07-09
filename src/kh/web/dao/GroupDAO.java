package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/*import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.sun.javafx.css.PseudoClassState; 에러나서 주석처리했습니다*/

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

	public List<MygroupDTO> myGroupList(String member_email) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select my.mygroup_seq , g.group_picture, my.group_name, my.group_seq from mygroup my, create_group g "
				+ "where my.group_seq = g.group_seq and my.member_email=? order by my.mygroup_seq desc";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, member_email);

		ResultSet rs = pstat.executeQuery();

		List<MygroupDTO> result = new ArrayList<>();

		while (rs.next()) {
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

	public MemberCountDTO MemberCount(int groupSeq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select DISTINCT GROUP_SEQ, (select count(*) from group_member where GROUP_SEQ = ?) count from group_member where GROUP_SEQ = ? ";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, groupSeq);
		pstat.setInt(2, groupSeq);

		ResultSet rs = pstat.executeQuery();
		List<MemberCountDTO> result = new ArrayList<>();
		MemberCountDTO dto = null;

		if (rs.next()) {
			dto = new MemberCountDTO();

			dto.setGroup_seq(rs.getInt("group_seq"));
			dto.setCount(rs.getInt(2));

		}

		con.close();
		rs.close();
		pstat.close();

		return dto;

	}

	public List<String> DistanceSearch(String lat, String lng, String distance, String city, String word ) throws Exception {

		Connection con = DBUtils.getConnection();
		String sql = null;
		double latitude = Double.parseDouble(lat);
		PreparedStatement pstat = null;
		double longitude =Double.parseDouble(lng);
		if(word.equals("")) {
		sql = 
		"select group_seq, group_name,group_lat,group_lng,group_picture from create_group where group_location like ?";
		pstat = con.prepareStatement(sql);
		pstat.setString(1, "%" + city + "%");
		}else {
			sql = 
		"select group_seq, group_name,group_lat,group_lng,group_picture from create_group where group_location like ? and group_interests like ?";
		pstat = con.prepareStatement(sql);
		pstat.setString(1, "%" + city + "%");
		pstat.setString(2, word);
		}
		
		ResultSet rs = pstat.executeQuery();
		
		List<String> fiveList = new ArrayList<>();
		List<String> tenList = new ArrayList<>();
		List<String> fifteenList = new ArrayList<>();
		List<String> allList = new ArrayList<>();

		while(rs.next()) {
			
			int dbGroupSeq = rs.getInt("group_seq");
			String dbGroupName = rs.getString("group_name");
			double dbGroupLat = Double.parseDouble(rs.getString("group_lat"));
			double dbGroupLng = Double.parseDouble(rs.getString("group_lng"));
			
			String dbGroupPicture = rs.getString("group_picture");
			
			double theta = longitude - dbGroupLng;
			double dist = Math.sin(deg2rad(latitude)) * Math.sin(deg2rad(dbGroupLat))
					+ Math.cos(deg2rad(latitude)) * Math.cos(deg2rad(dbGroupLat)) * Math.cos(deg2rad(theta));

			dist = Math.acos(dist);
			dist = rad2deg(dist);
			dist = dist * 60 * 1.1515;
			dist = dist * 1.609344; // km일때
			// dist = dist * 1609.344; meter 일때
			System.out.println("계산된 거리 : " + dist);
			
			if(dist <= 5) {
				fiveList.add(dbGroupSeq+":"+dbGroupName +":"+ dbGroupPicture);
				
			}
			if(dist <= 10) {
				tenList.add(dbGroupSeq+":"+dbGroupName +":"+ dbGroupPicture);
				
			}
			if(dist <= 15) {
				fifteenList.add(dbGroupSeq+":"+dbGroupName +":"+ dbGroupPicture);
			
			}
			if(dist != 0) {
				allList.add(dbGroupSeq+":"+dbGroupName +":"+ dbGroupPicture);
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

	public double deg2rad(double deg) {
		return (double) (deg * Math.PI / (double) 180d);
	}

	public double rad2deg(double rad) {
		return (double) (rad * (double) 180d / Math.PI);
	}

	public List<String> distSearchCount(List<String> distResult) throws Exception{
		
		List<String> distt = new ArrayList<>();
		int j = 0;
		Connection con = DBUtils.getConnection();
	    String sql = "select count(*) as membercount from group_member where group_seq=? group by group_seq";
	    PreparedStatement pstat = con.prepareStatement(sql);
	    for(int i=0; i<distResult.size(); i++) {
	    	
	    
	    pstat.setInt(1, Integer.parseInt(distResult.get(i).split(":")[0]));
	    ResultSet rs = pstat.executeQuery();
	    
	    
	    if(rs.next()) {
	    	
	    	String count = rs.getString("membercount");
	    	if(!(count.equals(""))) {
	    	distt.add(distResult.get(i) + ":" + count);
	    	System.out.println(i +"번째"+count);
	    	
	    	}
	    }else {
	    		distt.add(distResult.get(i)+":"+0);
	    		System.out.println(i +"번째째"+0);
	    }
	    }
	    con.close();
	    pstat.close();
	    
	    return distt;
		
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

	public String payCheck(String member_email) throws Exception {
		Connection con = DBUtils.getConnection();
		System.out.println("memberemail : "+ member_email);
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

	public int insertGroup(GroupDTO dto) throws Exception {
		Connection con = DBUtils.getConnection();
		
		
		
		String sql = "insert into create_group values(group_seq.nextval,?,?,?,?,?,?,?,'default.jpg',sysdate,0,sysdate,0,0,sysdate,?)";
		PreparedStatement  psat = con.prepareStatement(sql);
		psat.setString(1,dto.getGroup_leader());
		psat.setString(2, dto.getGroup_name());
		psat.setString(3, dto.getGroup_latitude());
		psat.setString(4, dto.getGroup_longitude());
		psat.setString(5, dto.getGroup_location());
		psat.setString(6, dto.getGroup_interests());
		psat.setString(7, dto.getGroup_info());
		psat.setString(8, dto.getMember_email());
		int result = psat.executeUpdate();

		con.commit();
		con.close();
		psat.close();

		return result;

	}

	public String[] printNameGroup(String groupTitle) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select group_seq,group_name from create_group where group_name=?";
		PreparedStatement psat = con.prepareStatement(sql);
		psat.setString(1, groupTitle);

		ResultSet rs = psat.executeQuery();
		rs.next();
		String group_seq = rs.getString("group_seq");
		String groupName = rs.getString("group_name");

		System.out.println("그룹이름:" + groupName + "그룹seq : " + group_seq);
		rs.close();
		psat.close();
		con.close();

		return new String[] { group_seq, groupName };

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
	         dto.setMember_email(rs.getString("member_email"));

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
	         dto.setMember_email(rs.getString("member_email"));

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
	         dto.setMember_email(rs.getString("member_email"));

	         result.add(dto);
	      }

	      con.close();
	      pstat.close();
	      rs.close();

	      return result;
	   }

	public boolean isGroupMember(int group_seq, String member_email) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from mygroup where member_email=? and group_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, member_email);
		pstat.setInt(2, group_seq);

		ResultSet rs = pstat.executeQuery();

		if (rs.next()) {
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

	public int addGroupMember(String member_email, int group_seq, String member_name) throws Exception {
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

	public int joinMyGroup(String member_email, int group_seq, String group_name) throws Exception {
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

	public int removeGroupMember(String member_email) throws Exception {
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

	public int MygroupOut(int group_seq, String member_email) throws Exception {
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

	public List<GroupMemberDTO> memberList(int group_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select gm.*, m.member_picture, g.group_leader,m.member_email from group_member gm, member m, create_group g "
				+ "where gm.member_name=m.member_name and gm.group_seq = g.group_seq and gm.group_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, group_seq);

		ResultSet rs = pstat.executeQuery();

		List<GroupMemberDTO> result = new ArrayList<>();

		while (rs.next()) {
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

	public int payFinish(String email) throws Exception {
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

	public boolean groupNameCheck(String group_name) throws Exception {

		Connection con = DBUtils.getConnection();
		String sql = "select group_name from create_group where group_name=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, group_name);

		ResultSet rs = ps.executeQuery();

		boolean result = rs.next();

		con.close();
		rs.close();
		ps.close();

		return result;

	}

	public List<GroupPicDTO> groupPagePic(int group_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from group_picture where group_seq=? order by group_picture_seq desc";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, group_seq);

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

		rs.close();
		pstat.close();
		con.close();

		return result;

	}

	public int groupPicCount(int group_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select count(*) from group_picture where group_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, group_seq);

		ResultSet rs = pstat.executeQuery();
		int result = 0;

		if (rs.next()) {
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
			gdto.setGroup_latitude(rs.getString("group_lat"));
			gdto.setGroup_longitude(rs.getString("group_lng"));
			if (rs.getString("bdate") != null) {
				gdto.setGroup_betweendate(rs.getInt("bdate"));
			}
		}

		rs.close();
		pstat.close();
		con.close();

		return gdto;
	}

	public int seq() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "SELECT group_seq.NEXTVAL FROM DUAL";
		PreparedStatement pstat = con.prepareStatement(sql);

		ResultSet rs = pstat.executeQuery();

		int seq = 0;
		if (rs.next()) {
			seq = rs.getInt(1);
		}

		con.commit();
		rs.close();
		pstat.close();
		con.close();

		return seq;
	}
	
  
    
    
    public int updateMettingBasic(GroupDTO gdto , int groupseq) throws Exception {
		   Connection con = DBUtils.getConnection();
		   String sql = "update create_group set GROUP_NAME = ? , GROUP_INFO = ? , GROUP_LOCATION = ?  where GROUP_SEQ = ?";
		   PreparedStatement pstat = con.prepareStatement(sql);
		   pstat.setString(1, gdto.getGroup_name());
		   pstat.setString(2, gdto.getGroup_info());
		   pstat.setString(3, gdto.getGroup_location());
		   pstat.setInt(4, groupseq);
		   int result = pstat.executeUpdate();
		   con.commit();
		   pstat.close();
		   con.close();
		   return result;
	   }
	   
	
	   public boolean duplecheckGroup(String newName) throws Exception {
		   Connection con = DBUtils.getConnection();
		   String sql = "select * from CREATE_GROUP where GROUP_NAME in ?";
		   PreparedStatement pstat = con.prepareStatement(sql);
		   pstat.setString(1, newName);
		   ResultSet rs = pstat.executeQuery();
		   if(rs.next()) {
			   rs.close();
			   pstat.close();
			   con.close();
			   return false;
		   }else {
			   rs.close();
			   pstat.close();
			   con.close();
			   return true;
		   }

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


	public List<MygroupDTO> getJoinGroup(String member_email) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select group_name from mygroup where member_email =?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, member_email);
		ResultSet rs = pstat.executeQuery();
		List<MygroupDTO> mglist = new ArrayList<>();

		while (rs.next()) {
			MygroupDTO mgdto = new MygroupDTO();
			mgdto.setGroup_name(rs.getString("group_name"));
			mglist.add(mgdto);
		}

		rs.close();
		pstat.close();
		con.close();

		return mglist;
	}

	public MemberDTO getProfile(String member_email, int group_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from member m, group_member gm where m.member_email=gm.member_email and m.member_email=? and group_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, member_email);
		pstat.setInt(2, group_seq);
		ResultSet rs = pstat.executeQuery();
		MemberDTO mdto = new MemberDTO();

		while (rs.next()) {
			mdto.setGroup_name(rs.getString("group_name"));
			mdto.setJoin_date(rs.getString("join_date"));
			mdto.setMember_seq(rs.getInt("member_seq"));
			mdto.setMember_name(rs.getString("member_name"));
			mdto.setMember_email(rs.getString("member_email"));
			mdto.setMember_pwd(rs.getString("member_pwd"));
			mdto.setMember_location(rs.getString("member_location"));
			mdto.setMember_interests(rs.getString("member_interests"));
			mdto.setMember_picture(rs.getString("member_picture"));
			mdto.setMember_gender(rs.getString("member_gender"));
			mdto.setMember_warningnumber(rs.getInt("member_warningnumber"));
			mdto.setMember_warningdate(rs.getString("member_warningdate"));
			mdto.setMember_expiredate(rs.getString("member_expiredate"));
			mdto.setMember_joindate(rs.getString("member_joindate"));
			mdto.setMember_alarm(rs.getInt("member_alarm"));
			mdto.setMember_isblocked(rs.getInt("member_isblocked"));
		}

		rs.close();
		pstat.close();
		con.close();

		return mdto;

	}

	public Boolean isBlockedGroup(int group_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select create_group.*, floor(sysdate-group_expiredate) from create_group"
				+ " where floor(sysdate-group_expiredate)<0 and group_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, group_seq);
		ResultSet rs = pstat.executeQuery();
		Boolean bool = true;

		if (rs.next()) {
			bool = true;
		} else {
			bool = false;
		}
		rs.close();
		pstat.close();
		con.close();

		return bool;
	}

	public List<MemberDTO> searchGroupMember(int group_seq, String text) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from group_member gm, member m"
				+ " where gm.member_email = m.member_email and gm.group_seq = ? and m.member_name like ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, group_seq);
		pstat.setString(2, "%"+text+"%");
		ResultSet rs = pstat.executeQuery();
		List<MemberDTO> list = new ArrayList<>();

		while (rs.next()) {
			MemberDTO dto = new MemberDTO();
			dto.setGroup_name(rs.getString("group_name"));
			dto.setJoin_date(rs.getString("join_date"));
			dto.setMember_seq(rs.getInt("member_seq"));
			dto.setMember_email(rs.getString("member_email"));
			dto.setMember_name(rs.getString("member_name"));
			dto.setMember_pwd(rs.getString("member_pwd"));
			dto.setMember_location(rs.getString("member_location"));
			dto.setMember_interests(rs.getString("member_interests"));
			dto.setMember_picture(rs.getString("member_picture"));
			dto.setMember_gender(rs.getString("member_gender"));
			dto.setMember_warningnumber(rs.getInt("member_warningnumber"));
			dto.setMember_warningdate(rs.getString("member_warningdate"));
			dto.setMember_expiredate(rs.getString("member_expiredate"));
			dto.setMember_joindate(rs.getString("member_joindate"));
			dto.setMember_alarm(rs.getInt("member_alarm"));
			dto.setMember_isblocked(rs.getInt("member_isblocked"));
			list.add(dto);
		}
		
		rs.close();
		pstat.close();
		con.close();
		
		return list;

	}

}
