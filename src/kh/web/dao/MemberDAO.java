package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kh.web.dto.MemberDTO;
import kh.web.utils.DBUtils;

public class MemberDAO {

	public boolean isIdPw(String email, String pw) throws Exception {

		Connection con = DBUtils.getConnection();
		String sql = "select id, pw from member where id=? and pw =?";
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

		String sql = "insert into member values(member_seq.nextval,?,?,?,'null','null','null',sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getMember_name());
		ps.setString(2, dto.getMember_email());
		ps.setString(3, dto.getPwd());

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

	public boolean login(MemberDTO mDTO) {

		try {
		Connection con = DBUtils.getConnection();

		String sql = "select * from member where member_email=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mDTO.getMember_email());
		System.out.println(mDTO.getMember_email());
		ResultSet rs = ps.executeQuery();

		rs.next();

		String dbPw = rs.getString("member_pwd");

		System.out.println("dbPw " + ":" + dbPw + " / mDTO.getPwd : " + mDTO.getPwd());

			if (dbPw.equals(mDTO.getPwd())) {
				return true;
			} else {
				return false;
			}
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public MemberDTO getAccountInfo(String loginId) throws Exception {

		Connection con = DBUtils.getConnection();
		String sql = "select * from gmember where member_email=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, loginId);

		ResultSet rs = ps.executeQuery();

		MemberDTO mDTO = new MemberDTO();

		if (rs.next()) {

			mDTO.setMember_name(rs.getString("member_name"));
			mDTO.setMember_interests(rs.getString("member_interests"));
			mDTO.setMember_picture(rs.getString("member_picture"));
			mDTO.setJoin_date(rs.getString("join_date"));
			mDTO.setMember_location(rs.getString("member_location"));

		}

		rs.close();
		ps.close();
		con.close();

		return mDTO;

	}

}
