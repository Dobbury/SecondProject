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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import Impl.DiaryImpl;
import Impl.PinImpl;
import dao.DiaryDao;
import dao.PinDao;
import dto.DiaryDto;
import dto.pinCommentDto;
import dto.DiarycommentDto;
import dto.JournalDto;


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
			System.out.println("1�떒怨�");
			String content = req.getParameter("content");
			String tday = req.getParameter("tday");
			String title = req.getParameter("title");
			String id = req.getParameter("id");


			System.out.println("2단계");

			//첫번째 이미지 경로 가져오기
			if(content.contains("<img src")) {
				String tmp[] = content.split("img");
				String firstImageURL[] = tmp[1].split("\"");
				System.out.println(firstImageURL[1]);
				
			}

			
			DiaryDto dto = new DiaryDto();
			dto.setContent(content);
			dto.setId(id);
			dto.setTitle(title);
			dto.setTday(tday);
			System.out.println("3�떒怨�");
			boolean b = dao.addDiary(dto);
			System.out.println("4�떒怨�");
			
			if(b) {
				
			String PinObj = req.getParameter("PinObj");
			

			System.out.println(PinObj);
			JSONParser jsonParser = new JSONParser();

			try {
				JSONObject jsonObj = (JSONObject) jsonParser.parse(PinObj);
				
				JSONArray pinArr = (JSONArray) jsonObj.get("PinObj");
				
				for (int i = 0; i < pinArr.size(); i++) {
					JSONObject obj = (JSONObject) pinArr.get(i);
					PinImpl pinDao = PinDao.getInstance();

					pinCommentDto pinCDto = new pinCommentDto();
					
					pinCDto.setGrade(Double.parseDouble(obj.get("grade").toString()));
					pinCDto.setId(obj.get("id").toString());
					pinCDto.setPcomment(obj.get("pcomment").toString());
					pinCDto.setPinname(obj.get("pin_name").toString());

					boolean pinb =pinDao.PinCommentInsert(pinCDto);
					
					if(!pinb) {
						b=pinb;
						break;
					}
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			
		PrintWriter pw = resp.getWriter();
		pw.print(b);

		}else if(command.equals("diaryDetail")) {
	         int seq = Integer.parseInt(req.getParameter("seq"));
	         
	         JournalDto dto = dao.getJournalDto(seq);

	        
	         List<DiaryDto> Diarylist = dao.getDiaryList(dto.getStartDate().substring(0, 10).replace("-", "/"), dto.getEndDate().substring(0, 10).replace("-", "/"), dto.getId());
	         
	         req.setAttribute("JournalDto", dto);
	         req.setAttribute("DiaryList", Diarylist);
	         List<DiarycommentDto> list = dao.Commantview(seq);
	         req.setAttribute("DiarycommentDto", list);
	         
	         dispatch("Diarydetail.jsp", req, resp);
	         
	      }
		
	
		else if(command.equals("commentwrite")) { 
				
				
				int seq = Integer.parseInt(req.getParameter("seq"));
				String loginid = req.getParameter("loginid");
				String dcomment = req.getParameter("dcomment");
				
				
				int write = dao.CommantWrite(seq, loginid, dcomment);				
				if(write == 1) {
					System.out.println("占쏙옙占쏙옙韜쩔狗占�");
				}else {
					System.out.println("占쏙옙占쏙옙韜쩍占쏙옙占�");
				}
				
				JournalDto dto = dao.getJournalDto(seq);

				
		        List<DiaryDto> Diarylist = dao.getDiaryList(dto.getStartDate().substring(0, 10).replace("-", "/"), dto.getEndDate().substring(0, 10).replace("-", "/"), dto.getId());
		        req.setAttribute("JournalDto", dto);
		        req.setAttribute("DiaryList", Diarylist);
				List<DiarycommentDto> list = dao.Commantview(seq);
		        req.setAttribute("DiarycommentDto", list);
		        dispatch("Diarydetail.jsp", req, resp);
				
				
			}
		else if(command.equals("deletecomment")) {
			
			int commentseq = Integer.parseInt(req.getParameter("commentseq"));
			int count = dao.CommentDelete(commentseq);
			if(count == 1) {
				System.out.println("삭제완료");
			}else {
				System.out.println("삭제실패");
			}
			
			int seq = Integer.parseInt(req.getParameter("seq"));
			JournalDto dto = dao.getJournalDto(seq);
			List<DiaryDto> Diarylist = dao.getDiaryList(dto.getStartDate().substring(0, 10).replace("-", "/"), dto.getEndDate().substring(0, 10).replace("-", "/"), dto.getId());
	        req.setAttribute("JournalDto", dto);
	        req.setAttribute("DiaryList", Diarylist);
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
