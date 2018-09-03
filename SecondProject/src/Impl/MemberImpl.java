package Impl;

import dto.memberDto;

public interface MemberImpl {

	public boolean editMember(memberDto dto);
	
	public memberDto getMemInfo(String id);

}
