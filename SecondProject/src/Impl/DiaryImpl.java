package Impl;

import java.util.List;

import dto.DiaryDto;
import dto.DiarycommentDto;
import dto.JournalDto;

public interface DiaryImpl {
	
	
	public boolean addDiary(DiaryDto dto);
	
	public List<JournalDto> getJournalList();
	

	public DiaryDto getDiary(int seq); 
	
	public boolean updateDiary(DiaryDto dto);

	public JournalDto getJournalDto(int seq);
	
	public List<DiaryDto> getDiaryList(String startdate, String enddate, String id);
	
	public int CommantWrite(int seq, String id, String dcomment);
	
	public List<DiarycommentDto> Commantview(int seq);
	
	public int CommentDelete(int seq);
	
	public List<JournalDto> getSearchJournalList(String stext, int page);
	
	public int getSearchCountJournal(String stext);
	
	
	
	
	public List<JournalDto> myJournalList(String id);
}

