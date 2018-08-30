package dao;

import Impl.MemberImpl;

public class MemberDao implements MemberImpl {
	
	private static MemberDao dao = new MemberDao();
	
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		return dao;
	}
}
