package controller;

import Impl.CalendarImpl;
import dao.CalendarDao;

public class CalendarServlet {
	CalendarImpl dao = CalendarDao.getInstance();
}
