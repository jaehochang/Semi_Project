package kh.web.dto;

public class SnsDTO {

	String member_seq;
	String kakao_id;
	String kakao_nickName;
	String facebook_id;
	String naver_id;
	
	
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
	public String getFacebook_id() {
		return facebook_id;
	}
	public void setFacebook_id(String facebook_id) {
		this.facebook_id = facebook_id;
	}
	public String getNaver_id() {
		return naver_id;
	}
	public void setNaver_id(String naver_id) {
		this.naver_id = naver_id;
	}
	
	
	
}
