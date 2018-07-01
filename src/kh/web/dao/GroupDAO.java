package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

	public List<MygroupDTO> myGroupList() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select mygroup_seq, system_name, group_name ,group_picture.group_seq from group_picture join mygroup on group_picture.group_seq = mygroup.group_seq where mygroup.member_email='test' order by mygroup_seq";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();

		List<MygroupDTO> result = new ArrayList<>();

		while (rs.next()) {
			MygroupDTO dto = new MygroupDTO();

			dto.setGroup_seq(rs.getInt("group_seq"));
			dto.setGroup_name(rs.getString("group_name"));
			dto.setSystem_name(rs.getString("system_name"));

			result.add(dto);
		}

		con.close();
		rs.close();
		pstat.close();

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

	public List<GroupDTO> groupInfo(String seq) throws Exception {
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

			result.add(dto);
		}

		con.close();
		pstat.close();
		rs.close();

		return result;
	}

	public List<MeetingDTO> nextMeetup(int groupSeq, int meeting_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		PreparedStatement pstat = null;
		if (meeting_seq == 0) {
			String sql = "select *from (select meeting.*, row_number()over(partition by group_seq order by meeting_start_time asc) rn "
					+ "from meeting where group_seq=? and meeting_start_time > sysdate) where rn = 1";
			pstat = con.prepareStatement(sql);
			pstat.setInt(1, groupSeq);
		} else if (groupSeq == 0) {
			String sql = "select * from meeting where group_seq=3 and meeting_start_time > sysdate and meeting_seq != ?";
			pstat = con.prepareStatement(sql);
			pstat.setInt(1, meeting_seq);
		}

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
			dto.setMeeting_start_time(rs.getString("meeting_start_time"));
			dto.setMeeting_end_time(rs.getString("meeting_end_time"));
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
			dto.setMeeting_start_time(rs.getString("meeting_start_time"));
			dto.setMeeting_end_time(rs.getString("meeting_end_time"));
			dto.setMeeting_location(rs.getString("meeting_location"));
			dto.setMeeting_picture(rs.getString("meeting_picture"));

			result.add(dto);
		}

		con.close();
		pstat.close();
		rs.close();

		return result;
	}

}
