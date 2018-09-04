package Impl;


import java.util.List;


import dto.memberDto;

public interface MemberImpl {



	public memberDto doLogin(String id, String pw);
	
	// 아이디 중복확인
	public List<String> idcheck();

	// 회원가입
	public int dosignup(String id, String pw, String name, String nick);


	public boolean editMember(memberDto dto);

	public memberDto getMemInfo(String id);

}
