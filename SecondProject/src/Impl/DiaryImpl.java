package Impl;

import java.util.List;

import dto.DiaryDto;

public interface DiaryImpl {

	
	public boolean addDiary(DiaryDto dto);
	
	public List<DiaryDto> getDiaryList(String startdate, String enddate, String id);
}
