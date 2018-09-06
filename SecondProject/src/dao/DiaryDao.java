package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Impl.DiaryImpl;
import db.DBClose;
import db.DBConnection;
import dto.DiaryDto;

public class DiaryDao implements DiaryImpl {

	private static DiaryDao dao = new DiaryDao();
	
	private DiaryDao() {}
	public static DiaryDao getInstance() {
		return dao;
	}
	@Override
	public boolean addDiary(DiaryDto dto) {
		
		
		return false;
	}
	
	
	
	
	public List<DiaryDto> getDiaryList(String startdate, String enddate, String id) {
	      String sql = " SELECT SEQ,JOUR_CHECK, PINS, ID, TDAY, TITLE, CONTENT FROM DIARY WHERE ? < TDAY AND ? > TDAY AND ID = ? ";

	      Connection conn = null;
	      PreparedStatement psmt = null;
	      ResultSet rs = null;

	      List<DiaryDto> list = new ArrayList<>();

	      try {
	         conn = DBConnection.makeConnection();
	         System.out.println("1/6 getMemInfo suceess");

	         psmt = conn.prepareStatement(sql);
	         System.out.println("2/6 getMemInfo suceess");

	         psmt.setString(1, startdate);
	         psmt.setString(2, enddate);
	         psmt.setString(3, id);

	         System.out.println("3/6 getMemInfo suceess");
	         rs = psmt.executeQuery();
	         System.out.println("4/6 getMemInfo suceess");
	         while (rs.next()) {
	            list.add(new DiaryDto(
					            		rs.getString(5), 
					            		rs.getString(4),
					            		rs.getString(3),
					            		rs.getString(2),
					                    rs.getInt(1)       ));

	         }
	         System.out.println("5/6 getMemInfo suceess");
	      } catch (SQLException e) {
	         System.out.println("get information failed");
	      } finally {
	         DBClose.close(psmt, conn, rs);
	      }
	      return list;
	   }
}
