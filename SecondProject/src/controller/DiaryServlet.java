package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
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
import dto.PinDto;

import dto.PinDto;

import dto.memberDto;



public class DiaryServlet extends HttpServlet {


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


		if (command.equals("insert")) {
			System.out.println("1단계");
			String content = req.getParameter("content");
			content = content.replaceAll("\"", "\\\\\"");
			System.out.println("ccc : "+content);
			String tday = req.getParameter("tday");
			String title = req.getParameter("title");
			String id = req.getParameter("id");

			System.out.println("2단계");

			// 첫번째 이미지 경로 가져오기
			String fisrt_img = "";
			if (content.contains("<img src")) {
				String tmp[] = content.split("img");
				String firstImageURL[] = tmp[1].split("\\\\\"");
				fisrt_img = firstImageURL[1];
					
			}

			// 핀 코멘트 저장하고 핀네임 diary 테이블에 저장할 수 있게 , 사용해서 나열한 string 만들기
			String PinObj = req.getParameter("PinObj");

			System.out.println(PinObj);
			JSONParser jsonParser = new JSONParser();

			String pin_Seqs = "";
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

					
					boolean pinb = pinDao.PinCommentInsert(pinCDto);

					pin_Seqs += (pinDao.getLastPinSeq()+"");
					
					if (!pinb) {
						PrintWriter pw = resp.getWriter();
						pw.print(pinb);

						return;
					}
					if (i != pinArr.size() - 1) {
						pin_Seqs += ",";
					}
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			DiaryDto dto = new DiaryDto();
			dto.setContent(content);
			dto.setId(id);
			dto.setTitle(title);
			dto.setTday(tday);

			System.out.println(pin_Seqs);
			dto.setPin_Seqs(pin_Seqs);
			dto.setFisrt_Img(fisrt_img);

			System.out.println("3단계");
			boolean b = dao.addDiary(dto);
			System.out.println("4단계");


			PrintWriter pw = resp.getWriter();
			pw.print(b);
		
		}else if(command.equals("update")) {
			int seq = Integer.parseInt(req.getParameter("seq"));

			DiaryDto dto = dao.getDiary(seq);

			PinImpl pinDao = PinDao.getInstance();

			List<pinCommentDto> pCommentlist = new ArrayList<>();
			List<PinDto> pinlist = new ArrayList<>();
			System.out.println("ㅂㅂㅂㅂ"+dto.getPin_Seqs());
			
			if(dto.getPin_Seqs()!= null) {
				String[] pin_Seqs = dto.getPin_Seqs().split(",");
	
				for (String pinSeq : pin_Seqs) {
					System.out.println(Integer.parseInt(pinSeq));
					pCommentlist.add(pinDao.getPinComment(Integer.parseInt(pinSeq)));
				}
	
					System.out.println(pCommentlist.size());
				for (pinCommentDto pCdto : pCommentlist) {
					pinlist.add(pinDao.getPin(pCdto.getPinname()));
				}
			}
			
			req.setAttribute("Diary", dto);
			req.setAttribute("pCommentlist", pCommentlist);
			req.setAttribute("pinlist", pinlist);

			dispatch("DiaryUpdate.jsp", req, resp);

		}else if(command.equals("updateAf")) {
			
			req.removeAttribute("Diary");
			req.removeAttribute("pCommentlist");
			req.removeAttribute("pinlist");
			
			
			System.out.println("1단계");
			String content = req.getParameter("content");
			content = content.replaceAll("\"", "\\\\\"");
			
			String tday = req.getParameter("tday");
			String title = req.getParameter("title");
			String id = req.getParameter("id");
			String seq = req.getParameter("seq");
			String jour = req.getParameter("jour");
			System.out.println("2단계");

			// 첫번째 이미지 경로 가져오기
			String fisrt_img = "";
			if (content.contains("<img src")) {
				String tmp[] = content.split("img");
				String firstImageURL[] = tmp[1].split("\\\\\"");
				fisrt_img = firstImageURL[1];
			}
			
			PinImpl pinDao = PinDao.getInstance();
			
			//업데이트전 핑 데이터 지우기
			String beforePinSeq = req.getParameter("beforePinSeq");
			
			String beforePins[] = beforePinSeq.split(",");
			
			for(String pin : beforePins) {
				System.out.println("delPin: "+pin);
				pinDao.delPinComment(Integer.parseInt(pin));
			}
			
			// 핀 코멘트 저장하고 핀네임 diary 테이블에 저장할 수 있게 , 사용해서 나열한 string 만들기
			String PinObj = req.getParameter("PinObj");

			JSONParser jsonParser = new JSONParser();

			String pin_Seqs = "";
			try {
				JSONObject jsonObj = (JSONObject) jsonParser.parse(PinObj);

				JSONArray pinArr = (JSONArray) jsonObj.get("PinObj");

				for (int i = 0; i < pinArr.size(); i++) {
					JSONObject obj = (JSONObject) pinArr.get(i);
					

					pinCommentDto pinCDto = new pinCommentDto();

					pinCDto.setGrade(Double.parseDouble(obj.get("grade").toString()));
					pinCDto.setId(obj.get("id").toString());
					pinCDto.setPcomment(obj.get("pcomment").toString());
					pinCDto.setPinname(obj.get("pin_name").toString());

					
					boolean pinb = pinDao.PinCommentInsert(pinCDto);

					pin_Seqs += (pinDao.getLastPinSeq()+"");
					
					if (!pinb) {
						PrintWriter pw = resp.getWriter();
						pw.print(pinb);

						return;
					}
					if (i != pinArr.size() - 1) {
						pin_Seqs += ",";
					}
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


			DiaryDto dto = new DiaryDto();
			dto.setContent(content);
			dto.setId(id);
			dto.setTitle(title);
			dto.setTday(tday);
			dto.setSeq(Integer.parseInt(seq));
			dto.setJour_check(Integer.parseInt(jour));
			dto.setPin_Seqs(pin_Seqs);
			dto.setFisrt_Img(fisrt_img);

			
			System.out.println("3단계");
			boolean b = dao.updateDiary(dto);
			System.out.println("4단계");
			
			PrintWriter pw = resp.getWriter();
			pw.print(b);


		}else if(command.equals("journalUpdate")) {
			int seq = Integer.parseInt(req.getParameter("seq"));

			JournalDto dto = dao.getJournalDto(seq);

			List<DiaryDto> Diarylist = dao.getDiaryList(dto.getStartDate().substring(0, 10).replace("-", "/"),
					dto.getEndDate().substring(0, 10).replace("-", "/"), dto.getId());

			System.out.println(dto.getStartDate().substring(0, 10).replace("-", "/"));

			req.setAttribute("JournalDto", dto);
			req.setAttribute("DiaryList", Diarylist);
			List<DiarycommentDto> list = dao.Commantview(seq);
			req.setAttribute("DiarycommentDto", list);

			dispatch("journalUpdate.jsp", req, resp);

			
		}else if(command.equals("journalDetail")) {

	         int seq = Integer.parseInt(req.getParameter("seq"));
	         String loginid = ((memberDto)req.getSession().getAttribute("user")).getId();
	         
	         JournalDto dto = dao.getJournalDto(seq);
	         
	        
	         List<DiaryDto> Diarylist = dao.getDiaryList(dto.getStartDate().substring(0, 10).replace("-", "/"), dto.getEndDate().substring(0, 10).replace("-", "/"), dto.getId());
	         
	         Map<Integer,List<String[]>> map = new HashMap<>();
	         for(DiaryDto dDto : Diarylist) {
	        	 
	        	 String pins[]=dDto.getPin_Seqs().split(",");
	        	 
	        	 List<String[]> latlnglist = new ArrayList<>();
	        	 for(String pinSeq : pins) {
	        		 PinImpl pDao = PinDao.getInstance();
	        		 pinCommentDto pCDto=pDao.getPinComment(Integer.parseInt(pinSeq));
	        		 String pinname=pCDto.getPinname();
	        		 PinDto pin = pDao.getPin(pinname);
	        		 
	        		 String location[] = { pin.getLat()+"",pin.getLng()+""};
	        		 System.out.println(pin.getLat()+" "+pin.getLng());
	        		 latlnglist.add(location);
	        	 }
	        	 
	        	 map.put(dDto.getSeq(), latlnglist);
	         }

	         System.out.println(dto.getStartDate().substring(0, 10).replace("-", "/"));
	         
	         req.setAttribute("locations", map);
	         req.setAttribute("JournalDto", dto);
	         req.setAttribute("DiaryList", Diarylist);
	         List<DiarycommentDto> list = dao.Commantview(seq);
	         req.setAttribute("DiarycommentDto", list);
	         
	         dispatch("journalDetail.jsp", req, resp);
	         
	      }
		else if(command.equals("commentwrite")) { 
				
				
				int seq = Integer.parseInt(req.getParameter("seq"));
				String loginid = ((memberDto)req.getSession().getAttribute("user")).getId();
				String dcomment = req.getParameter("dcomment");
				System.out.println(loginid);
				
				int write = dao.CommantWrite(seq, loginid, dcomment);				
				if(write == 1) {
					System.out.println("占쏙옙占쏙옙韜쩔狗占�");
				}else {
					System.out.println("占쏙옙占쏙옙韜쩍占쏙옙占�");
				}
				
				resp.sendRedirect("DiaryServlet?command=journalDetail&seq="+seq);
		        
		}
		else if(command.equals("deletecomment")) {
			
			int commentseq = Integer.parseInt(req.getParameter("commentseq"));
			int count = dao.CommentDelete(commentseq);

			if (count == 1) {
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

	        dispatch("journalDetail.jsp", req, resp);


			
		}else if(command.equals("search")) {
			String stext = req.getParameter("stext");


			req.setAttribute("stext", stext);
			dispatch("search.jsp?page=1", req, resp);
			
			
		}
		
		else if(command.equals("like")) {
			
			int seq = Integer.parseInt(req.getParameter("seq"));
			String id = req.getParameter("loginid");
			
			dao.addLike(seq,id);
			dao.countLike(seq);
			
			
			resp.sendRedirect("DiaryServlet?command=journalDetail&seq="+seq);
			
		}else if(command.equals("likedel")) {
			
			int seq = Integer.parseInt(req.getParameter("seq"));
			String id = req.getParameter("loginid");
			
			dao.deleteLike(seq,id);
			dao.countLikedel(seq);
			
			resp.sendRedirect("DiaryServlet?command=journalDetail&seq="+seq);
			

		} else if (command.equals("search")) {
			String stext = req.getParameter("stext");

			req.setAttribute("stext", stext);
			dispatch("search.jsp?page=1", req, resp);
			
		}else if (command.equals("jourInsert")) {
			
			PrintWriter pw = resp.getWriter();
			
			
			String endDate = req.getParameter("enddate");
			String startDate = req.getParameter("startdate");
			String id = ((memberDto)req.getSession().getAttribute("user")).getId();
			String title = req.getParameter("title");
			
			System.out.println(endDate +" "+startDate+" "+id + "  "+ title);
			int cnt = Integer.parseInt(endDate)-Integer.parseInt(startDate)+1;
			if(cnt != dao.getDiaryCount(startDate, endDate,id)) {
				pw.print("cntfalse");
				return;
			}
			
			if(cnt != dao.checkJournal(startDate, endDate,id)) {
				pw.print("checkfalse");
				return;
			}
			
			JournalDto dto = new JournalDto();
			
			dto.setEndDate(endDate);
			dto.setStartDate(startDate);
			dto.setId(id);
			dto.setTitle(title);
	
			dao.addJournal(dto);
			
			
			
			pw.print(true);

		}else if(command.equals("jourCancle")) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			String id = ((memberDto)req.getSession().getAttribute("user")).getId();
			
			JournalDto jdto = dao.getJournalDto(seq);
			
			boolean b = dao.changeDiariesJour_Check_zero(id, jdto.getStartDate().substring(0, 10), jdto.getEndDate().substring(0, 10));
			
			if(b) {
				dao.deleteJournal(seq);
				//코멘트 다 삭제
				dao.CommentDeletes(seq);
				
				PrintWriter pw = resp.getWriter();
				pw.print(b);
			}else {
				PrintWriter pw = resp.getWriter();
				pw.print(b);				
			}
		}

		}

	   
	   public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)
	         throws ServletException, IOException {

	      RequestDispatcher dispatch = req.getRequestDispatcher(urls);
	      dispatch.forward(req, resp);
	   }
	

	

}
