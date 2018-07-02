package kh.web.dto;

public class SnsDTO {

	String member_seq;
	String kakao_id;
	String kakao_nickName;
	String fb_email;
	String fb_name;
	String fb_uid;
	String fb_photoURL;
	String ggid;
	String ggname;
	String ggimgUrl;
	String ggEmail;

	String naver_id;

	public String getFb_email() {
		return fb_email;
	}

	public void setFb_email(String fb_email) {
		this.fb_email = fb_email;
	}

	public String getFb_name() {
		return fb_name;
	}

	public void setFb_name(String fb_name) {
		this.fb_name = fb_name;
	}

	public String getFb_uid() {
		return fb_uid;
	}

	public void setFb_uid(String fb_uid) {
		this.fb_uid = fb_uid;
	}

	public String getGgid() {
		return ggid;
	}

	public void setGgid(String ggid) {
		this.ggid = ggid;
	}

	public String getGgname() {
		return ggname;
	}

	public void setGgname(String ggname) {
		this.ggname = ggname;
	}

	public String getGgimgUrl() {
		return ggimgUrl;
	}

	public void setGgimgUrl(String ggimgUrl) {
		this.ggimgUrl = ggimgUrl;
	}

	public String getGgEmail() {
		return ggEmail;
	}

	public void setGgEmail(String ggEmail) {
		this.ggEmail = ggEmail;
	}

	public String getKakao_nickName() {
		return kakao_nickName;
	}

	public void setKakao_nickName(String kakao_nickName) {
		this.kakao_nickName = kakao_nickName;
	}

	public SnsDTO() {
	}

	public String getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(String member_seq) {
		this.member_seq = member_seq;
	}

	public String getKakao_id() {
		return kakao_id;
	}

	public void setKakao_id(String kakao_id) {
		this.kakao_id = kakao_id;
	}

	public String getNaver_id() {
		return naver_id;
	}

	public void setNaver_id(String naver_id) {
		this.naver_id = naver_id;
	}

	public void setFb_photoURL(String fb_photoURL) {
		this.fb_photoURL = fb_photoURL;
	}

	public String getFb_photoURL() {
		return fb_photoURL;
	}

}
