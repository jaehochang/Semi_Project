package kh.web.dto;

public class DistanceDTO {

	private String groupName;
	private double groupLat;
	private double groupLng;
	private int memberCount;
	private String groupPicture;
	
	

	public DistanceDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DistanceDTO(String groupName, double groupLat, double groupLng, int memberCount, String groupPicture) {
		super();
		this.groupName = groupName;
		this.groupLat = groupLat;
		this.groupLng = groupLng;
		this.memberCount = memberCount;
		this.groupPicture = groupPicture;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public double getGroupLat() {
		return groupLat;
	}

	public void setGroupLat(double groupLat) {
		this.groupLat = groupLat;
	}

	public double getGroupLng() {
		return groupLng;
	}

	public void setGroupLng(double groupLng) {
		this.groupLng = groupLng;
	}

	public int getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}

	public String getGroupPicture() {
		return groupPicture;
	}

	public void setGroupPicture(String groupPicture) {
		this.groupPicture = groupPicture;
	}

}
