package dao;

import Impl.PdsImpl;

public class PdsDao implements PdsImpl{
	private static PdsDao dao = new PdsDao();
	
	private PdsDao() {}
	
	public static PdsDao getInstance() {
		return dao;
	}
}
