package Impl;

import java.util.List;

import dto.PinDto;

public interface PinImpl {
	
	public boolean Insert(PinDto dto);
	
	public List<PinDto> PinList(String pin_name,String place_kind);
}
