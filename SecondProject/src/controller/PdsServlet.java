package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Impl.MemberImpl;
import Impl.PdsImpl;
import dao.MemberDao;
import dao.PdsDao;
import dto.memberDto;

public class PdsServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

		PdsImpl dao = PdsDao.getInstance();

		String command = req.getParameter("command");
		
		// 댓글쓰기		
		if(command.equals("commentwrite")) {
			
			String dcomment = req.getParameter("dcomment");
			// 게시글에대한 임의 시퀀스
			int seq = 2;
			// 게시글에대한 임의 id
			String id = "123";
			
			int write = dao.CommantWrite(seq, id, dcomment);
			
			if(write == 1) {
				System.out.println("댓글입력완료");
			}else {
				System.out.println("댓글입력실패");
			}
			
			resp.sendRedirect("Diarydetail.jsp");
			
			
		}
		
	}

	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}

}