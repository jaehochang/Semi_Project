package kh.web.dto;
/**
 * 달력 탭을 눌렀을때  보여줄 리스트들만 뽑아낼 내용만 출력용 DTO용 입니다 
 * 
 * */
public class ShowMeetingDTO {
	private int meetseq;
	private String dat_month;
	private String hour_minut;
	private String group_name;
	private String meeting_title;
	private String meeting_location;
	
	public ShowMeetingDTO() {
		super();
	}

	public ShowMeetingDTO(int meetseq ,String dat_month, String hour_minut, String group_name, String meeting_title,
			String meeting_location) {
		this.meetseq = meetseq;
		this.dat_month = dat_month;
		this.hour_minut = hour_minut;
		this.group_name = group_name;
		this.meeting_title = meeting_title;
		this.meeting_location = meeting_location;
	}
	
	
	
	public int getMeetseq() {
		return meetseq;
	}

	public void setMeetseq(int meetseq) {
		this.meetseq = meetseq;
	}

	public String getDat_month() {
		return dat_month;
	}
	public void setDat_month(String dat_month) {
		this.dat_month = dat_month;
	}
	public String getHour_minut() {
		return hour_minut;
	}
	public void setHour_minut(String hour_minut) {
		this.hour_minut = hour_minut;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getMeeting_title() {
		return meeting_title;
	}
	public void setMeeting_title(String meeting_title) {
		this.meeting_title = meeting_title;
	}
	public String getMeeting_location() {
		return meeting_location;
	}
	public void setMeeting_location(String meeting_location) {
		this.meeting_location = meeting_location;
	}
	
}
