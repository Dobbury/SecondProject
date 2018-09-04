package dto;

public class DiarycommentDto {

	private String id;
	private String dcomment;
	
	public DiarycommentDto() {
		
	}
	
	public DiarycommentDto(String id, String dcomment) {
		super();
		this.id = id;
		this.dcomment = dcomment;
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
	
	
		
	
	
}
