package Impl;

import dto.memberDto;

public interface MemberImpl {

	
	public memberDto doLogin(String id, String pw);
	
	// ���̵� �ߺ�Ȯ��
	public boolean idcheck(String id);
	// ȸ������
	public int dosignup(String id, String pw, String name, String nick);
}
