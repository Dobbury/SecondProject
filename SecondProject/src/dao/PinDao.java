package dao;

import Impl.PinImpl;

public class PinDao implements PinImpl {
	private static PinDao dao = new PinDao();
	
	private PinDao() {}
	
	public static PinDao getInstance() {
		return dao;
	}
}
