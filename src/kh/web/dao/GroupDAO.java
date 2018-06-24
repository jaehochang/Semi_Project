package kh.web.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kh.web.dto.GTableDTO;
import kh.web.dto.GtablePictureDTO;
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
			dto.setGroup_seq(rs.getInt(1));
			dto.setGroup_leader(rs.getString(2));
			dto.setGroup_name(rs.getString(3));
			dto.setGroup_location(rs.getString(4));
			dto.setGroup_interests(rs.getString(5));
			dto.setGroup_info(rs.getString(6));
			
			result.add(dto);
		}
		
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
		
		return result;
	}
	
	public List<MygroupDTO> myGroupList() throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select system_name, group_name from gtable_picture join mygroup_table "
				+ "on gtable_picture.group_seq = mygroup_table.group_seq where mygroup_table.member_seq=1";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		
		List<MygroupDTO> result = new ArrayList<>();
		
		while(rs.next()) {
			MygroupDTO dto = new MygroupDTO();
			
			dto.setGroup_name(rs.getString("group_name"));
			dto.setSystem_name(rs.getString("system_name"));
			
			result.add(dto);
		}
		
		return result;
	}
	
}
