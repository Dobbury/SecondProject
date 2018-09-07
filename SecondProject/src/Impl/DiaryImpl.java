package Impl;

import java.util.List;

import dto.DiaryDto;
import dto.DiarycommentDto;
import dto.JournalDto;

public interface DiaryImpl {
	
	
	public boolean addDiary(DiaryDto dto);
	
	public List<JournalDto> getJournalList();
	
	public JournalDto getJournalDto(int seq);
	
	public List<DiaryDto> getDiaryList(String startdate, String enddate, String id);
	
	public int CommantWrite(int seq, String id, String dcomment);
	
	public List<DiarycommentDto> Commantview(int seq);
	
	public int CommentDelete(int seq);
	
	public DiaryDto getDiary(int seq);
	 
	public List<JournalDto> myJournalList(String id);
	
	
	
	
	// 이 밑은 병합할때 삭제 
	public int getCountJournal();
	public List<JournalDto> getJournalListpaging();
	}
