package kh.web.dto;

public class MygroupDTO {
	private int seq;
	private String member_email;
	private int group_seq;
	private String group_name;
	//그룹메인 이미지
	private String system_name;
	
	


	public MygroupDTO() {
		super();
	}
	
	

	public MygroupDTO(int seq, String member_email, int group_seq, String group_name) {
		super();
		this.seq = seq;
		this.member_email = member_email;
		this.group_seq = group_seq;
		this.group_name = group_name;
	}



	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public int getGroup_seq() {
		return group_seq;
	}

	public void setGroup_seq(int group_seq) {
		this.group_seq = group_seq;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	
	public String getSystem_name() {
		return system_name;
	}



	public void setSystem_name(String system_name) {
		this.system_name = system_name;
	}

	
}
