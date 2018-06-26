package kh.web.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kh.web.dto.GTableDTO;
import kh.web.dto.GtablePictureDTO;
import kh.web.dto.MemberCountDTO;
import kh.web.dto.MygroupDTO;
import kh.web.utils.DBUtils;

public class GroupDAO {
	public List<GTableDTO> allgroups() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from gtable";
		PreparedStatement pstat = con.prepareStatement(sql);
		
		ResultSet rs = pstat.executeQuery();
		List<GTableDTO> result = new ArrayList<>();
		
		while(rs.next()) {
			GTableDTO dto = new GTableDTO();
			dto.setGroup_seq(rs.getInt("group_seq"));
			dto.setGroup_leader(rs.getString("group_leader"));
			dto.setGroup_name(rs.getString("group_name"));
			dto.setGroup_location(rs.getString("group_location"));
			dto.setGroup_interests(rs.getString("group_interests"));
			dto.setGroup_info(rs.getString("group_info"));
			dto.setOriginal_name(rs.getString("original_name"));
			dto.setSystem_name(rs.getString("system_name"));
			
			result.add(dto);
		}
		
		con.close();
		rs.close();
		pstat.close();
		
		return result;
	}
	
	public List<GtablePictureDTO> allgroupsPictures() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from gtable_picture";
		PreparedStatement pstat = con.prepareStatement(sql);
		
		ResultSet rs = pstat.executeQuery();
		List<GtablePictureDTO> result = new ArrayList<>();
		
		while(rs.next()) {
			GtablePictureDTO dto = new GtablePictureDTO();
			
			dto.setGroup_picture_seq(rs.getInt(1));
			dto.setGroup_seq(rs.getInt(2));
			dto.setOriginal_name(rs.getString(3));
			dto.setSystem_name(rs.getString(4));
			
			result.add(dto);
			
		}
		
		con.close();
		rs.close();
		pstat.close();
		
		return result;
	}
	
	public List<MygroupDTO> myGroupList() throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select seq, system_name, group_name,gtable_picture.group_seq from gtable_picture join mygroup_table on gtable_picture.group_seq = mygroup_table.group_seq where mygroup_table.member_seq=1 order by seq";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		
		List<MygroupDTO> result = new ArrayList<>();
		
		while(rs.next()) {
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
	
	public MemberCountDTO MemberCount(int groupSeq) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select DISTINCT GROUP_SEQ, (select count(*) from gtable_member where GROUP_SEQ = ?) count from gtable_member where GROUP_SEQ = ? ";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, groupSeq);
		pstat.setInt(2, groupSeq);
		
		ResultSet rs = pstat.executeQuery();
		List<MemberCountDTO> result = new ArrayList<>();
		MemberCountDTO dto = null;
		
		if(rs.next()) {
			dto = new MemberCountDTO();
			
			dto.setGroup_seq(rs.getInt(1));
			dto.setCount(rs.getInt(2));

		}
		
		con.close();
		rs.close();
		pstat.close();
		
		return dto;
		
	}
	
	public List<GTableDTO> groupInfo(String seq) throws Exception{
		int group_seq = Integer.parseInt(seq);
		
		Connection con = DBUtils.getConnection();
		String sql = "select * from gtable where GROUP_SEQ=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, group_seq);
		ResultSet rs = pstat.executeQuery();
		
		List<GTableDTO> result = new ArrayList<>();
		
		if(rs.next()) {
			GTableDTO dto = new GTableDTO();
			
			dto.setGroup_seq(rs.getInt("group_seq"));
			dto.setGroup_leader(rs.getString("group_leader"));
			dto.setGroup_name(rs.getString("group_name"));
			dto.setGroup_location(rs.getString("group_location"));
			dto.setGroup_interests(rs.getString("group_interests"));
			dto.setGroup_info(rs.getString("group_info"));
			dto.setOriginal_name(rs.getString("original_name"));
			dto.setSystem_name(rs.getString("system_name"));
			
			result.add(dto);
		}
		
		con.close();
		pstat.close();
		rs.close();
		
		return result;
	}
	
	
	
}









