package dto;

import java.io.Serializable;

public class DiaryDto implements Serializable {

	
	private String content;
	private String title;
	private String tday;
	private String id;
	private String pin_Seqs;
	private int jour_check;
	private int seq;
	private String fisrt_Img;
	
	public DiaryDto() {
		super();
	}



	public DiaryDto(String content, String title, String tday, String id, String pin_Seqs, int jour_check, int seq,
			String fisrt_Img) {
		super();
		this.content = content;
		this.title = title;
		this.tday = tday;
		this.id = id;
		this.pin_Seqs = pin_Seqs;
		this.jour_check = jour_check;
		this.seq = seq;
		this.fisrt_Img = fisrt_Img;
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


	public String getPin_Seqs() {
		return pin_Seqs;
	}


	public void setPin_Seqs(String pin_Seqs) {
		this.pin_Seqs = pin_Seqs;
	}


	public int getJour_check() {
		return jour_check;
	}


	public void setJour_check(int jour_check) {
		this.jour_check = jour_check;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}
	

	public String getFisrt_Img() {
		return fisrt_Img;
	}






	public void setFisrt_Img(String fisrt_Img) {
		this.fisrt_Img = fisrt_Img;
	}
}


		


