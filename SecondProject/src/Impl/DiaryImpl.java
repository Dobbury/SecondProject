package Impl;

import java.util.List;

import dto.DiaryDto;
import dto.DiarycommentDto;
import dto.JournalDto;



public interface DiaryImpl {

	
	public boolean addDiary(DiaryDto dto);
	
	public List<JournalDto> getJournalList();
	
	List<DiaryDto> getDiaryList(String startdate, String enddate, String id);

	public JournalDto getJournalDto(int seq);
	
	public int CommantWrite(int seq,String id, String dcomment);
	
	public List<DiarycommentDto> Commantview(int seq);

}
