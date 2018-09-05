package dto;

import java.io.Serializable;

public class DiaryDto implements Serializable {
	
	private String content;
	private String title;
	private String tday;
	private String id;
	private int seq;
	
	public DiaryDto() {
		super();
	}
	
	public DiaryDto(String content, String title, String tday, String id, int seq) {
		super();
		this.content = content;
		this.title = title;
		this.tday = tday;
		this.id = id;
		this.seq = seq;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTday() {
		return tday;
	}
	public void setTday(String tday) {
		this.tday = tday;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	@Override
	public String toString() {
		return "DiaryDto [content=" + content + ", title=" + title + ", tday=" + tday + ", id="
				+ id + ", seq=" + seq + "]";
	}
	
	
}
