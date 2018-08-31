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

public class MemberServlet extends HttpServlet {

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

		MemberImpl dao = MemberDao.getInstance();

		String command = req.getParameter("command");

		if (command.equals("login")) {
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");

			memberDto dto = dao.doLogin(id, pw);

			if (dto != null) {
				req.setAttribute("memDto", dto);
				dispatch("Newspeed.jsp", req, resp);
			}else {
				PrintWriter out = resp.getWriter();

				out.println("<script>");

				out.println("alert('아이디와 비밀번호가 틀렸습니다.');");

				out.println("history.back();");

				out.println("</script>");

			}
		}
	}

	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}

}
