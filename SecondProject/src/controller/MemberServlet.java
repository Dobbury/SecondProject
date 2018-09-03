package controller;

import java.io.IOException;
import java.io.PrintWriter;

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

		String command = req.getParameter("command");
		
		if(command.equals("update")) {
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			String name = req.getParameter("name");
			String nick = req.getParameter("nick");

			memberDto dto = new memberDto();
			dto.setId(id);
			dto.setPwd(pwd);
			dto.setName(name);
			dto.setNick(nick);
			System.out.println(dto.toString());
			boolean isS = dao.editMember(dto);
			PrintWriter pw = resp.getWriter();
			
			pw.print(isS);
		}
	}
	
	
} 