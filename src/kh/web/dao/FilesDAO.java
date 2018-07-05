package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kh.web.dto.GroupPicDTO;
import kh.web.utils.DBUtils;

public class FilesDAO {
	public int groupMainPic(String systemName, int group_seq) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "update create_group set group_picture =? where group_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		
		pstat.setString(1, systemName);
		pstat.setInt(2, group_seq);
		
		int result = pstat.executeUpdate();
		
		con.commit();
		pstat.close();
		con.close();
		
		return result;
	}
	
	public int addGroupPic(GroupPicDTO dto) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "insert into group_picture values(group_picture_seq.nextval,?,?,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		
		pstat.setInt(1, dto.getGroup_seq());
		pstat.setString(2, dto.getOriginal_name());
		pstat.setString(3, dto.getSystem_name());
		
		int result = pstat.executeUpdate();
		
		con.commit();
		pstat.close();
		con.close();
		
		return result;
		
	}
	
}
