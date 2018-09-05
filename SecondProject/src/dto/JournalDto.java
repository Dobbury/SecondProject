package dto;

public class JournalDto {

	private int seq;
	private String startDate;
	private String endDate;
	private int readcount;
	private String id;
	private int like_cnt;
	private String wdate;
	private String title;
	
	public JournalDto() {}
	
	public JournalDto(int seq, String startDate, String endDate, int readcount, String id, int like_cnt, String wdate,
			String title) {
		super();
		this.seq = seq;
		this.startDate = startDate;
		this.endDate = endDate;
		this.readcount = readcount;
		this.id = id;
		this.like_cnt = like_cnt;
		this.wdate = wdate;
		this.title = title;
	}

	public JournalDto(String startDate, String endDate, String id, String title) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
		this.id = id;
		this.title = title;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
	
	
	
	
}
