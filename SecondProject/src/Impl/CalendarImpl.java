package Impl;


import java.util.List;

import dto.DiaryDto;

 
public interface CalendarImpl {


	//캘린더에  여행일지 제목 뿌려주기
	public List<DiaryDto> getCalList (String id);

	
	
	
}
