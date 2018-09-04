package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Impl.DiaryImpl;
import Impl.PinImpl;
import dao.DiaryDao;
import dao.PinDao;
import dto.DiaryDto;
import dto.DiarycommentDto;
import net.sf.json.JSONArray;

public class DiaryServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

		DiaryImpl dao = DiaryDao.getInstance();
		
		String command = req.getParameter("command");
		
		if(command.equals("insert")) {
			String content = req.getParameter("content");
			String tday = req.getParameter("tday");
			String title = req.getParameter("title");
			String id = req.getParameter("id");
			String PinArr = req.getParameter("PinArr");
			
			
			List<Map<String,Object>> resultMap = new ArrayList<Map<String,Object>>();
		    //json-lib.jar êº¼ìž„
			resultMap = JSONArray.fromObject(PinArr);
		    
			DiaryDto dto = new DiaryDto();
			
			dto.setContent(content);
			dto.setId(id);
			dto.setTitle(title);
			dto.setTday(tday);
			
			boolean b = dao.addDiary(dto);
			
			if(b) {
				PinImpl Pindao = PinDao.getInstance();
				
				
			}
			
			PrintWriter pw = resp.getWriter();
			pw.print(b);
		}else if(command.equals("diaryDetail")) {
	         int seq = Integer.parseInt(req.getParameter("seq"));
	         
	         DiaryDto dto = dao.getDiaryDto(seq);
	         req.setAttribute("DiaryDto", dto);
	         
	         List<DiarycommentDto> list = dao.Commantview(seq);
	         req.setAttribute("DiarycommentDto", list);
	         
	         dispatch("Diarydetail.jsp", req, resp);
	         
	      }
		
		// ´ñ±Û¾²±â		
		else if(command.equals("commentwrite")) {
				
				
				int seq = Integer.parseInt(req.getParameter("seq"));
				String loginid = req.getParameter("loginid");
				String dcomment = req.getParameter("dcomment");
				
				
				int write = dao.CommantWrite(seq, loginid, dcomment);				
				if(write == 1) {
					System.out.println("´ñ±ÛÀÔ·Â¿Ï·á");
				}else {
					System.out.println("´ñ±ÛÀÔ·Â½ÇÆÐ");
				}
				
				DiaryDto dto = dao.getDiaryDto(seq);
				List<DiarycommentDto> list = dao.Commantview(seq);
		        req.setAttribute("DiarycommentDto", list);
				req.setAttribute("DiaryDto", dto);
		        dispatch("Diarydetail.jsp", req, resp);
				
				
			}
	   }
	   
	   public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)
	         throws ServletException, IOException {

	      RequestDispatcher dispatch = req.getRequestDispatcher(urls);
	      dispatch.forward(req, resp);
	   }
	
}
