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
import dto.DiarycommentDto;



public class DiaryDao implements DiaryImpl {

	private static DiaryDao dao = new DiaryDao();
	
	private DiaryDao() {}
	public static DiaryDao getInstance() {
		return dao;
	}
	@Override
	public boolean addDiary(DiaryDto dto) {
		
		String sql = "INSERT INTO DIARY(LIKED,CONTENT,TITLE,TDAY,ID,SEQ) VALUES(?,?,?,?,?,SEQ_DIARY.NEXTVAL)";
		
		Connection conn =null;
		PreparedStatement psmt = null;
		int count=0;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, dto.getLiked());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getTday());
			psmt.setString(5, dto.getId());
			
			count = psmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt,conn,null);
		}

		return count >0 ? true : false ;
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
			System.out.println("1/6 getMemInfo suceess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemInfo suceess");
			
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
	
	

	public int CommantWrite(int seq, String id, String dcomment) {
		String sql = " INSERT INTO DIARYCOMMENT(SEQ, DSEQ, ID, DCOMMENT) " 
				+	 " VALUES(SEQ_DCOMMENT.NEXTVAL,?,?,?)";
		
		Connection conn = null; 
		PreparedStatement psmt = null; 

		int count = 0; 

		try { 
		conn = DBConnection.makeConnection();
		psmt = conn.prepareStatement(sql);
		System.out.println("1/6");
		
		
		psmt.setInt(1, seq);
		System.out.println("aa");
		psmt.setString(2, id.trim());
		System.out.println("bb");
		psmt.setString(3, dcomment.trim());
		System.out.println("cc");
		count = psmt.executeUpdate(); 
		System.out.println("2/6");
		} catch (SQLException e) { 
		// TODO Auto-generated catch block 
		e.printStackTrace(); 
		} finally { 
		DBClose.close(psmt, conn, null); 
		System.out.println("3/6");
		} 

		return count; 
		}
	
	@Override
	public List<DiarycommentDto> Commantview(int seq) {
		String sql = " SELECT ID,DCOMMENT "
				+ " FROM DIARYCOMMENT "
				+ " WHERE DSEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<DiarycommentDto> list = new ArrayList<>();
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getMemInfo suceess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemInfo suceess");
			
			psmt.setInt(1, seq);

			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new DiarycommentDto(rs.getString(1),rs.getString(2)));

			}
		} catch (SQLException e) {
			System.out.println("get information failed");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
		
		
		
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
			System.out.println("1/6 getMemInfo suceess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemInfo suceess");
			
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
