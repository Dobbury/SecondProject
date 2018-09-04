package dao;

import Impl.DiaryImpl;
import dto.DiaryDto;

public class DiaryDao implements DiaryImpl {

	private static DiaryDao dao = new DiaryDao();
	
	private DiaryDao() {}
	public static DiaryDao getInstance() {
		return dao;
	}
	@Override
	public boolean addDiary(DiaryDto dto) {
		
		
		return false;
	}
	
}
