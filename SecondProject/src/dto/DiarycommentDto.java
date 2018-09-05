package dto;

public class DiarycommentDto {
	
	private int seq;
	private String id;
	private String dcomment;
	private String dday;
	
	public DiarycommentDto() {
		
	}

	public DiarycommentDto(int seq, String id, String dcomment, String dday) {
		super();
		this.seq = seq;
		this.id = id;
		this.dcomment = dcomment;
		this.dday = dday;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDcomment() {
		return dcomment;
	}

	public void setDcomment(String dcomment) {
		this.dcomment = dcomment;
	}

	public String getDday() {
		return dday;
	}

	public void setDday(String dday) {
		this.dday = dday;
	}


	
		
	
	
}
