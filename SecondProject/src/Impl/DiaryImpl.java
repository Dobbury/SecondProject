package Impl;

import java.util.List;

import dto.DiaryDto;
import dto.DiarycommentDto;



public interface DiaryImpl {

	
	public boolean addDiary(DiaryDto dto);
	
	public List<DiaryDto> getDiaryList();
	
	public DiaryDto getDiaryDto(int seq);

	public int CommantWrite(int seq,String id, String dcomment);
	
	public List<DiarycommentDto> Commantview(int seq);

}
