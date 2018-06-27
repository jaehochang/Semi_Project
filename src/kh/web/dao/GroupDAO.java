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
		String sql = "select * from create_group";
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

		con.close();
		rs.close();
		pstat.close();

		return result;
	}

	public List<GtablePictureDTO> allgroupsPictures() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from group_picture";
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
		String sql = "select mygroup_seq, system_name, group_name,group_picture.group_seq from group_picture join mygroup on group_picture.group_seq = mygroup.group_seq where mygroup.member_seq=1 order by mygroup_seq";
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
		String sql = "select DISTINCT GROUP_SEQ, (select count(*) from group_member where GROUP_SEQ = ?) count from group_member where GROUP_SEQ = ? ";
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
	public List<String> DistanceSearch(String lat, String lng, String distance) throws Exception{

		Connection con = DBUtils.getConnection();
		
		double latitude = Double.parseDouble(lat);
		
		double longitude =Double.parseDouble(lng);
		
		String sql = "select group_name, group_lat, group_lng from create_group";
		PreparedStatement pstat = con.prepareStatement(sql);
		
		ResultSet rs = pstat.executeQuery();
		List<String> fiveList = new ArrayList<>();
		List<String> tenList = new ArrayList<>();
		List<String> fifteenList = new ArrayList<>();
		List<String> allList = new ArrayList<>();
		System.out.println(1);
		while(rs.next()) {

			String dbGroupName = rs.getString("group_name");
			double dbGroupLat = Double.parseDouble(rs.getString("group_lat"));
			double dbGroupLng = Double.parseDouble(rs.getString("group_lng"));
			System.out.println(11);
			double theta = longitude - dbGroupLng;
			double dist = Math.sin(deg2rad(latitude)) * Math.sin(deg2rad(dbGroupLat)) + Math.cos(deg2rad(latitude))
			*Math.cos(deg2rad(dbGroupLat)) * Math.cos(deg2rad(theta));

			dist = Math.acos(dist);
			dist = rad2deg(dist);
			dist = dist * 60 * 1.1515;
			dist = dist * 1.609344; //km일때
			//		 	 dist = dist * 1609.344; meter 일때
			
			if(dist <= 5) {
				fiveList.add(dbGroupName);
			}
			if(dist <= 10) {
				tenList.add(dbGroupName);
			}
			if(dist <= 15) {
				fifteenList.add(dbGroupName);
			}
			if(dist != 0) {
				allList.add(dbGroupName);
			}
			
		}
		
		if(distance.equals("5")) {
			
			return fiveList;
		}else if(distance.equals("10")) {
			
			
			return tenList;
		}else if(distance.equals("15")) {
			
			return fifteenList;
		}
		else {
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
