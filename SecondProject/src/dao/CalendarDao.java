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
import dto.DiaryDto;
 

public class CalendarDao implements CalendarImpl{
	private static CalendarDao dao = new CalendarDao();
	
	private CalendarDao() {}
	
	public static CalendarDao getInstance() {
		return dao;
	}
	
	//캘린더에  여행일지 제목 뿌려주기
		@Override
		public List<DiaryDto> getCalList(String id) {
			
			String sql = " SELECT SEQ , ID , TDAY , TITLE , CONTENT , LIKED "
					+ " FROM DIARY "
					+ " WHERE ID = ? " ; 
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			 List<DiaryDto> list = new ArrayList<DiaryDto>();
		
			try {
				conn = DBConnection.makeConnection();
				System.out.println("1/6 getCalList 성공");
				
				psmt = conn.prepareStatement(sql);		
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				System.out.println("2/6 getCalList 성공");
			
				while(rs.next()) {
					DiaryDto dto = new DiaryDto();
					dto.setLiked(rs.getInt(1));
					dto.setContent(rs.getString(2));					
					dto.setTday(rs.getString(3));
					dto.setTitle(rs.getString(4));
					dto.setId(id);
					dto.setSeq(rs.getInt(6));


				
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
