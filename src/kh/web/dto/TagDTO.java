package kh.web.dto;

public class TagDTO {
	private int tag_seq;
	private String tag_category;
	private String tag_category_words;

	public TagDTO(int tag_seq, String tag_category,String tag_category_words) {
		super();
		this.tag_seq = tag_seq;
		this.tag_category= tag_category;
		this.tag_category_words=tag_category_words;
	}

	public TagDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getTag_seq() {
		return tag_seq;
	}

	public void setTag_seq(int tag_seq) {
		this.tag_seq = tag_seq;
	}

	public String getTag_category() {
		return tag_category;
	}

	public void setTag_category(String tag_category) {
		this.tag_category = tag_category;
	}

	public String getTag_category_words() {
		return tag_category_words;
	}

	public void setTag_category_words(String tag_category_words) {
		this.tag_category_words = tag_category_words;
	}

	
}
