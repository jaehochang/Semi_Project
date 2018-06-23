package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kh.web.dto.MemberDTO;
import kh.web.utils.DBUtils;

public class MemberDAO {

	public boolean isIdPw(String email, String pw) throws Exception {

		Connection con = DBUtils.getConnection();
		String sql = "select id, pw from members where id=? and pw =?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, email);
		pstat.setString(2, pw);

		ResultSet rs = pstat.executeQuery();
		if (rs.next()) {
			con.close();
			pstat.close();
			return true;
		} else {
			con.close();
			pstat.close();
			return false;
		}

	}

	public boolean signUpApply(MemberDTO dto) throws Exception {

		Connection con = DBUtils.getConnection();

		String sql = "insert into member values(?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getName());
		ps.setString(2, dto.getEmail());
		ps.setString(3, dto.getPw());

		int rs = ps.executeUpdate();

		con.commit();
		con.close();
		ps.close();
		
		
		if (rs > 0) {
			
			return true;
	
		} else {
		
			return false;
		
		}

	
	}

}
