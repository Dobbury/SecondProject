package Impl;


import java.util.List;

import dto.CalendarDto;
import dto.memberDto;

public interface CalendarImpl {


	//캘린더에  여행일지 제목 뿌려주기
	public List<CalendarDto> getCalList (String id, String tday);

	
	
	
}
