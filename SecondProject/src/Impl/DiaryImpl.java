package Impl;

import java.util.List;

import dto.DiaryDto;
import dto.DiarycommentDto;
import dto.JournalDto;

public interface DiaryImpl {
	


	public boolean addJournal(JournalDto dto);
	
	public int getCountJournal();
	public boolean addDiary(DiaryDto dto);
	public List<JournalDto> getJournalList(int page);

	public DiaryDto getDiary(int seq); 
	
	public boolean updateDiary(DiaryDto dto);

	public JournalDto getJournalDto(int seq);
	

	public int getJournalSeq(String tday);
	
	public int CommantWrite(int seq,String id, String dcomment);

	
	public List<DiarycommentDto> Commantview(int seq);
	
	public int CommentDelete(int seq);
	
	public List<JournalDto> getSearchJournalList(String stext, int page);
	
	public int getSearchCountJournal(String stext);
	
	public int countMyJournal(String id);
	
	
	public List<JournalDto> myJournalList(String id, int page);

	public List<DiaryDto> getDiaryList(String startdate, String enddate, String id);
}

