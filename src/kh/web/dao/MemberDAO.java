package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kh.web.dto.MemberDTO;
import kh.web.dto.SnsDTO;
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
			rs.close();
			pstat.close();
			con.close();
			return true;
		} else {
			rs.close();
			pstat.close();
			con.close();
			return false;
		}

	}

	public boolean signUpWithKakao(SnsDTO dto) throws Exception {

		Connection con = DBUtils.getConnection();

		String sql = "insert all into member values(" + "member_seq.nextval," // 1 : member_seq
				+ "?," // 2: member_name
				+ "?," // 3: member_email
				+ "'null'," // 4: member_pwd
				+ "'null'," // 5: member_location
				+ "'null'," // 6: member_interests
				+ "?," // 7: member_picture
				+ "0," // 8: member_age
				+ "'undefined'," // 9 : member_gender
				+ "0," // 10:member_warning_number
				+ "sysdate," // 11:member_warningdate
				+ "sysdate," // 12: member_expiredate
				+ "sysdate," // 13: member_joindate
				+ "0," // 14: member_alarm
				+ "0)" // 15: member_isblocked
				+ "into sns_id values(" + "member_seq.nextval," // 1: member_seq
				+ "?," // 2:kakao_id
				+ "?,"// 3:kakao_nicname
				+ "?,"// 4:kakao_email
				+ "?,"// 5:kakao_photo
				+ "'null',"// 6:fb_email
				+ "'null',"// 7:fb_name
				+ "'null',"// 8:fb_uid
				+ "'null',"// 9:fb_photoURL
				+ "'null',"// 10:ggid
				+ "'null',"// 11:ggname
				+ "'null',"// 12:ggimgUrl
				+ "'null')"// 13:ggEmail
				+ "into create_group_payment values(" + "member_seq.nextval," + "?," + "'n')" + "select * from dual";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, dto.getKakao_nickname()); // 첫번째 물음표 : 이름
		ps.setString(2, dto.getKakao_email()); // 두번째 : 사진 url < 카카오프로필
		ps.setString(3, dto.getKakao_photo()); // 두번째 : 사진 url < 카카오프로필

		ps.setString(4, dto.getKakao_id());
		ps.setString(5, dto.getKakao_nickname()); // 4 : 닉네임
		ps.setString(6, dto.getKakao_email());
		ps.setString(7, dto.getKakao_photo());
		ps.setString(8, dto.getKakao_email());
		System.out.println("dto.getKakao_photo() : " + dto.getKakao_photo());
		int result = ps.executeUpdate();

		con.commit();
		con.close();
		ps.close();

		if (result > 0) {
			return true;
		} else { // unique constraint
			return false;
		}

	}

	public boolean signUpApply(MemberDTO dto) throws Exception {

		Connection con = DBUtils.getConnection();

		// 아이디 중복 검사 때리기 > 중복 있으면 해당 이메일이 존재한다는 메시지 갖게 하기

		String sql = "insert all into member values(" + "member_seq.nextval," // 1 : member_seq
				+ "?," // 2: member_name
				+ "?," // 3: member_email
				+ "?," // 4: member_pwd
				+ "'null'," // 5: member_location
				+ "'null'," // 6: member_interests
				+ "'null'," // 7: member_picture
				+ "0," // 8: member_age
				+ "'undefined'," // 9 : member_gender
				+ "0," // 10:member_warning_number
				+ "sysdate," // 11:member_warningdate
				+ "sysdate," // 12: member_expiredate
				+ "sysdate," // 13: member_joindate
				+ "0," // 14: member_alarm
				+ "0)" // 15: member_isblocked
				+ "into sns_id values(" + "member_seq.nextval," // 1: member_seq
				+ "'null'," // 2:kakao_id
				+ "'null',"// 3:kakao_nicname
				+ "'null',"// 4:kakao_email
				+ "'null',"// 5:kakao_photo
				+ "'null',"// 6:fb_email
				+ "'null',"// 7:fb_name
				+ "'null',"// 8:fb_uid
				+ "'null',"// 9:fb_photoURL
				+ "'null',"// 10:ggid
				+ "'null',"// 11:ggname
				+ "'null',"// 12:ggimgUrl
				+ "'null')"// 13:ggEmail
				+ "into create_group_payment values(" + "member_seq.nextval," + "?," + "'n')" + "select * from dual";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getMember_name());
		ps.setString(2, dto.getMember_email());
		ps.setString(3, dto.getMember_pwd());
		ps.setString(4, dto.getMember_email());
		int result = 0;

		try {
			result = ps.executeUpdate();
		} catch (Exception e) {
			if (e.getMessage().contains("unique")) { // unique 에러 발생시 Oops.jsp 뜨지 않고 false 반환하도록 기능 추가

				return false;
			}
		}

		con.commit();

		ps.close();
		con.close();

		if (result > 0) {

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

			rs.close();
			ps.close();
			con.close();

			if (dbPw.equals(mDTO.getMember_pwd())) {

				return true;

			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public MemberDTO getAccountInfo(String snsId, String loginId) throws Exception {

		System.out.println("---------------dao.getAccountInfo------------------");
		Connection con = DBUtils.getConnection();
		String sql = "select * from member where member_email=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, loginId);

		ResultSet rs = ps.executeQuery();

		MemberDTO mDTO = new MemberDTO();

		boolean isThereLoginId = rs.next();

		if (isThereLoginId) { // 로긴 아이디를 점검해봤더니
			System.out.println(1);
			mDTO.setMember_name(rs.getString("member_name"));
			mDTO.setMember_email(rs.getString("member_email"));
			mDTO.setMember_interests(rs.getString("member_interests"));
			mDTO.setMember_picture(rs.getString("member_picture"));
			mDTO.setMember_joindate(rs.getString("member_joindate"));
			mDTO.setMember_location(rs.getString("member_location"));
			mDTO.setMember_gender(rs.getString("member_gender"));
			mDTO.setMember_age(rs.getString("member_age"));

		} else if (!isThereLoginId) { // 없으면 카톡 아이디와 비교
			System.out.println(2);
			String searchKakaoId = "select * from member m,sns_id s where (m.member_seq = s.member_seq) and ( kakao_id= ?)";
			PreparedStatement psKakao = con.prepareStatement(searchKakaoId);
			psKakao.setString(1, snsId);
			ResultSet krs = psKakao.executeQuery();

			if (krs.next()) { // 카카오 아이디 있으면 카카오 계정 정보 mDTO에 담기
				System.out.println(3);
				mDTO.setMember_name(krs.getString("kakao_nickname"));
				mDTO.setMember_email(krs.getString("member_email"));
				mDTO.setMember_interests(krs.getString("member_interests"));
				mDTO.setMember_picture(krs.getString("kakao_photo"));
				mDTO.setMember_joindate(krs.getString("member_joindate"));
				mDTO.setMember_location(krs.getString("member_location"));
				mDTO.setMember_gender(krs.getString("member_gender"));
				mDTO.setMember_age(krs.getString("member_age"));

			} else { // 이메일로도, 카톡 아이디로도 없으면, 페북 uid로 검색해보기

				System.out.println(4);
				String searchFbId = "select * from member m,sns_id s where (m.member_seq = s.member_seq) and (fb_uid=?)";
				PreparedStatement psFb = con.prepareStatement(searchFbId);
				psFb.setString(1, snsId);
				ResultSet frs = psFb.executeQuery();

				if (frs.next()) { // 페북 아이디 있으면 mDTO에 페북 정보 담기

					mDTO.setMember_name(frs.getString("fb_name"));
					mDTO.setMember_email(frs.getString("member_email"));
					mDTO.setMember_interests(frs.getString("member_interests"));
					mDTO.setMember_picture(frs.getString("fb_photourl"));
					mDTO.setMember_joindate(frs.getString("member_joindate"));
					mDTO.setMember_location(frs.getString("member_location"));
					mDTO.setMember_gender(frs.getString("member_gender"));
					mDTO.setMember_age(frs.getString("member_age"));

				} else { // 이메일/카톡//페북uid와도 맞지않으면 ggId 테이블과 검색하기

					System.out.println("구글 id와 검사");
					System.out.println(5);
					String searchGgId = "select * from member m,sns_id s where (m.member_seq = s.member_seq) and (ggid=?)";
					PreparedStatement gps = con.prepareStatement(searchGgId);
					gps.setString(1, snsId);
					ResultSet grs = ps.executeQuery();

					if (grs.next()) { // 있으면 담기
						System.out.println("db에 현 login 정보 존재, mDTO에 담기");
						System.out.println(6);
						mDTO.setMember_name(grs.getString("ggname"));
						mDTO.setMember_email(grs.getString("member_email"));
						mDTO.setMember_interests(grs.getString("member_interests"));
						mDTO.setMember_picture(grs.getString("ggimgurl"));
						mDTO.setMember_joindate(grs.getString("member_joindate"));
						mDTO.setMember_location(grs.getString("member_location"));
						mDTO.setMember_gender(grs.getString("member_gender"));
						mDTO.setMember_age(grs.getString("member_age"));

					} else {
						System.out.println(7);
						System.out.println("/MemberDAO.getAccountInfo : 해당하는 로그인 아이디 없음  > 회원가입 페이지로 이동");
						return null; // null 보내주기
					}

				}
			}
		}

		rs.close();
		ps.close();
		con.close();

		System.out.println("로그인 검사 후 mDTO 리턴");

		return mDTO;

	}

	public boolean InptEmailtoAccnt(MemberDTO mDTO, SnsDTO sDTO) throws Exception {

		Connection con = DBUtils.getConnection();

		String sql = "insert all into member values(member_seq.nextval,?,?,'qwe','당산','코딩','sj.png','남자',0,sysdate,sysdate,sysdate,0,0)"
				+ "into sns_id values(member_seq.nextval,?,?) "
				+ "into create_group_payment values(member_seq.nextval,?,'n')" + "select * from dual";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, mDTO.getMember_name()); // 첫번째 물음표 : 이름
		ps.setString(2, mDTO.getMember_email()); // 두번째 물음표 : 카톡 로그인 이메일

		// sns_id 테이블에 들어갈 값
		ps.setString(3, sDTO.getKakao_id());// kakaoId
		// ps.setString(4, sDTO.getKakao_nickName());// 카카오 닉네임
		ps.setString(5, mDTO.getMember_email());
		int result = ps.executeUpdate();
		System.out.println("/InptEmailtoAccnt 성공? = 1 이상은 성공 : " + result);

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
		String sql = "select * from sns_id where kakao_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getKakao_id());

		ResultSet rs = ps.executeQuery();

		boolean isThisKakaoIdExist = rs.next();

		if (isThisKakaoIdExist) {
			String inputKakaoId = dto.getKakao_id();
			String dbKakaoId = rs.getString("kakao_id");

			rs.close();
			ps.close();
			con.close();

			System.out.println("inputKakaoId : " + inputKakaoId + " / dbKakaoId : " + dbKakaoId);

			System.out.println("MemberDAO.kakaoDplChck : 해당 카톡 아이디 있음");

			return true; // 해당 카톡 아이디 있음. 이미 중복 됨

		} else {
			System.out.println("해당 카톡 아이디 없음");
			return false; // 해당 카톡 아이디가 없음 만들 여지 줘야함
		}

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
		// System.out.println("subject: " + subject);
		System.out.println("text: " + text);
		Connection con = DBUtils.getConnection();
		String sql = null;
		// if (subject.equals("member_email")) {
		sql = "select * from "
				+ "(select member.*, floor(sysdate - member_expiredate) as bdate , row_number() over(order by member_joindate) as num from member) "
				+ "where num between ? and ? and member_email like '%' || ? || '%'";
		// } else if (subject.equals("member_name")) {
		// sql = "select * from "
		// + "(select member.*, floor(sysdate - member_expiredate) as bdate ,
		// row_number() over(order by member_joindate) as num from member) "
		// + "where num between ? and ? and member_name like '%' || ? || '%'";
		// }
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

	public boolean isKakaoIdExist(String loginKakaoId) throws Exception {

		// loginKakaoId = 유저의 암호화된 카카오 로그인 아이디
		// dbKakaoId = 회원 가입을 통해 저장된 암호화된 카카오 로그인 아이디
		Connection con = DBUtils.getConnection();

		String sql = "select * from sns_id where kakao_id=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, loginKakaoId);

		ResultSet rs = ps.executeQuery();

		rs.next();

		String dbKakaoId = rs.getString("kakao_id");

		System.out.println(dbKakaoId + "/" + loginKakaoId);

		rs.close();
		ps.close();
		con.close();

		if (dbKakaoId.equals(loginKakaoId)) {
			return true; // 아이디 db 내에 존재 : 통과 시킬 true 값 보내기
		} else {
			return false;
		}

	}

	public boolean isThisFbIdExist(String fbId) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from sns_id where fb_id=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, fbId);
		ResultSet rs = ps.executeQuery();

		boolean result = false;

		if (rs.next()) {
			result = true;

		} else {
			result = false;
		}

		rs.close();
		ps.close();
		con.close();

		return result;

	}

	public boolean signUpWithFb(SnsDTO sDTO) throws Exception {

		Connection con = DBUtils.getConnection();
		String sql = "insert all into member values(" + "member_seq.nextval," // 1 : member_seq
				+ "?," // 2: member_name
				+ "?," // 3: member_email
				+ "'null'," // 4: member_pwd
				+ "'null'," // 5: member_location
				+ "'null'," // 6: member_interests
				+ "?," // 7: member_picture
				+ "0," // 8: member_age
				+ "'undefined'," // 9 : member_gender
				+ "0," // 10:member_warning_number
				+ "sysdate," // 11:member_warningdate
				+ "sysdate," // 12: member_expiredate
				+ "sysdate," // 13: member_joindate
				+ "0," // 14: member_alarm
				+ "0)" // 15: member_isblocked
				+ "into sns_id values(" + "member_seq.nextval," // 1: member_seq
				+ "'null'," // 2:kakao_id
				+ "'null',"// 3:kakao_nicname
				+ "'null',"// 4:kakao_email
				+ "'null',"// 5:kakao_photo
				+ "?,"// 6:fb_email
				+ "?,"// 7:fb_name
				+ "?,"// 8:fb_uid
				+ "?,"// 9:fb_photoURL
				+ "'null',"// 10:ggid
				+ "'null',"// 11:ggname
				+ "'null',"// 12:ggimgUrl
				+ "'null')"// 13:ggEmail
				+ "into create_group_payment values(" + "member_seq.nextval," + "?," // email
				+ "'n')" // pay:n
				+ "select * from dual";
		// + "into create_group_payment values(" + "member_seq.nextval," + "?," + "'n')"
		// + "select * from dual";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, sDTO.getFb_name()); // 이름
		ps.setString(2, sDTO.getFb_email());
		ps.setString(3, sDTO.getFb_photoURL());

		ps.setString(4, sDTO.getFb_email());
		ps.setString(5, sDTO.getFb_name());
		ps.setString(6, sDTO.getFb_uid());
		ps.setString(7, sDTO.getFb_photoURL());
		ps.setString(8, sDTO.getFb_email());

		int result = 0;

		try {
			result = ps.executeUpdate();
			System.out.println("result :" + result);
		} catch (Exception e) {
			e.printStackTrace();
			if (e.getMessage().contains("unique")) { // unique 에러 발생시 error.html 뜨지 않고 false 반환하도록 기능 추가

				return false;
			}
		}

		con.commit();
		ps.close();
		con.close();

		if (result > 0) {
			return true;
		} else {
			return false;
		}

	}

	public boolean isFbUidExist(SnsDTO sDTO) throws Exception {

		Connection con = DBUtils.getConnection();
		String sql = "select * from sns_id where fb_uid = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, sDTO.getFb_uid());
		ResultSet rs = ps.executeQuery();

		boolean result = rs.next();

		rs.close();
		ps.close();
		con.close();

		if (result) {
			return true; // 해당 페북 uid 로 아이디 존재함 > signUpWithFaceBook.co 로 결과값 보내기
		} else {
			return false;
		}
	}

	public boolean SignUpWithGoogle(SnsDTO sDTO) {

		int insertTrial = 0;
		try {
			Connection con = DBUtils.getConnection();

			boolean result = this.isGgIdExist(sDTO);

			System.out.println("/isGgIdExist.result :" + result);

			boolean regSccss = false;

			if (result) { // 중복성 검사 결과 이미 존재하는 경우

				return regSccss; // false 보내기

			} else {

				String sql = "insert all into member values(" + "member_seq.nextval," // 1 : member_seq
						+ "?," // 2: member_name
						+ "?," // 3: member_email
						+ "'null'," // 4: member_pwd
						+ "'null'," // 5: member_location
						+ "'null'," // 6: member_interests
						+ "?," // 7: member_picture

						+ "0," // 8: member_age
						+ "'undefined'," // 9 : member_gender
						+ "0," // 10:member_warning_number
						+ "sysdate," // 11: member_warningdate
						+ "sysdate," // 12: member_expiredate
						+ "sysdate," // 13: member_joindate
						+ "0," // 14: member_alarm
						+ "0)" // 15: member_isblocked
						+ "into sns_id values(" + "member_seq.nextval," // 1: member_seq
						+ "'null'," // 2:kakao_id
						+ "'null',"// 3:kakao_nicname
						+ "'null',"// 4:kakao_email
						+ "'null',"// 5:kakao_photo
						+ "'null',"// 6:fb_email
						+ "'null',"// 7:fb_name
						+ "'null',"// 8:fb_uid
						+ "'null',"// 9:fb_photoURL

						+ "?,"// 10:ggid
						+ "?,"// 11:ggname
						+ "?,"// 12:ggimgUrl
						+ "?)"// 13:ggEmail
						+ "into create_group_payment values(" + "member_seq.nextval," + "?," + "'n')"
						+ "select * from dual";

				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, sDTO.getGgname());
				ps.setString(2, sDTO.getGgEmail());
				ps.setString(3, sDTO.getGgimgUrl());

				ps.setString(4, sDTO.getGgid());
				ps.setString(5, sDTO.getGgname());
				ps.setString(6, sDTO.getGgimgUrl());
				ps.setString(7, sDTO.getGgEmail());

				ps.setString(8, sDTO.getGgEmail());

				insertTrial = ps.executeUpdate();
				System.out.println("/signUpWithGoogle result :" + insertTrial);

				con.commit();
				ps.close();
				con.close();

			}
		} catch (Exception e) {
			if (e.getMessage().contains("unique")) {// 이메일 중복으로 에러시 false 반환
				System.out.println("이메일 중복으로 회원가입 불가");
				return false;
			} else {
				e.printStackTrace();
			}
		}

		if (insertTrial > 0) {
			System.out.println("return true");
			return true;// 회원 생성 성공
		} else {
			return false;// 회원 생성 실패
		}

	}

	public boolean isGgIdExist(SnsDTO sDTO) throws Exception {
		Connection con = DBUtils.getConnection();

		String sql = "select * from sns_id where ggid = ? ";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, sDTO.getGgid());

		ResultSet rs = ps.executeQuery();

		boolean result = false;
		if (rs.next()) {
			result = true; // 아이디 중복 검사 결과, 이미 회원가입한 페이스북 id가 있음
		} else {
			result = false; // 없음
		}

		rs.close();
		ps.close();
		con.close();

		return result;

	}

	public boolean isThisEmailExist(String member_email) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from member where member_email = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, member_email);

		ResultSet rs = ps.executeQuery();
		boolean result = rs.next();

		rs.close();
		ps.close();
		con.close();

		if (result) {
			return true;

		} else {
			return false;
		}
	}

	public String memberName(String email) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select member_name from member where member_email=?";

		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, email);
		ResultSet rs = pstat.executeQuery();
		rs.next();
		String name = rs.getString("member_name");

		rs.close();
		pstat.close();
		con.close();

		return name;
	}

	// public String getProfilePhoto(MemberDTO dto) throws Exception {
	// Connection con = DBUtils.getConnection();
	// String sql = "select kakao_photo,fb_photourl,ggimgurl from sns_id where
	// member_seq = ?";
	// PreparedStatement ps = con.prepareStatement(sql);
	// ps.setInt(1, dto.getMember_seq());
	//
	// ResultSet rs = ps.executeQuery();
	//
	// String kakaoPhotoUrl;
	// String fbPhotoUrl;
	// String ggImgUrl;
	//
	// if (rs.next()) {
	//
	// kakaoPhotoUrl = rs.getString("kakao_photo");
	// fbPhotoUrl = rs.getString("fb_photourl");
	// ggImgUrl = rs.getString("ggimgurl");
	//
	//
	//
	// }

	public boolean isMyGroup(String email) throws Exception {

		Connection con = DBUtils.getConnection();
		String sql = "select member_email from mygroup";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();

		if (rs.next()) {
			rs.close();
			pstat.close();
			con.close();
			return true;
		} else {
			rs.close();
			pstat.close();
			con.close();
			return false;

		}
	}

	public Boolean singin(String id, String pw) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select member.*, floor(sysdate-member_expiredate) from member"
				+ " where floor(sysdate-member_expiredate)<0 and member_email =? and member_pwd=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, id);
		pstat.setString(2, pw);
		ResultSet rs = pstat.executeQuery();
		Boolean bool = true;

		if (rs.next()) {
			bool = true;
		} else {
			bool = false;
		}
		rs.close();
		pstat.close();
		con.close();

		return bool;
	}
	


}
