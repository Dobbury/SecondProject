package dao;

import Impl.CalendarImpl;

public class CalendarDao implements CalendarImpl{
	private static CalendarDao dao = new CalendarDao();
	
	private CalendarDao() {}
	
	public static CalendarDao getInstance() {
		return dao;
	}
}
