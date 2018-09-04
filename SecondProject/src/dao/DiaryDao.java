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
	
	public List<DiaryDto> getDiaryList(){
		
		String sql = " SELECT SEQ, ID, TDAY, TITLE, CONTENT, LIKED FROM DIARY ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<DiaryDto> list = new ArrayList<>();
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getMemInfo suceess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemInfo suceess");

			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new DiaryDto(rs.getInt(6), rs.getString(5), rs.getString(4), rs.getString(3), rs.getString(2), rs.getInt(1)));

			}
		} catch (SQLException e) {
			System.out.println("get information failed");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	
	public DiaryDto getDiaryDto(int seq) {
		String sql = " SELECT SEQ, ID, TDAY, TITLE, CONTENT, LIKED FROM DIARY WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		DiaryDto dto = null;
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getDiaryDto suceess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getDiaryDto suceess");
			
			psmt.setInt(1, seq);

			rs = psmt.executeQuery();

			while (rs.next()) {
				dto = new DiaryDto(rs.getInt(6), rs.getString(5), rs.getString(4), rs.getString(3), rs.getString(2), rs.getInt(1));

			}
		} catch (SQLException e) {
			System.out.println("get information failed");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return dto;
	}
	
}
