package kh.web.dto;

public class GroupMemberDTO {
	private int group_member_seq;
	private String member_name;
	private int group_seq;
	private String join_date;
	private String group_name;

	public GroupMemberDTO() {
		super();
	}

	public GroupMemberDTO(int group_member_seq, String member_name, int group_seq, String join_date,
			String group_name) {
		super();
		this.group_member_seq = group_member_seq;
		this.member_name = member_name;
		this.group_seq = group_seq;
		this.join_date = join_date;
		this.group_name = group_name;
	}

	public int getGroup_member_seq() {
		return group_member_seq;
	}

	public void setGroup_member_seq(int group_member_seq) {
		this.group_member_seq = group_member_seq;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getGroup_seq() {
		return group_seq;
	}

	public void setGroup_seq(int group_seq) {
		this.group_seq = group_seq;
	}

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

}
