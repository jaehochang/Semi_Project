package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kh.web.dto.GroupDTO;
import kh.web.dto.GroupMemberDTO;
import kh.web.dto.MeetingDTO;
import kh.web.dto.MemberDTO;
import kh.web.dto.ReportDTO;
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

		if (rs.next()) {
			result = true;
		} else {
			result = false;
		}

		rs.close();
		pstat.close();
		con.close();

		return result;
	}

	// member관련 DAO 시작-------------------------------------
	public int getMemberCount(String distinc) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = null;
		if (distinc.equals("all")) {
			sql = "select count(*) as count from member";
		} else if (distinc.equals("today")) {
			sql = "select count(*) as count from member where to_char(sysdate,'yyyymmdd') = to_char(member_joindate, 'yyyymmdd')";
		}
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		int result = 0;
		if (rs.next()) {
			result = rs.getInt("count");
		}

		rs.close();
		pstat.close();
		con.close();

		return result;
	}

	public int plusMemberWarningNumber(String member_email) throws Exception {
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

	public ReportDTO reportMemJoin(String member_email) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select m.*,r.* from member m, report r where m.member_email = r.report_calleemember and m.member_email=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, member_email);
		ResultSet rs = pstat.executeQuery();
		ReportDTO rdto = new ReportDTO();

		while (rs.next()) {
			rdto.setReport_calleemember(rs.getString("report_calleemember"));
			rdto.setReport_calleegroup(rs.getString("report_calleegroup"));
			rdto.setReport_caller(rs.getString("report_caller"));
			rdto.setReport_date(rs.getString("report_date"));
			rdto.setReport_reason(rs.getString("report_reason"));
			rdto.setReport_state(rs.getInt("report_state"));
			rdto.setReport_type(rs.getInt("report_type"));
			rdto.setReport_seq(rs.getInt("report_seq"));
			rdto.setReport_etcreason(rs.getString("report_etcreason"));
			rdto.setWarningnumber(rs.getInt("member_warningnumber"));
			rdto.setCallee(rs.getString("member_email"));
			rdto.setWarningdate(rs.getString("member_warningdate"));
			rdto.setExpiredate(rs.getString("member_expiredate"));
		}
		rs.close();
		pstat.close();
		con.close();

		return rdto;
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

	public Map<String, Object> memGroupMemJoin(String member_name) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from member m , group_member gm"
				+ " where m.member_name = gm.member_name and m.member_name=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, member_name);
		ResultSet rs = pstat.executeQuery();
		List<MemberDTO> mlist = new ArrayList<>();
		List<GroupMemberDTO> gmlist = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();

		while (rs.next()) {
			MemberDTO mdto = new MemberDTO();
			GroupMemberDTO gmdto = new GroupMemberDTO();
			mdto.setMember_interests(rs.getString("member_interests"));
			gmdto.setGroup_name(rs.getString("group_name"));
			mlist.add(mdto);
			gmlist.add(gmdto);
		}
		map.put("mlist", mlist);
		map.put("gmlist", gmlist);

		rs.close();
		pstat.close();
		con.close();

		return map;

	}

	// 가입날짜별로 순위를 매겨서 출력한다.
	public List<MemberDTO> memberList(int startNum, int endNum, String subject, String text) throws Exception {
		System.out.println("startNum : " + startNum);
		System.out.println("endNum: " + endNum);
		System.out.println("text: " + text);
		Connection con = DBUtils.getConnection();
		String sql = null;

		sql = "select * from (select member.*, floor(sysdate - member_expiredate) as bdate ,"
				+ " row_number() over(order by member_joindate) as num from member where "+subject+" like ?)"
				+ " where (num between ? and ?)";
		
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, "%"+text+"%");
		pstat.setInt(2, startNum);
		pstat.setInt(3, endNum);
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

	// public List<MemberDTO> searchMemberList(int startNum, int endNum, String
	// subject, String text) throws Exception {
	// Connection con = DBUtils.getConnection();
	// String sql = "select * from "
	// + "(select member.*, floor(sysdate - member_expiredate) as bdate ,
	// row_number() over(order by member_joindate) as num from member) "
	// + "where num between ? and ? and " + subject + " like '%' || ? || '%'";
	// PreparedStatement pstat = con.prepareStatement(sql);
	// pstat.setInt(1, startNum);
	// pstat.setInt(2, endNum);
	// pstat.setString(3, text);
	// ResultSet rs = pstat.executeQuery();
	// List<MemberDTO> result = new ArrayList();
	//
	// while (rs.next()) {
	// MemberDTO mdto = new MemberDTO();
	// mdto.setMember_seq(rs.getInt("member_seq"));
	// mdto.setMember_name(rs.getString("member_name"));
	// mdto.setMember_email(rs.getString("member_email"));
	// mdto.setMember_pwd(rs.getString("member_pwd"));
	// mdto.setMember_location(rs.getString("member_location"));
	// mdto.setMember_interests(rs.getString("member_interests"));
	// mdto.setMember_picture(rs.getString("member_picture"));
	// mdto.setMember_gender(rs.getString("member_gender"));
	// mdto.setMember_warningnumber(rs.getInt("member_warningnumber"));
	// mdto.setMember_warningdate(rs.getString("member_warningdate"));
	// mdto.setMember_expiredate(rs.getString("member_expiredate"));
	// mdto.setMember_joindate(rs.getString("member_joindate"));
	// mdto.setMember_alarm(rs.getInt("member_alarm"));
	// mdto.setMember_isblocked(rs.getInt("member_isblocked"));
	// if (rs.getString("bdate") != null) {
	// mdto.setMember_betweendate(rs.getInt("bdate"));
	// }
	// result.add(mdto);
	// }
	// rs.close();
	// pstat.close();
	// con.close();
	//
	// return result;
	// }

	// -----------------------Paging--------------------------
	public String getMemberPageNavi(int currentPageNo, String subject, String text) throws Exception {

		System.out.println("paging text: " + text);

		Connection con = DBUtils.getConnection();
		String sql = "select count(*) as totalCount from member where "+subject+" like '%' || ? || '%'";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, text);
		ResultSet rs = pstat.executeQuery();
		rs.next();

		int recordTotalCount = rs.getInt("totalCount"); // rs.getInt("totalCount");
														// 전체 글(레코드)의 개수를
														// 저장하는 변수
		System.out.println("DAO record:" + recordTotalCount);
		int recordCountPerPage = 10; // 한 페이지에 게시글이 몇개 보일건지
		int naviCountPerPage = 10; // 한 페이지에서 네비게이터가 몇개씩 보일건지
		int pageTotalCount = 0; // 전체가 몇 페이지로 구성 될것인지

		if (recordTotalCount % recordCountPerPage > 0) {// 정확히 10으로 나누어 떨어지지 않는 경우
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
			System.out.println("if-pageTotalCount:" + pageTotalCount);
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
			System.out.println("else-pageTotalCount:" + pageTotalCount);
		}

		// --------------------------------------------------------
		int currentPage = currentPageNo;

		if (currentPage < 1) { // 페이지 네비를 클릭해서 들어오는게 아니라 url에 페이지 번호를 입력해서 들어오는 경우
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		System.out.println("currentPage:" + currentPage);
		// 현재 페이지가 비정상인지 검증하는 코드
		// --------------------------------------------------------

		// 네비게이터 스타트번호와 끝번호 나타내기
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
		// 네비게이터가 시작 값; 딱 떨어지는 값의 시작페이지가 이상하기 때문에 1을 빼줘야한다.
		// currentPage / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1); // 네비게이터 끝 값

		System.out.println("startNavi:" + startNavi);
		System.out.println("endNavi:" + endNavi);

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
			sb.append("<li><a href='member.ao?currentPage=" + (startNavi - 1)
					+ "'aria-label='Previous'><span aria-hidden='true'>&raquo;</span></a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (currentPage == i) {
				sb.append("<li><a href='member.ao?currentPage=" + i + "&subject="+subject+"&text=" + text + "'> <b>" + i + "</b></a></li>");
			} else {
				sb.append("<li><a href='member.ao?currentPage=" + i + "&subject="+subject+"&text=" + text + "'>" + i + "</a></li>");

			}

			if (needNext) {
				sb.append("<a href='member.ao?currentPage=" + (endNavi + 1)
						+ "'aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>");
			}
			pstat.close();
			con.close();

		}
		return sb.toString();
	}

	// member관련 DAO 끝-------------------------------------

	// Group관련 DAO 시작-------------------------------------

	public int getGroupCount(String distinc) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = null;
		if (distinc.equals("all")) {
			sql = "select count(*) as count from create_group";
		} else if (distinc.equals("today")) {
			sql = "select count(*) as count from create_group where to_char(sysdate,'yyyymmdd') = to_char(group_createdate, 'yyyymmdd')";
		}
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		int result = 0;
		if (rs.next()) {
			result = rs.getInt("count");
		}

		rs.close();
		pstat.close();
		con.close();

		return result;
	}

	public int groupMemberCount(int group_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select count(*) as gmcount from group_member where group_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, group_seq);
		ResultSet rs = pstat.executeQuery();
		int count = 0;
		if (rs.next()) {
			count = rs.getInt("gmcount");
		}
		rs.close();
		pstat.close();
		con.close();

		return count;

	}

	public List<GroupMemberDTO> getGroupMember(int group_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select gm.* from create_group cg, group_member gm"
				+ " where cg.group_seq = gm.group_seq and gm.group_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, group_seq);
		ResultSet rs = pstat.executeQuery();
		List<GroupMemberDTO> list = new ArrayList<>();

		while (rs.next()) {
			GroupMemberDTO dto = new GroupMemberDTO();
			dto.setGroup_member_seq(rs.getInt("group_member_seq"));
			dto.setMember_name(rs.getString("member_name"));
			dto.setGroup_seq(rs.getInt("group_seq"));
			dto.setJoin_date(rs.getDate("join_date"));
			dto.setGroup_name(rs.getString("group_name"));
			list.add(dto);
		}
		rs.close();
		pstat.close();
		con.close();

		return list;
	}

	public int plusGroupWarningNumber(String group_name) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "update create_group set group_warningnumber = group_warningnumber + 1, "
				+ "group_isblocked = 1, group_warningdate = sysdate, "
				+ "group_expiredate = sysdate+7 where group_name = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, group_name);
		int result = pstat.executeUpdate();

		con.commit();
		pstat.close();
		con.close();

		return result;
	}

	public GroupDTO getGroupData(int group_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select create_group.*, floor(sysdate - group_expiredate) as bdate from create_group where group_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, group_seq);
		ResultSet rs = pstat.executeQuery();
		GroupDTO gdto = new GroupDTO();

		if (rs.next()) {
			gdto.setGroup_seq(rs.getInt("group_seq"));
			gdto.setGroup_leader(rs.getString("group_leader"));
			gdto.setGroup_name(rs.getString("group_name"));
			gdto.setGroup_location(rs.getString("group_location"));
			gdto.setGroup_interests(rs.getString("group_interests"));
			gdto.setGroup_info(rs.getString("group_info"));
			gdto.setGroup_picture(rs.getString("group_picture"));
			gdto.setGroup_warningdate(rs.getString("group_warningdate"));
			gdto.setGroup_warningnumber(rs.getInt("group_warningnumber"));
			gdto.setGroup_expiredate(rs.getString("group_expiredate"));
			gdto.setGroup_isblocked(rs.getInt("group_isblocked"));
			gdto.setGroup_createdate(rs.getString("group_createdate"));
			gdto.setGroup_alarm(rs.getInt("group_alarm"));
			gdto.setGroup_lat(rs.getString("group_lat"));
			gdto.setGroup_lng(rs.getString("group_lng"));
			if (rs.getString("bdate") != null) {
				gdto.setGroup_betweendate(rs.getInt("bdate"));
			}
		}
		rs.close();
		pstat.close();
		con.close();
		return gdto;
	}

	public GroupDTO getGroupDataByName(String group_name) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select create_group.*, floor(sysdate - group_expiredate) as bdate from create_group where group_name=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, group_name);
		ResultSet rs = pstat.executeQuery();
		GroupDTO gdto = new GroupDTO();

		if (rs.next()) {
			gdto.setGroup_seq(rs.getInt("group_seq"));
			gdto.setGroup_leader(rs.getString("group_leader"));
			gdto.setGroup_name(rs.getString("group_name"));
			gdto.setGroup_location(rs.getString("group_location"));
			gdto.setGroup_interests(rs.getString("group_interests"));
			gdto.setGroup_info(rs.getString("group_info"));
			gdto.setGroup_picture(rs.getString("group_picture"));
			gdto.setGroup_warningdate(rs.getString("group_warningdate"));
			gdto.setGroup_warningnumber(rs.getInt("group_warningnumber"));
			gdto.setGroup_expiredate(rs.getString("group_expiredate"));
			gdto.setGroup_isblocked(rs.getInt("group_isblocked"));
			gdto.setGroup_createdate(rs.getString("group_createdate"));
			gdto.setGroup_alarm(rs.getInt("group_alarm"));
			gdto.setGroup_lat(rs.getString("group_lat"));
			gdto.setGroup_lng(rs.getString("group_lng"));
			if (rs.getString("bdate") != null) {
				gdto.setGroup_betweendate(rs.getInt("bdate"));
			}
		}
		rs.close();
		pstat.close();
		con.close();
		return gdto;
	}

	public List<GroupDTO> searchGroupList(int startNum, int endNum, String subject, String text) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = null;
		
		sql = "select * from (select create_group.*, floor(sysdate - group_expiredate) as bdate ,"
				+ " row_number() over(order by group_createdate) as num from create_group where "+subject+" like '%' || ? || '%' )"
				+ " where (num between ? and ?)";
		
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, text);
		pstat.setInt(2, startNum);
		pstat.setInt(3, endNum);
		ResultSet rs = pstat.executeQuery();
		List<GroupDTO> result = new ArrayList<>();

		while (rs.next()) {
			GroupDTO gdto = new GroupDTO();
			gdto.setGroup_seq(rs.getInt("group_seq"));
			gdto.setGroup_leader(rs.getString("group_leader"));
			gdto.setGroup_name(rs.getString("group_name"));
			gdto.setGroup_location(rs.getString("group_location"));
			gdto.setGroup_interests(rs.getString("group_interests"));
			gdto.setGroup_info(rs.getString("group_info"));
			gdto.setGroup_picture(rs.getString("group_picture"));
			gdto.setGroup_warningdate(rs.getString("group_warningdate"));
			gdto.setGroup_warningnumber(rs.getInt("group_warningnumber"));
			gdto.setGroup_expiredate(rs.getString("group_expiredate"));
			gdto.setGroup_isblocked(rs.getInt("group_isblocked"));
			gdto.setGroup_createdate(rs.getString("group_createdate"));
			gdto.setGroup_alarm(rs.getInt("group_alarm"));
			gdto.setGroup_lat(rs.getString("group_lat"));
			gdto.setGroup_lng(rs.getString("group_lng"));
			if (rs.getString("bdate") != null) {
				gdto.setGroup_betweendate(rs.getInt("bdate"));
			}
			result.add(gdto);
		}
		rs.close();
		pstat.close();
		con.close();

		return result;
	}

	public List<GroupDTO> allGroupList(int startNum, int endNum, String subject, String text) throws Exception {
		System.out.println("startNum : " + startNum);
		System.out.println("endNum: " + endNum);
		System.out.println("subject:" + subject);
		System.out.println("text: " + text);
		Connection con = DBUtils.getConnection();
		String sql = null;
		sql = "select * from (select create_group.*, floor(sysdate - group_expiredate) as bdate ,"
				+ " row_number() over(order by group_createdate) as num from create_group where "+subject+" like '%' || ? || '%')"
				+ " where (num between ? and ?)";

		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, text);
		pstat.setInt(2, startNum);
		pstat.setInt(3, endNum);
		ResultSet rs = pstat.executeQuery();
		List<GroupDTO> result = new ArrayList<>();

		while (rs.next()) {
			GroupDTO gdto = new GroupDTO();
			gdto.setGroup_seq(rs.getInt("group_seq"));
			gdto.setGroup_leader(rs.getString("group_leader"));
			gdto.setGroup_name(rs.getString("group_name"));
			gdto.setGroup_location(rs.getString("group_location"));
			gdto.setGroup_interests(rs.getString("group_interests"));
			gdto.setGroup_info(rs.getString("group_info"));
			gdto.setGroup_picture(rs.getString("group_picture"));
			gdto.setGroup_warningdate(rs.getString("group_warningdate"));
			gdto.setGroup_warningnumber(rs.getInt("group_warningnumber"));
			gdto.setGroup_expiredate(rs.getString("group_expiredate"));
			gdto.setGroup_isblocked(rs.getInt("group_isblocked"));
			gdto.setGroup_createdate(rs.getString("group_createdate"));
			gdto.setGroup_alarm(rs.getInt("group_alarm"));
			gdto.setGroup_lat(rs.getString("group_lat"));
			gdto.setGroup_lng(rs.getString("group_lng"));
			if (rs.getString("bdate") != null) {
				gdto.setGroup_betweendate(rs.getInt("bdate"));
			}
			result.add(gdto);
		}
		rs.close();
		pstat.close();
		con.close();

		return result;
	}

	// -----------------------Paging--------------------------
	public String getGroupPageNavi(int currentPageNo, String subject, String text) throws Exception {

		Connection con = DBUtils.getConnection();
		if (subject == null) {
			subject = "group_name";
		}
		String sql = "select count(*) as totalCount from create_group where " + subject + " like ? ";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, "%"+text+"%");
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
			sb.append("<li><a href='group.ao?currentPage=" + (startNavi - 1)
					+ "'aria-label='Previous'><span aria-hidden='true'>&raquo;</span></a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (currentPage == i) {
				sb.append("<li><a href='group.ao?currentPage=" + i + "&subject="+subject+"&text=" + text + "' > <b>" + i + "</b></a></li>");
			} else {
				sb.append("<li><a href='group.ao?currentPage=" + i + "&subject="+subject+"&text=" + text +  "'>" + i + "</a></li>");
			}

		}

		if (needNext) {
			sb.append("<a href='group.ao?currentPage=" + (endNavi + 1)
					+ "'aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>");
		}

		pstat.close();
		con.close();

		return sb.toString();
	}
	// Group관련 DAO 끝-------------------------------------

	// Meeting관련 DAO 시작
	public int getMeetingCount(String distinc) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = null;
		if (distinc.equals("all")) {
			sql = "select count(*) as count from meeting";
		} else if (distinc.equals("today")) {
			sql = "select count(*) as count from meeting where to_char(sysdate,'yyyymmdd') = to_char(meeting_start_time, 'yyyymmdd')";
		}
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		int result = 0;
		if (rs.next()) {
			result = rs.getInt("count");
		}

		rs.close();
		pstat.close();
		con.close();

		return result;
	}

	public List<MeetingDTO> allMeetingList(int startNum, int endNum, String subject, String text) throws Exception {
		System.out.println("startNum : " + startNum);
		System.out.println("endNum: " + endNum);
		System.out.println("subject:" + subject);
		System.out.println("text: " + text);
		Connection con = DBUtils.getConnection();
		if (subject == null) {
			subject = "meeting_title";
		}
		String sql = null;
		sql = "select * from " + "(select meeting.*, row_number() over(order by meeting_seq) as num from meeting) "
				+ "where num between ? and ? and " + subject + " like '%' || ? || '%'";

		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
		pstat.setString(3, text);
		ResultSet rs = pstat.executeQuery();
		List<MeetingDTO> list = new ArrayList();

		while (rs.next()) {
			MeetingDTO mdto = new MeetingDTO();
			mdto.setMeeting_seq(rs.getInt("meeting_seq"));
			mdto.setGroup_seq(rs.getInt("group_seq"));
			mdto.setGroup_name(rs.getString("group_name"));
			mdto.setGroup_leader(rs.getString("group_leader"));
			mdto.setMeeting_title(rs.getString("meeting_title"));
			mdto.setMeeting_contents(rs.getString("meeting_contents"));
			mdto.setMeeting_start_time(rs.getDate("meeting_start_time"));
			mdto.setMeeting_end_time(rs.getDate("meeting_end_time"));
			mdto.setMeeting_location(rs.getString("meeting_location"));
			mdto.setMeeting_picture(rs.getString("meeting_picture"));
			mdto.setMeeting_lat(rs.getString("meeting_lat"));
			mdto.setMeeting_lng(rs.getString("meeting_lng"));
			list.add(mdto);
		}
		rs.close();
		pstat.close();
		con.close();

		return list;
	}

	// -----------------------Paging--------------------------
	public String getMeetingPageNavi(int currentPageNo, String subject, String text) throws Exception {

		Connection con = DBUtils.getConnection();
		if (subject == null) {
			subject = "meeting_title";
		}
		String sql = "select count(*) as totalCount from meeting where " + subject + " like '%' || ? || '%'";
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
			sb.append("<li><a href='meeting.ao?currentPage=" + (startNavi - 1)
					+ "'aria-label='Previous'><span aria-hidden='true'>&raquo;</span></a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (currentPage == i) {
				sb.append("<li><a href='meeting.ao?currentPage=" + i + "' > <b>" + i + "</b></a></li>");
			} else {
				sb.append("<li><a href='meeting.ao?currentPage=" + i + "'>" + i + "</a></li>");
			}

		}

		if (needNext) {
			sb.append("<a href='meeting.ao?currentPage=" + (endNavi + 1)
					+ "'aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>");
		}

		pstat.close();
		con.close();

		return sb.toString();
	}

	public List<MeetingDTO> searchMeetingList(int startNum, int endNum, String subject, String text) throws Exception {
		System.out.println("dao subject: " + subject);
		System.out.println("dao text: " + text);
		Connection con = DBUtils.getConnection();
		String sql = "select * from "
				+ "(select meeting.*, row_number() over(order by meeting_start_time) as num from meeting) " + "where "
				+ subject + " like '%' || ? || '%'";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, text);
		ResultSet rs = pstat.executeQuery();
		List<MeetingDTO> result = new ArrayList();

		while (rs.next()) {
			MeetingDTO mdto = new MeetingDTO();
			mdto.setMeeting_seq(rs.getInt("meeting_seq"));
			mdto.setGroup_seq(rs.getInt("group_seq"));
			mdto.setGroup_name(rs.getString("group_name"));
			mdto.setGroup_leader(rs.getString("group_leader"));
			mdto.setMeeting_title(rs.getString("meeting_title"));
			mdto.setMeeting_contents(rs.getString("meeting_contents"));
			mdto.setMeeting_start_time(rs.getDate("meeting_start_time"));
			mdto.setMeeting_end_time(rs.getDate("meeting_end_time"));
			mdto.setMeeting_location(rs.getString("meeting_location"));
			mdto.setMeeting_picture(rs.getString("meeting_picture"));
			mdto.setMeeting_lat(rs.getString("meeting_lat"));
			mdto.setMeeting_lng(rs.getString("meeting_lng"));
			result.add(mdto);
		}
		rs.close();
		pstat.close();
		con.close();

		return result;
	}

	// Meeting관련 DAO 끝-----------------------------

	// Report관련 DAO시작------------------------------
	public ReportDTO getReportData(int report_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from report where report_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, report_seq);
		ResultSet rs = pstat.executeQuery();
		ReportDTO rdto = new ReportDTO();

		if (rs.next()) {
			rdto.setReport_calleemember(rs.getString("report_calleemember"));
			rdto.setReport_calleegroup(rs.getString("report_calleegroup"));
			rdto.setReport_caller(rs.getString("report_caller"));
			rdto.setReport_date(rs.getString("report_date"));
			rdto.setReport_reason(rs.getString("report_reason"));
			rdto.setReport_state(rs.getInt("report_state"));
			rdto.setReport_type(rs.getInt("report_type"));
			rdto.setReport_seq(rs.getInt("report_seq"));
		}

		rs.close();
		pstat.close();
		con.close();

		return rdto;
	}

	public MemberDTO memReportJoin(int report_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select member.*, floor(sysdate - member_expiredate) as bdate from member where member_email ="
				+ " (select report_calleemember from report where report_seq=?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, report_seq);
		ResultSet rs = pstat.executeQuery();
		MemberDTO mdto = new MemberDTO();

		if (rs.next()) {
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

	public GroupDTO groupReportJoin(int report_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select create_group.*, floor(sysdate - group_expiredate) as bdate from create_group where group_name ="
				+ " (select report_calleegroup from report where report_seq=?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, report_seq);
		ResultSet rs = pstat.executeQuery();
		GroupDTO gdto = new GroupDTO();

		if (rs.next()) {
			gdto.setGroup_seq(rs.getInt("group_seq"));
			gdto.setGroup_leader(rs.getString("group_leader"));
			gdto.setGroup_name(rs.getString("group_name"));
			gdto.setGroup_location(rs.getString("group_location"));
			gdto.setGroup_interests(rs.getString("group_interests"));
			gdto.setGroup_info(rs.getString("group_info"));
			gdto.setGroup_picture(rs.getString("group_picture"));
			gdto.setGroup_warningdate(rs.getString("group_warningdate"));
			gdto.setGroup_warningnumber(rs.getInt("group_warningnumber"));
			gdto.setGroup_expiredate(rs.getString("group_expiredate"));
			gdto.setGroup_isblocked(rs.getInt("group_isblocked"));
			gdto.setGroup_createdate(rs.getString("group_createdate"));
			gdto.setGroup_alarm(rs.getInt("group_alarm"));
			gdto.setGroup_lat(rs.getString("group_lat"));
			gdto.setGroup_lng(rs.getString("group_lng"));
			if (rs.getString("bdate") != null) {
				gdto.setGroup_betweendate(rs.getInt("bdate"));
			}
		}
		rs.close();
		pstat.close();
		con.close();

		return gdto;
	}

	public ReportDTO reportGroupJoin(int group_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select g.*,r.* from create_group g, report r where g.group_name = r.report_calleegroup and g.group_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, group_seq);
		ResultSet rs = pstat.executeQuery();
		ReportDTO rdto = new ReportDTO();

		while (rs.next()) {
			rdto.setReport_calleemember(rs.getString("report_calleemember"));
			rdto.setReport_calleegroup(rs.getString("report_calleegroup"));
			rdto.setReport_caller(rs.getString("report_caller"));
			rdto.setReport_date(rs.getString("report_date"));
			rdto.setReport_reason(rs.getString("report_reason"));
			rdto.setReport_state(rs.getInt("report_state"));
			rdto.setReport_type(rs.getInt("report_type"));
			rdto.setReport_seq(rs.getInt("report_seq"));
			rdto.setReport_etcreason(rs.getString("report_etcreason"));
			rdto.setWarningnumber(rs.getInt("group_warningnumber"));
			rdto.setCallee(rs.getString("group_seq"));
			rdto.setWarningdate(rs.getString("group_warningdate"));
			rdto.setExpiredate(rs.getString("group_expiredate"));
		}
		rs.close();
		pstat.close();
		con.close();

		return rdto;
	}

	public int getReportCount(String distinc) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = null;
		if (distinc.equals("all")) {
			sql = "select count(*) as count from report where report_state=0";
		} else if (distinc.equals("today")) {
			sql = "select count(*) as count from report where to_char(sysdate,'yyyymmdd') = to_char(report_date, 'yyyymmdd')";
		}
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		int result = 0;
		if (rs.next()) {
			result = rs.getInt("count");
		}

		rs.close();
		pstat.close();
		con.close();

		return result;
	}

	/*
	 * public List<ReportDTO> getAllReport(int type) throws Exception { Connection
	 * con = DBUtils.getConnection(); String sql =
	 * "select * from report where report_type = ?"; PreparedStatement pstat =
	 * con.prepareStatement(sql); pstat.setInt(1, type); ResultSet rs =
	 * pstat.executeQuery(); List<ReportDTO> list = new ArrayList<>();
	 * 
	 * while (rs.next()) { ReportDTO rdto = new ReportDTO();
	 * rdto.setReport_calleemember(rs.getString("report_calleemember"));
	 * rdto.setReport_calleegroup(rs.getString("report_calleegroup"));
	 * rdto.setReport_caller(rs.getString("report_caller"));
	 * rdto.setReport_date(rs.getString("report_date"));
	 * rdto.setReport_reason(rs.getString("report_reason"));
	 * rdto.setReport_state(rs.getInt("report_state"));
	 * rdto.setReport_type(rs.getInt("report_type"));
	 * rdto.setReport_seq(rs.getInt("report_seq")); list.add(rdto); }
	 * 
	 * rs.close(); pstat.close(); con.close();
	 * 
	 * return list; }
	 */

	public List<ReportDTO> getDeleteProcMember() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select distinct member_seq, m.*,r.report_caller,r.report_reason,r.report_etcreason"+
				" ,r.report_calleemember, r.report_date,r.report_type from member m, report r"+ 
				" where m.member_email = r.report_calleemember and m.member_warningnumber = 2";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		List<ReportDTO> rlist = new ArrayList<>();

		while (rs.next()) {
			ReportDTO rdto = new ReportDTO();
			rdto.setReport_calleemember(rs.getString("report_calleemember"));
			rdto.setReport_caller(rs.getString("report_caller"));
			rdto.setReport_date(rs.getString("report_date"));
			rdto.setReport_reason(rs.getString("report_reason"));
			rdto.setReport_etcreason(rs.getString("report_etcreason"));
			rdto.setReport_type(rs.getInt("report_type"));
			rdto.setWarningnumber(rs.getInt("member_warningnumber"));
			rdto.setCallee(rs.getString("member_email"));
			rdto.setWarningdate(rs.getString("member_warningdate"));
			rdto.setExpiredate(rs.getString("member_expiredate"));
			rdto.setSeq(rs.getInt("member_seq"));
			rlist.add(rdto);
		}

		rs.close();
		pstat.close();
		con.close();

		return rlist;
	}

//	public List<ReportDTO> getDeleteProcGroup() throws Exception {
//		Connection con = DBUtils.getConnection();
//		String sql = "select distinct group_seq, g.*, r.report_caller,r.report_reason,r.report_etcreason"+ 
//		" r.report_calleegroup, r.report_date,r.report_type from create_group g, report r where g.group_name = r.report_calleegroup and g.group_warningnumber = 2";
//		PreparedStatement pstat = con.prepareStatement(sql);
//		ResultSet rs = pstat.executeQuery();
//		List<ReportDTO> rlist = new ArrayList<>();
//
//		while (rs.next()) {
//			ReportDTO rdto = new ReportDTO();
//			rdto.setReport_calleegroup(rs.getString("report_calleegroup"));
//			rdto.setReport_caller(rs.getString("report_caller"));
//			rdto.setReport_date(rs.getString("report_date"));
//			rdto.setReport_reason(rs.getString("report_reason"));
//			rdto.setReport_etcreason(rs.getString("report_etcreason"));
//			rdto.setReport_type(rs.getInt("report_type"));
//			rdto.setWarningnumber(rs.getInt("group_warningnumber"));
//			rdto.setCallee(rs.getString("group_leader"));
//			rdto.setWarningdate(rs.getString("group_warningdate"));
//			rdto.setExpiredate(rs.getString("group_expiredate"));
//			rdto.setSeq(rs.getInt("group_seq"));
//			rlist.add(rdto);
//		}
//
//		rs.close();
//		pstat.close();
//		con.close();
//
//		return rlist;
//	}

	public List<ReportDTO> getAllReport(String distinc) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "";
		if (distinc.equals("member")) {
			sql = "select m.*, r.*, floor(sysdate - member_expiredate) as bdate from member m, report r where m.member_email = r.report_calleemember";
		} else if (distinc.equals("group")) {
			sql = "select cg.*, r.*, floor(sysdate - group_expiredate) as bdate from create_group cg, report r where cg.group_name = r.report_calleegroup";
		}
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		List<ReportDTO> rlist = new ArrayList<>();

		if (distinc.equals("member")) {
			while (rs.next()) {
				ReportDTO rdto = new ReportDTO();
				rdto.setReport_calleemember(rs.getString("report_calleemember"));
				rdto.setReport_calleegroup(rs.getString("report_calleegroup"));
				rdto.setReport_caller(rs.getString("report_caller"));
				rdto.setReport_date(rs.getString("report_date"));
				rdto.setReport_reason(rs.getString("report_reason"));
				rdto.setReport_state(rs.getInt("report_state"));
				rdto.setReport_type(rs.getInt("report_type"));
				rdto.setReport_seq(rs.getInt("report_seq"));
				rdto.setWarningnumber(rs.getInt("member_warningnumber"));
				rdto.setCallee(rs.getString("member_email"));
				rdto.setWarningdate(rs.getString("member_warningdate"));
				rdto.setExpiredate(rs.getString("member_expiredate"));
				rdto.setSeq(rs.getInt("member_seq"));
				rlist.add(rdto);
			}
		} else if (distinc.equals("group")) {
			while (rs.next()) {
				ReportDTO rdto = new ReportDTO();
				rdto.setReport_calleemember(rs.getString("report_calleemember"));
				rdto.setReport_calleegroup(rs.getString("report_calleegroup"));
				rdto.setReport_caller(rs.getString("report_caller"));
				rdto.setReport_date(rs.getString("report_date"));
				rdto.setReport_reason(rs.getString("report_reason"));
				rdto.setReport_state(rs.getInt("report_state"));
				rdto.setReport_type(rs.getInt("report_type"));
				rdto.setReport_seq(rs.getInt("report_seq"));
				rdto.setWarningnumber(rs.getInt("group_warningnumber"));
				rdto.setCallee(rs.getString("group_leader"));
				rdto.setWarningdate(rs.getString("group_warningdate"));
				rdto.setExpiredate(rs.getString("group_expiredate"));
				rdto.setSeq(rs.getInt("group_seq"));
				rlist.add(rdto);
			}
		}

		rs.close();
		pstat.close();
		con.close();

		return rlist;
	}

	public int modifyMemberReportState(String member_email, int report_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "update report set report_state = 1 where REPORT_CALLEEMEMBER = ? and report_state=0 and report_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, member_email);
		pstat.setInt(2, report_seq);
		int result = pstat.executeUpdate();

		con.commit();
		pstat.close();
		con.close();

		return result;
	}

	public int modifyGroupReportState(String group_name, int report_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "update report set report_state = 1 where REPORT_CALLEEGROUP = ? and report_state=0 and report_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, group_name);
		pstat.setInt(2, report_seq);
		int result = pstat.executeUpdate();

		con.commit();
		pstat.close();
		con.close();

		return result;
	}

	public int insertGroupReport(String member_email, String group_name, String report_reason, String etc_reason)
			throws Exception {
		String member = "";
		Connection con = DBUtils.getConnection();
		String sql = "insert into report values(?,?,?,0,sysdate,1,?,report_seq.nextval,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, member_email);
		pstat.setString(2, member);
		pstat.setString(3, report_reason);
		pstat.setString(4, group_name);
		pstat.setString(5, etc_reason);
		int result = pstat.executeUpdate();

		if (result > 0) {
			System.out.println("신고성공!!");
		}

		con.commit();
		pstat.close();
		con.close();

		return result;
	}
	// Report관련 DAO끝

	public String getPageNavi(int currentPage, String text) {
		// TODO Auto-generated method stub
		return null;
	}

}

