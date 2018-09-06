package Impl;

import java.util.List;

import dto.DiaryDto;
import dto.DiarycommentDto;
import dto.JournalDto;



public interface DiaryImpl {

	
	public boolean addDiary(DiaryDto dto);
	
	public List<JournalDto> getJournalList();
	
	List<DiaryDto> getDiaryList(String startdate, String enddate, String id);

<<<<<<< HEAD

=======
	public JournalDto getJournalDto(int seq);
	
>>>>>>> 6befd792eeaec0f189fa5ed291f5166935bde9ec
	public int CommantWrite(int seq,String id, String dcomment);
	
	public List<DiarycommentDto> Commantview(int seq);
	
<<<<<<< HEAD
	public DiaryDto getMyDiaryDto(int seq, String id);
=======
	public int CommentDelete(int seq);
>>>>>>> 6befd792eeaec0f189fa5ed291f5166935bde9ec

}
