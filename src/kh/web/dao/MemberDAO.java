package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kh.web.dto.MemberDTO;
import kh.web.dto.SnsDTO;
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

	public boolean signUpWithKakao(SnsDTO dto) throws Exception {

		Connection con = DBUtils.getConnection();

		String sql = "insert all into member values(member_seq.nextval,?,null,null,null,null,null,sysdate) "
				+ "into sns_id values(?,member_seq.nextval,?) " + "select * from dual";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, dto.getKakao_nickName());
		ps.setString(2, dto.getKakao_id());
		ps.setString(3, dto.getKakao_nickName());

		int result = ps.executeUpdate();

		con.commit();
		con.close();
		ps.close();

		if (result > 0) {
			return true;
		} else {
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

			String dbPw = rs.getString("pwd");

			System.out.println("dbPw " + ":" + dbPw + " / mDTO.getPwd : " + mDTO.getPwd());

			if (dbPw.equals(mDTO.getPwd())) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public MemberDTO getAccountInfo(String loginId) throws Exception {

		Connection con = DBUtils.getConnection();
		String sql = "select * from member where member_email=?";
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

	public boolean InptEmailtoAccnt(MemberDTO mDTO) throws Exception {

		Connection con = DBUtils.getConnection();

		// String getMemberCurrSeq = "select member_seq.nextval, member_seq.currval from
		// dual";
		// PreparedStatement ps = con.prepareStatement(getMemberCurrSeq);
		// ResultSet rs = ps.executeQuery();
		//
		// rs.next();
		// int currSeq = rs.getInt(2);

		// System.out.println("/currSeq " + currSeq);

		String sql = "insert all into member values(member_seq.nextval,?,?,null,null,null,null,sysdate) into sns_id values(?,?,member_seq.nextval) select * from dual";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, mDTO.getMember_name());
		ps.setString(2, mDTO.getMember_email());
		ps.setString(3, mDTO.getMember_email());
		ps.setString(4, mDTO.getMember_name());

		int result = ps.executeUpdate();
		System.out.println(result);

		con.commit();
		con.close();
		ps.close();

		if (result > 0) {
			return true;
		} else {
			return false;
		}

	}

	public boolean kakaoDplChck(SnsDTO dto) throws Exception {

		Connection con = DBUtils.getConnection();
		String sql = "select * from sns_id where kakao_id = ? and kakao_nickname=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getKakao_id());
		ps.setString(2, dto.getKakao_nickName());

		ResultSet rs = ps.executeQuery();

		System.out.println("MemberDAO.kakaodplchck : 카카오 아이디 중복 체크");

		if (rs.next()) {
			String inputKakaoId = dto.getKakao_id();
			String dbKakaoId = rs.getString("kakao_id");

			con.close();
			ps.close();
			rs.close();

			if (inputKakaoId.equals(dbKakaoId)) {
				return true;

			} else {
				return false;
			}

		} else {
			return false;
		}

	}

}
