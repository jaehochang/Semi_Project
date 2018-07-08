package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kh.web.dto.GroupDTO;
import kh.web.dto.MemberDTO;
import kh.web.dto.ReportDTO;
import kh.web.utils.DBUtils;

public class ReportDAO {
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

	public int insertMemberReport(String caller, String calleeMember, String reason, String etc_reason)
			throws Exception {
		Connection con = DBUtils.getConnection();
		String group = "";
		String sql = "insert into report values(?,?,?,0,sysdate,0,?,report_seq.nextval,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, caller);
		pstat.setString(2, calleeMember);
		pstat.setString(3, reason);
		pstat.setString(4, group);
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

	// 가입날짜별로 순위를 매겨서 출력한다.
		public List<ReportDTO> memberReportList(int startNum, int endNum, String subject, String text) throws Exception {
			System.out.println("startNum : " + startNum);
			System.out.println("endNum: " + endNum);
			System.out.println("text: " + text);
			Connection con = DBUtils.getConnection();
			String sql = null;

			sql = "select * from report r, member m where r.report_calleemember=m.member_email and "
					+ " "+subject+" like ? order by report_date desc";

			PreparedStatement pstat = con.prepareStatement(sql);
			pstat.setString(1, "%" + text + "%");
//			pstat.setInt(2, startNum);
//			pstat.setInt(3, endNum);
			ResultSet rs = pstat.executeQuery();
			List<ReportDTO> result = new ArrayList<>();

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
				result.add(rdto);
			}
			rs.close();
			pstat.close();
			con.close();

			return result;
		}


		// -----------------------Paging--------------------------
		public String memberReportPageNavi(int currentPageNo, String subject, String text) throws Exception {

			System.out.println("paging text: " + text);

			Connection con = DBUtils.getConnection();
			String sql = "select count(*) as totalCount from report where " + subject + " like ?";
			PreparedStatement pstat = con.prepareStatement(sql);
			pstat.setString(1, '%'+text+'%');
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
				sb.append("<li><a href='memberreport.ao?currentPage=" + (startNavi - 1)
						+ "'aria-label='Previous'><span aria-hidden='true'>&raquo;</span></a></li>");
			}

			for (int i = startNavi; i <= endNavi; i++) {
				if (currentPage == i) {
					sb.append("<li><a href='memberreport.ao?currentPage=" + i + "&subject=" + subject + "&text=" + text + "'> <b>"
							+ i + "</b></a></li>");
				} else {
					sb.append("<li><a href='memberreport.ao?currentPage=" + i + "&subject=" + subject + "&text=" + text + "'>" + i
							+ "</a></li>");

				}

				if (needNext) {
					sb.append("<a href='memberreport.ao?currentPage=" + (endNavi + 1)
							+ "'aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>");
				}
				pstat.close();
				con.close();

			}
			return sb.toString();
		}
	
		
		// 가입날짜별로 순위를 매겨서 출력한다.
				public List<ReportDTO> groupReportList(int startNum, int endNum, String subject, String text) throws Exception {
					System.out.println("startNum : " + startNum);
					System.out.println("endNum: " + endNum);
					System.out.println("text: " + text);
					Connection con = DBUtils.getConnection();
					String sql = null;

					sql = "select * from report r, create_group g where r.report_calleegroup=g.group_name and "
							+ " "+subject+" like ? order by report_date desc";

					PreparedStatement pstat = con.prepareStatement(sql);
					pstat.setString(1, "%" + text + "%");
//					pstat.setInt(2, startNum);
//					pstat.setInt(3, endNum);
					ResultSet rs = pstat.executeQuery();
					List<ReportDTO> result = new ArrayList<>();

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
						result.add(rdto);
					}
					rs.close();
					pstat.close();
					con.close();

					return result;
				}


				// -----------------------Paging--------------------------
				public String groupReportPageNavi(int currentPageNo, String subject, String text) throws Exception {

					System.out.println("paging text: " + text);

					Connection con = DBUtils.getConnection();
					String sql = "select count(*) as totalCount from report where " + subject + " like ?";
					PreparedStatement pstat = con.prepareStatement(sql);
					pstat.setString(1, '%'+text+'%');
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
						sb.append("<li><a href='groupreport.ao?currentPage=" + (startNavi - 1)
								+ "'aria-label='Previous'><span aria-hidden='true'>&raquo;</span></a></li>");
					}

					for (int i = startNavi; i <= endNavi; i++) {
						if (currentPage == i) {
							sb.append("<li><a href='groupreport.ao?currentPage=" + i + "&subject=" + subject + "&text=" + text + "'> <b>"
									+ i + "</b></a></li>");
						} else {
							sb.append("<li><a href='groupreport.ao?currentPage=" + i + "&subject=" + subject + "&text=" + text + "'>" + i
									+ "</a></li>");

						}

						if (needNext) {
							sb.append("<a href='groupreport.ao?currentPage=" + (endNavi + 1)
									+ "'aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>");
						}
						pstat.close();
						con.close();

					}
					return sb.toString();
				}
	
	
	// Report관련 DAO끝

}
