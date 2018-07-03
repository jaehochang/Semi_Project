package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
