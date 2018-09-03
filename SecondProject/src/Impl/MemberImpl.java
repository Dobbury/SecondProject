package Impl;

import dto.memberDto;

public interface MemberImpl {


	public boolean editMember(memberDto dto);
	
	public memberDto getMemInfo(String id);


	public memberDto doLogin(String id, String pw);
	
	public boolean idcheck(String id);
	
	public int dosignup(String id, String pw, String name, String nick);

}
