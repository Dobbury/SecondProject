package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Impl.CalendarImpl;
import db.DBClose;
import db.DBConnection;
import dto.CalendarDto;

public class CalendarDao implements CalendarImpl{
	private static CalendarDao dao = new CalendarDao();
	
	private CalendarDao() {}
	
	public static CalendarDao getInstance() {
		return dao;
	}
	
	//캘린더에  여행일지 제목 뿌려주기
		@Override
		public List<CalendarDto> getCalList(String id, String tday) {
			
			String sql = " SELECT TITLE "
					+ " FROM DIARY "
					+ " WHERE ID = ? " + id; 
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			 List<CalendarDto> list = new ArrayList<CalendarDto>();
		
			try {
				conn = DBConnection.makeConnection();
				System.out.println("1/6 getCalList 성공");
				
				psmt = conn.prepareStatement(sql);		 				
			
				rs = psmt.executeQuery();
				System.out.println("2/6 getCalList 성공");
			
				while(rs.next()) {
				 CalendarDto dto = new CalendarDto();
				 dto.setId(id);
				 dto.setToday(tday);
				 dto.setTitle(rs.getString(1));
				
				list.add(dto);
				}
				System.out.println("3/6 getCalList 성공"); 	
				
			} catch (SQLException e) { 
				e.printStackTrace();
			}finally {
				DBClose.close(psmt, conn, rs);
				System.out.println("4/6 getCalList 성공"); 
			}
			
			return list;
		}

}
