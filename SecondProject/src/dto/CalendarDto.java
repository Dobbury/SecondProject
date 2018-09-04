package dto;

import java.io.Serializable;

public class CalendarDto implements Serializable{

	
	 // 접속한 사람의 정보
	 // 클릭한 날짜의 년월일
	 
	
    private String id;
    private String today;  
    private String title;
    
    public CalendarDto() {
   	 
    }
    
	public CalendarDto(String id, String today, String title) {
		super();
		this.id = id;
		this.today = today;
		this.title = title;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	@Override
	public String toString() {
		return "CalendarDto [id=" + id + ", today=" + today + ", title=" + title + "]";
	}	 
	 
    
	
}
