package Impl;

import java.util.List;

import dto.DiaryDto;
import dto.DiarycommentDto;
import dto.JournalDto;



public interface DiaryImpl {

	
	public boolean addDiary(DiaryDto dto);
	
<<<<<<< HEAD
	public List<DiaryDto> getDiaryList(String startdate, String enddate, String id);
=======
	public int getCountJournal();
	
	public List<JournalDto> getJournalList(int page);
	
	List<DiaryDto> getDiaryList(String startdate, String enddate, String id);

	public JournalDto getJournalDto(int seq);
	
	public int CommantWrite(int seq,String id, String dcomment);
	
	public List<DiarycommentDto> Commantview(int seq);
	
	public int CommentDelete(int seq);

>>>>>>> 60b41e644545875ebb8521db2d4d970ffb3684ad
}
