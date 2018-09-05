package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.standard.JobHoldUntil;

import Impl.DiaryImpl;
import db.DBClose;
import db.DBConnection;
import dto.DiaryDto;
import dto.DiarycommentDto;
import dto.JournalDto;

public class DiaryDao implements DiaryImpl {

	private static DiaryDao dao = new DiaryDao();

	private DiaryDao() {
	}

	public static DiaryDao getInstance() {
		return dao;
	}

	@Override
	public boolean addDiary(DiaryDto dto) {

		String sql = "INSERT INTO DIARY(CONTENT,TITLE,TDAY,ID,SEQ) VALUES(?,?,?,?,SEQ_DIARY.NEXTVAL)";

		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getContent());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getTday());
			psmt.setString(4, dto.getId());

			count = psmt.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;
	}

	public List<JournalDto> getJournalList() {


		String sql = " SELECT SEQ, START_DATE, END_DATE, READCOUNT, ID, LIKE_CNT, WDATE, TITLE FROM JOURNAL ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<JournalDto> list = new ArrayList<>();

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getMemInfo suceess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemInfo suceess");

			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new JournalDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getInt(6), rs.getString(7), rs.getString(8)));

			}
		} catch (SQLException e) {
			System.out.println("get information failed");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}

	public JournalDto getJournalDto(int seq) {


		String sql = " SELECT SEQ, START_DATE, END_DATE, READCOUNT, ID, LIKE_CNT, WDATE, TITLE "
				+ "FROM JOURNAL WHERE SEQ = ? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		JournalDto dto = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getMemInfo suceess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemInfo suceess");
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto = new JournalDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8));
			}
		} catch (SQLException e) {
			System.out.println("get information failed");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return dto;

	}

	public List<DiaryDto> getDiaryList(String startdate, String enddate, String id) {
		String sql = " SELECT SEQ, ID, TDAY, TITLE, CONTENT FROM DIARY WHERE ? < TDAY AND ? > TDAY AND ID = ? ";

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
				list.add(new DiaryDto(rs.getString(5), rs.getString(4), rs.getString(3), rs.getString(2),
						rs.getInt(1)));

			}
			System.out.println("5/6 getMemInfo suceess");
		} catch (SQLException e) {
			System.out.println("get information failed");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}


	public int CommantWrite(int seq, String id, String dcomment) {
		String sql = " INSERT INTO DIARYCOMMENT(SEQ, DSEQ, ID, DCOMMENT,DDAY) " 
				+	 " VALUES(SEQ_DCOMMENT.NEXTVAL,?,?,?,SYSDATE)";
		
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
		String sql = " SELECT SEQ,ID,DCOMMENT,DDAY "
				+ " FROM DIARYCOMMENT "
				+ " WHERE DSEQ = ? "
				+ " ORDER BY SEQ ASC ";
		

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
				list.add(new DiarycommentDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)));


			}
		} catch (SQLException e) {
			System.out.println("get information failed");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;

	}
	// ¥Ò±€ªË¡¶
	@Override
	public int CommentDelete(int seq) {

		String sql = " DELETE DIARYCOMMENT "
				+	" WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	

}
