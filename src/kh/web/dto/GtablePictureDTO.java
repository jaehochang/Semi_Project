package kh.web.dto;

public class GtablePictureDTO {
	private int group_picture_seq;
	private int group_seq;
	private String original_name;
	private String system_name;
	
	public GtablePictureDTO() {
		super();
	}
	
	public GtablePictureDTO(int group_picture_seq, int group_seq, String original_name, String system_name) {
		super();
		this.group_picture_seq = group_picture_seq;
		this.group_seq = group_seq;
		this.original_name = original_name;
		this.system_name = system_name;
	}
	public int getGroup_picture_seq() {
		return group_picture_seq;
	}
	public void setGroup_picture_seq(int group_picture_seq) {
		this.group_picture_seq = group_picture_seq;
	}
	public int getGroup_seq() {
		return group_seq;
	}
	public void setGroup_seq(int group_seq) {
		this.group_seq = group_seq;
	}
	public String getOriginal_name() {
		return original_name;
	}
	public void setOriginal_name(String original_name) {
		this.original_name = original_name;
	}
	public String getSystem_name() {
		return system_name;
	}
	public void setSystem_name(String system_name) {
		this.system_name = system_name;
	}
	
	
}
