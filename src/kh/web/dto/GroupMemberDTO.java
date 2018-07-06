package kh.web.dto;

import java.sql.Date;

public class GroupMemberDTO {
	private int group_member_seq;
	private String member_name;
	private int group_seq;
	private Date join_date;
	private String group_name;
	private String member_picture;
	private String group_leader;
	private String member_email;

	public GroupMemberDTO() {
		super();
	}


	public GroupMemberDTO(int group_member_seq, String member_name, int group_seq, Date join_date,
			String member_email, String group_name, String member_picture, String group_leader) {
		super();
		this.group_member_seq = group_member_seq;
		this.member_name = member_name;
		this.group_seq = group_seq;
		this.join_date = join_date;
		this.member_email = member_email;
		this.group_name = group_name;
		this.member_picture = member_picture;
		this.group_leader = group_leader;
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


	public Date getJoin_date() {
		return join_date;
	}


	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}


	public String getMember_email() {
		return member_email;
	}


	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}


	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getMember_picture() {
		return member_picture;
	}

	public void setMember_picture(String member_picture) {
		this.member_picture = member_picture;
	}

	public String getGroup_leader() {
		return group_leader;
	}

	public void setGroup_leader(String group_leader) {
		this.group_leader = group_leader;
	}

	
	
	
}
