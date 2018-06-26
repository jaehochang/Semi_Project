package kh.web.dto;

public class BoardDTO {
	private int board_seq;
	private int group_seq;
	private String group_name;
	private String group_leader;
	private String board_title;
	private String board_content;
	private String attend_date;
	private String location;
	
	public BoardDTO() {}

	public BoardDTO(int board_seq, int group_seq, String group_name, String group_leader, String board_title,
			String board_content, String attend_date, String location) {
		super();
		this.board_seq = board_seq;
		this.group_seq = group_seq;
		this.group_name = group_name;
		this.group_leader = group_leader;
		this.board_title = board_title;
		this.board_content = board_content;
		this.attend_date = attend_date;
		this.location = location;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
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

	public String getGroup_leader() {
		return group_leader;
	}

	public void setGroup_leader(String group_leader) {
		this.group_leader = group_leader;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getAttend_date() {
		return attend_date;
	}

	public void setAttend_date(String attend_date) {
		this.attend_date = attend_date;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	
}
