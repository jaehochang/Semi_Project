package kh.web.dto;

public class MemberDTO {

	
	String member_seq;
	String member_name;
	String member_email;
	String pwd;
	String member_location;
	String member_interests;
	String member_picture;
	String join_date;
	String kakaoId;
	
	public String getKakaoId() {
		return kakaoId;
	}


	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}


	public String getJoin_date() {
		return join_date;
	}


	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}


	public MemberDTO() {
		
	}


	public String getMember_seq() {
		return member_seq;
	}


	public void setMember_seq(String member_seq) {
		this.member_seq = member_seq;
	}


	public String getMember_name() {
		return member_name;
	}


	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}


	public String getMember_email() {
		return member_email;
	}


	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getMember_location() {
		return member_location;
	}


	public void setMember_location(String member_location) {
		this.member_location = member_location;
	}


	public String getMember_interests() {
		return member_interests;
	}


	public void setMember_interests(String member_interests) {
		this.member_interests = member_interests;
	}


	public String getMember_picture() {
		return member_picture;
	}


	public void setMember_picture(String member_picture) {
		this.member_picture = member_picture;
	}

	
	
}
