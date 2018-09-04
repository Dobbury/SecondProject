package Impl;

import java.util.List;

import dto.PinDto;
import dto.pinCommentDto;

public interface PinImpl {
	
	public boolean Insert(PinDto dto);
	
	public boolean PinCommentInsert(pinCommentDto dto);
	
	public List<PinDto> PinList(String pin_name,String place_kind);
}
