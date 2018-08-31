package controller;

import Impl.MemberImpl;
import dao.MemberDao;

public class MemberServlet {
	MemberImpl dao = MemberDao.getInstance();
}
