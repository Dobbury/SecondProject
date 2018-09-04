package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Impl.CalendarImpl;
import Impl.MemberImpl;
import dao.CalendarDao;
import dao.MemberDao;
import dto.memberDto;

public class CalendarServlet extends HttpServlet{
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("캘린더서블릿 1");
		doProcess(req, resp); 
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 doProcess(req, resp);
	}

	

	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("캘린더서블릿 2 ");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

		CalendarImpl dao = CalendarDao.getInstance();
		MemberImpl mdao = MemberDao.getInstance();
		
		
		String command = req.getParameter("command");
		
		//뉴스피드 --서블릿 -- 캘린더write
		if(command.equals("gocal")){
			System.out.println("캘린더서블릿 gocal");
			
			 String id = req.getParameter("id");
	         System.out.println( "뉴스피드에서 받아온 " + id);
	         
	//       memberDto dto = mdao.doLogin(id, pw);	   //doLogin() 리턴값 == dto               == ID, NICK, NAME 
	         memberDto dto= new memberDto(id,"닉넴","비번"); //doLogin() 없이, 캘린더 기능확인용                 : 지우세여
	         System.out.println("디티오있냐" + dto);
	         
	         if (dto != null) {
	             req.setAttribute("dto", dto);
	             
	             dispatch("CalendarWrite.jsp", req, resp);
	         }
	         System.out.println("command == gocal 종료" );  
		}
		// 캘린더write --서블릿 -- DiaryWrite
		else if(command.equals("writeDiary")){
			System.out.println("캘린더서블릿 writeDiary");
			
			String tday = req.getParameter("tday");

			dispatch("DiaryWrite.jsp", req, resp);
		} 
		
		
		
	}


	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}

	
}
