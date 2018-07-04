package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kh.web.utils.DBUtils;

public class AdminDAO {
	public boolean loginAdmin(String id, String pw) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from admin where admin_id=? and admin_pw=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, id);
		pstat.setString(2, pw);
		ResultSet rs = pstat.executeQuery();
		boolean result = true;
		
		if(rs.next()) {
			result = true;
		}else {
			result = false;
		}
		
		rs.close();
		pstat.close();
		con.close();
		
		return result;
	}
}
