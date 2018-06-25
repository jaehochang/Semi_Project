package kh.web.dto;

public class MygroupDTO {
	private int seq;
	private int member_seq;
	private int group_seq;
	private String group_name;
	private String system_name;
	
	public MygroupDTO() {
		super();
	}
	
	

	public MygroupDTO(int seq, int member_seq, int group_seq, String group_name, String system_name) {
		super();
		this.seq = seq;
		this.member_seq = member_seq;
		this.group_seq = group_seq;
		this.group_name = group_name;
		this.system_name = system_name;
	}



	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
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
