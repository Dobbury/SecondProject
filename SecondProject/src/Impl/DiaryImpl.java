package Impl;

import java.util.List;

import dto.DiaryDto;


public interface DiaryImpl {

	
	public boolean addDiary(DiaryDto dto);
	
	public List<DiaryDto> getDiaryList();
	
	public DiaryDto getDiaryDto(int seq);
}
