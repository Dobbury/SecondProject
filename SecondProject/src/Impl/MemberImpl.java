package Impl;

import dto.memberDto;

public interface MemberImpl {

	
	public memberDto doLogin(String id, String pw);
	
	// 아이디 중복확인
	public boolean idcheck(String id);
	// 회원가입
	public int dosignup(String id, String pw, String name, String nick);
}
