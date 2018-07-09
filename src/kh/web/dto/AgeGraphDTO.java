package kh.web.dto;

public class AgeGraphDTO {
	private int ten;
	private int twenty;
	private int thirty;
	private int forty;
	private int fifty;
	private int sixty;

	public AgeGraphDTO() {
		super();
	}

	public AgeGraphDTO(int ten, int twenty, int thirty, int forty, int fifty, int sixty) {
		super();
		this.ten = ten;
		this.twenty = twenty;
		this.thirty = thirty;
		this.forty = forty;
		this.fifty = fifty;
		this.sixty = sixty;
	}

	public int getTen() {
		return ten;
	}

	public void setTen(int ten) {
		this.ten = ten;
	}

	public int getTwenty() {
		return twenty;
	}

	public void setTwenty(int twenty) {
		this.twenty = twenty;
	}

	public int getThirty() {
		return thirty;
	}

	public void setThirty(int thirty) {
		this.thirty = thirty;
	}

	public int getForty() {
		return forty;
	}

	public void setForty(int forty) {
		this.forty = forty;
	}

	public int getFifty() {
		return fifty;
	}

	public void setFifty(int fifty) {
		this.fifty = fifty;
	}

	public int getSixty() {
		return sixty;
	}

	public void setSixty(int sixty) {
		this.sixty = sixty;
	}

}
