package Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.PinDto;
import dto.pinCommentDto;

public interface PinImpl {
	
	public boolean Insert(PinDto dto);
	
	public boolean PinCommentInsert(pinCommentDto dto);
	
	public pinCommentDto getPinComment(int seq);
	
	public boolean delPinComment(int seq);
	
	public PinDto getPin(String pin_name);
	
	public int getLastPinSeq();
	
	public List<PinDto> PinList(String pin_name,String place_kind);

	public List<String[]> pinAVG();

	public List<PinDto> getAllPinList(int page);
	
	public int getAllPinCount();
	
	public List<PinDto> getSearchPinList(int page, String stext);

	public int getSearchPinCount(String stext); 


}
