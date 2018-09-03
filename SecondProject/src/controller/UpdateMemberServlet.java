package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Impl.MemberImpl;
import dao.MemberDao;
import dto.memberDto;

public class UpdateMemberServlet extends HttpServlet {
	MemberImpl dao = MemberDao.getInstance();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html; charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		String name=req.getParameter("name");
		String nick=req.getParameter("nick");
		
		memberDto dto = new memberDto();
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setName(name);
		dto.setNick(nick);
		
		boolean isS = dao.editMember(dto);
		String page="Mypage.jsp";
		
		req.setAttribute("isS", isS);
		
		RequestDispatcher view = req.getRequestDispatcher(page);
		view.forward(req, resp);
		

	}

}
