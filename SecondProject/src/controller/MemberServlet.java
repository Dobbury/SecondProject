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

public class MemberServlet extends HttpServlet{
	MemberImpl dao = MemberDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/html; charset=utf-8");
		req.setCharacterEncoding("utf-8");

		/*String ucode = String.valueOf((int)((Member)request.getSession().getAttribute("loginUser")).getU_code());*/
		String id=String.valueOf((String)req.getSession().getAttribute("loginUser"))/*세션이름찾아서바꾸기.getId();*/;
		
		
		
		memberDto dto = dao.getMemInfo(id);
		
		String page="";
		page="Mypage.jsp";
		req.setAttribute("memberDto", dto);
		
		RequestDispatcher view = req.getRequestDispatcher(page);
	      view.forward(req, resp);
	}
	
	
} 
