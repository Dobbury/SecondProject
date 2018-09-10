package dto;

import java.io.Serializable;

public class pinCommentDto implements Serializable {
	
	private double grade;
	private String pcomment;
	private String id;
	private String pinname;
	private int seq;
	
	
	public pinCommentDto() {
		super();
	}
	
	public pinCommentDto(double grade, String pcomment, String id, String pinname, int seq) {
		super();
		this.grade = grade;
		this.pcomment = pcomment;
		this.id = id;
		this.pinname = pinname;
		this.seq = seq;
	}
	
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public String getPcomment() {
		return pcomment;
	}
	public void setPcomment(String pcomment) {
		this.pcomment = pcomment;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPinname() {
		return pinname;
	}
	public void setPinname(String pinname) {
		this.pinname = pinname;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	@Override
	public String toString() {
		return "pinCommentDto [grade=" + grade + ", pcomment=" + pcomment + ", id=" + id + ", pinname=" + pinname
				+ ", seq=" + seq + "]";
	}
	
	
	
}
