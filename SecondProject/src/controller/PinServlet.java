package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Impl.PinImpl;
import dao.PinDao;
import dto.PinDto;

public class PinServlet extends HttpServlet {

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
		   
		   PinImpl dao = PinDao.getInstance();
		   
		   String command = req.getParameter("command");
		   
		   if(command.equals("insert")) {
			   
				String place_kind =req.getParameter("place_kind");
				String slat = req.getParameter("lat");
				double lat = Double.parseDouble(slat);
				String slng = req.getParameter("lng");
				double lng = Double.parseDouble(slng);
				String pin_name = req.getParameter("pin_name");
				String location = req.getParameter("location");
				
				PinDto dto = new PinDto(lat,lng,pin_name,place_kind,location);
				System.out.println(dto.toString());
				dao.Insert(dto);
		   }else if(command.equals("PinSearch")) {
			   String place_kind = req.getParameter("place_kind");
			   String pin_name = req.getParameter("pin_name");
			   
			   List<PinDto> list =dao.PinList(pin_name, place_kind);
			    
			   String result = "[";
			   
			   for(PinDto dto :list) {
				   
				   result+="{";
				   result+="\"lat\":\""+dto.getLat()+"\",\"lng\":\""+dto.getLng()+"\",";
				   result+="\"pin_name\":\""+dto.getPin_name()+"\",\"place_kind\":\""+dto.getKinds()+"\",";
				   result+="\"location\":\""+dto.getLocation()+"\"},";
			   }
			   
			   result = result.substring(0, result.lastIndexOf(","));
			   result +="]";
			   System.out.println(result);
			   PrintWriter pw =resp.getWriter();
			   pw.print((String)result);
		   }
		   
	 }
	
}
