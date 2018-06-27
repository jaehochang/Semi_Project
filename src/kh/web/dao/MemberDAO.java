package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

		String sql = "insert into gmember values(member_seq.nextval,?,?,?,'null','null',sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getMember_name());
		ps.setString(2, dto.getMember_email());
		ps.setString(3, dto.getMember_pwd());

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

		System.out.println("dbPw " + ":" + dbPw + " / mDTO.getPwd : " + mDTO.getMember_pwd());

		con.close();
		rs.close();
		ps.close();

		if (dbPw.equals(mDTO.getMember_pwd())) {
			return true;

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
			mDTO.setMember_joindate(rs.getString("member_joindate"));
			mDTO.setMember_location(rs.getString("member_location"));

		}

		rs.close();
		ps.close();
		con.close();

		return mDTO;

	}

	// 인형 admin--------------------------------------------------------------

	public int plusWarningNumber(String member_email) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "update member set member_warningnumber = member_warningnumber+1, "
				+ "member_isblocked = 1, member_warningdate = sysdate, "
				+ "member_expiredate = sysdate+7 where member_email = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, member_email);
		int result = pstat.executeUpdate();

		con.commit();
		pstat.close();
		con.close();

		return result;
	}

	public MemberDTO getMember(String member_email) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select member.*, floor(sysdate - member_expiredate) as bdate from member where member_email = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, member_email);
		ResultSet rs = pstat.executeQuery();
		MemberDTO mdto = new MemberDTO();

		while (rs.next()) {
			mdto.setMember_seq(rs.getInt("member_seq"));
			mdto.setMember_name(rs.getString("member_name"));
			mdto.setMember_email(rs.getString("member_email"));
			mdto.setMember_pwd(rs.getString("member_pwd"));
			mdto.setMember_location(rs.getString("member_location"));
			mdto.setMember_interests(rs.getString("member_interests"));
			mdto.setMember_picture(rs.getString("member_picture"));
			mdto.setMember_gender(rs.getString("member_gender"));
			mdto.setMember_warningnumber(rs.getInt("member_warningnumber"));
			mdto.setMember_warningdate(rs.getString("member_warningdate"));
			mdto.setMember_expiredate(rs.getString("member_expiredate"));
			mdto.setMember_joindate(rs.getString("member_joindate"));
			mdto.setMember_alarm(rs.getInt("member_alarm"));
			mdto.setMember_isblocked(rs.getInt("member_isblocked"));
			if (rs.getString("bdate") != null) {
				mdto.setMember_betweendate(rs.getInt("bdate"));
			}
		}
		rs.close();
		pstat.close();
		con.close();

		return mdto;
	}

	public List<MemberDTO> getAllMember() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select member.*, floor(sysdate - member_expiredate) as bdate from member order by member_seq desc";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		List<MemberDTO> result = new ArrayList<>();
		while (rs.next()) {
			MemberDTO mdto = new MemberDTO();
			mdto.setMember_seq(rs.getInt("member_seq"));
			mdto.setMember_name(rs.getString("member_name"));
			mdto.setMember_email(rs.getString("member_email"));
			mdto.setMember_pwd(rs.getString("member_pwd"));
			mdto.setMember_location(rs.getString("member_location"));
			mdto.setMember_interests(rs.getString("member_interests"));
			mdto.setMember_picture(rs.getString("member_picture"));
			mdto.setMember_gender(rs.getString("member_gender"));
			mdto.setMember_warningnumber(rs.getInt("member_warningnumber"));
			mdto.setMember_warningdate(rs.getString("member_warningdate"));
			mdto.setMember_expiredate(rs.getString("member_expiredate"));
			mdto.setMember_joindate(rs.getString("member_joindate"));
			mdto.setMember_alarm(rs.getInt("member_alarm"));
			mdto.setMember_isblocked(rs.getInt("member_isblocked"));
			if (rs.getString("bdate") != null) {
				mdto.setMember_betweendate(rs.getInt("bdate"));
			}
			result.add(mdto);
		}
		rs.close();
		pstat.close();
		con.close();

		return result;
	}

	public int getDate(String member_email) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select floor(sysdate - member_expiredate) as day from member where member_email = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, member_email);
		ResultSet rs = pstat.executeQuery();
		int result = 0;

		while (rs.next()) {
			result = rs.getInt("day");
		}

		rs.close();
		pstat.close();
		con.close();

		return result;
	}

	// 가입날짜별로 순위를 매겨서 출력한다.
	public List<MemberDTO> memberList(int startNum, int endNum, String text) throws Exception {
		System.out.println("startNum : " + startNum);
		System.out.println("endNum: " + endNum);
//		System.out.println("subject: " + subject);
		System.out.println("text: " + text);
		Connection con = DBUtils.getConnection();
		String sql = null;
//		if (subject.equals("member_email")) {
			sql = "select * from "
					+ "(select member.*, floor(sysdate - member_expiredate) as bdate , row_number() over(order by member_joindate) as num from member) "
					+ "where num between ? and ? and member_email like '%' || ? || '%'";
//		} else if (subject.equals("member_name")) {
//			sql = "select * from "
//					+ "(select member.*, floor(sysdate - member_expiredate) as bdate , row_number() over(order by member_joindate) as num from member) "
//					+ "where num between ? and ? and member_name like '%' || ? || '%'";
//		}
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
		pstat.setString(3, text);
		ResultSet rs = pstat.executeQuery();
		List<MemberDTO> result = new ArrayList();

		while (rs.next()) {
			MemberDTO mdto = new MemberDTO();
			mdto.setMember_seq(rs.getInt("member_seq"));
			mdto.setMember_name(rs.getString("member_name"));
			mdto.setMember_email(rs.getString("member_email"));
			mdto.setMember_pwd(rs.getString("member_pwd"));
			mdto.setMember_location(rs.getString("member_location"));
			mdto.setMember_interests(rs.getString("member_interests"));
			mdto.setMember_picture(rs.getString("member_picture"));
			mdto.setMember_gender(rs.getString("member_gender"));
			mdto.setMember_warningnumber(rs.getInt("member_warningnumber"));
			mdto.setMember_warningdate(rs.getString("member_warningdate"));
			mdto.setMember_expiredate(rs.getString("member_expiredate"));
			mdto.setMember_joindate(rs.getString("member_joindate"));
			mdto.setMember_alarm(rs.getInt("member_alarm"));
			mdto.setMember_isblocked(rs.getInt("member_isblocked"));
			if (rs.getString("bdate") != null) {
				mdto.setMember_betweendate(rs.getInt("bdate"));
			}
			result.add(mdto);
		}
		rs.close();
		pstat.close();
		con.close();

		return result;
	}

	// -----------------------Paging--------------------------
	public String getPageNavi(int currentPageNo, String text) throws Exception {

		Connection con = DBUtils.getConnection();
		String sql = "select count(*) as totalCount from member where member_email like '%' || ? || '%'";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, text);
		ResultSet rs = pstat.executeQuery();
		rs.next();

		int recordTotalCount = rs.getInt("totalCount");// rs.getInt("totalCount");
														// // 전체 글(레코드)의 개수를
														// 저장하는 변수
		int recordCountPerPage = 10; // 한 페이지에 게시글이 몇개 보일건지
		int naviCountPerPage = 10; // 한 페이지에서 네비게이터가 몇개씩 보일건지
		int pageTotalCount = 0; // 전체가 몇 페이지로 구성 될것인지

		if (recordTotalCount % recordCountPerPage > 0) {// 정확히 10으로 나누어 떨어지지 않는
														// 경우
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		// --------------------------------------------------------
		int currentPage = currentPageNo;

		if (currentPage < 1) { // 페이지 네비를 클릭해서 들어오는게 아니라 url에 페이지 번호를 입력해서 들어오는
								// 경우
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		// 현재 페이지가 비정상인지 검증하는 코드
		// --------------------------------------------------------

		// 네비게이터 스타트번호와 끝번호 나타내기
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
		// 네비게이터가 시작 값; 딱 떨어지는 값의 시작페이지가 이상하기 때문에 1을 빼줘야한다.
		// currentPage / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1); // 네비게이터 끝 값

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}

		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if (needPrev) {
			sb.append("<a href='member.ao?currentPage=" + (startNavi - 1) + "'> < </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (currentPage == i) {
				sb.append("<a href='member.ao?currentPage=" + i + "'> <b>" + i + "</b></a>");
			} else {
				sb.append("<a href='member.ao?currentPage=" + i + "'>" + i + "</a>");
			}

		}

		if (needNext) {
			sb.append("<a href='member.ao?currentPage=" + (endNavi + 1) + "'> > </a>");
		}

		pstat.close();
		con.close();

		return sb.toString();
	}

}
