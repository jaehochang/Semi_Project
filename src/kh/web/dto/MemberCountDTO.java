package kh.web.dto;

public class MemberCountDTO {
	private int group_seq;
	private int count;
	
	public MemberCountDTO() {
		super();
	}
	
	public MemberCountDTO(int group_seq, int count) {
		super();
		this.group_seq = group_seq;
		this.count = count;
	}
	public int getGroup_seq() {
		return group_seq;
	}
	public void setGroup_seq(int group_seq) {
		this.group_seq = group_seq;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
