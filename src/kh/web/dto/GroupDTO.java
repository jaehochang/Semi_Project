package kh.web.dto;

public class GroupDTO {
	private int group_seq;
	private String group_leader;
	private String group_name;
	private String group_location;
	private String group_interests;
	private String group_info;
	
	
	public GroupDTO() {}
	
	public GroupDTO(int group_seq, String group_leader, String group_name, String group_location,
			String group_interests, String group_info) {
		super();
		this.group_seq = group_seq;
		this.group_leader = group_leader;
		this.group_name = group_name;
		this.group_location = group_location;
		this.group_interests = group_interests;
		this.group_info = group_info;
	}



	public int getGroup_seq() {
		return group_seq;
	}

	public void setGroup_seq(int group_seq) {
		this.group_seq = group_seq;
	}

	public String getGroup_leader() {
		return group_leader;
	}

	public void setGroup_leader(String group_leader) {
		this.group_leader = group_leader;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getGroup_location() {
		return group_location;
	}

	public void setGroup_location(String group_location) {
		this.group_location = group_location;
	}

	public String getGroup_interests() {
		return group_interests;
	}

	public void setGroup_interests(String group_interests) {
		this.group_interests = group_interests;
	}

	public String getGroup_info() {
		return group_info;
	}

	public void setGroup_info(String group_info) {
		this.group_info = group_info;
	}
	
	
	
}
