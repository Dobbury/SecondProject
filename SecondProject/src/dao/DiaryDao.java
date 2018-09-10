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

		String sql = "INSERT INTO DIARY(CONTENT,TITLE,TDAY,ID,SEQ,PINS,JOUR_CHECK,FIRST_IMG) VALUES(?,?,?,?,SEQ_DIARY.NEXTVAL,?,0,?)";

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
			psmt.setString(5, dto.getPin_Seqs());
			psmt.setString(6, dto.getFisrt_Img());
			
			count = psmt.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;
	}

	public int getCountJournal() {

		String sql = " SELECT COUNT(*) FROM JOURNAL ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		int jcount = 0;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getMemInfo suceess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemInfo suceess");

			rs = psmt.executeQuery();
			if (rs.next()) {
				jcount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("get information failed");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return jcount;
	}

	public List<JournalDto> getJournalList(int page) {

		String sql = " SELECT P.RNUM, P.SEQ, P.START_DATE, P.END_DATE, P.READCOUNT, P.ID, P.LIKE_CNT, P.WDATE, P.TITLE "
				+ " FROM (SELECT ROWNUM AS RNUM, J.SEQ, J.START_DATE, J.END_DATE, J.READCOUNT, J.ID, J.LIKE_CNT, J.WDATE, J.TITLE "
				+ " FROM (SELECT SEQ, START_DATE, END_DATE, READCOUNT, ID, LIKE_CNT, WDATE, TITLE "
				+ " FROM JOURNAL ORDER BY WDATE DESC) J " + " WHERE ROWNUM <= ? ) P " + " WHERE P.RNUM >= ? ";

		
		/*
			select c.rnum, c.seq, c.id, c.title, c.content, c.rdate, c.wdate
			from (select rownum as rnum, a.seq, a.id, a.title, a.content, a.rdate, a.wdate
			from (select seq, id, title, content, rdate, wdate
			from calendar where rdate > to_char(sysdate, 'yyyymmddhh24mi') order by rdate asc) a where rownum <= ? ) c where c.rnum >= ?
		 */
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<JournalDto> list = new ArrayList<>();

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getMemInfo suceess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemInfo suceess");

			psmt.setInt(1, page * 9);
			psmt.setInt(2, page * 9 - 8);

			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new JournalDto(rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6),
						rs.getInt(7), rs.getString(8), rs.getString(9)));

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
				dto = new JournalDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getInt(6), rs.getString(7), rs.getString(8));
			}
		} catch (SQLException e) {
			System.out.println("get information failed");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return dto;

	}

	public List<DiaryDto> getDiaryList(String startdate, String enddate, String id) {
		String sql = " SELECT SEQ,JOUR_CHECK, PINS, ID, TDAY, TITLE, CONTENT FROM DIARY WHERE ? <= TDAY AND ? >= TDAY AND ID = ? ";

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
				String content = rs.getString(7);
				
				content = content.replaceAll("\\\\\"", "\"");
				System.out.println("하위:"+content);
				list.add(new DiaryDto(content,rs.getString(6), rs.getString(5), rs.getString(4), rs.getString(3),rs.getInt(2),
						rs.getInt(1),""));

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
				+ " VALUES(SEQ_DCOMMENT.NEXTVAL,?,?,?,SYSDATE)";

		
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
		String sql = " SELECT SEQ,ID,DCOMMENT,DDAY " + " FROM DIARYCOMMENT " + " WHERE DSEQ = ? "
				+ " ORDER BY DDAY DESC ";

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
				list.add(new DiarycommentDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));

			}
		} catch (SQLException e) {
			System.out.println("get information failed");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;

	}

	// 占쏙옙芳占쏙옙占�
	@Override
	public int CommentDelete(int seq) {

		String sql = " DELETE DIARYCOMMENT " + " WHERE SEQ = ? ";

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
	
	@Override
	public boolean CommentDeletes(int jseq) {
		String sql = " DELETE DIARYCOMMENT " + " WHERE DSEQ = ? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, jseq);

			count = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count>0 ? true:false;
	}

	@Override
	public DiaryDto getDiary(int seq) {
		
		String sql = "SELECT CONTENT,TITLE,TDAY,ID,PINS,JOUR_CHECK,SEQ  FROM DIARY WHERE SEQ=?";
    
    Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		DiaryDto dto = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getDiary suceess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getDiary suceess");
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto = new DiaryDto(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5), rs.getInt(6), rs.getInt(7),"");
      }
		} catch (SQLException e) {
			System.out.println("get information failed");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
    	return dto;
	}
    
	public List<JournalDto> getSearchJournalList(String stext, int page) {
		
		String sql = " SELECT P.RNUM, P.SEQ, P.START_DATE, P.END_DATE, P.READCOUNT, P.ID, P.LIKE_CNT, P.WDATE, P.TITLE "
				+ " FROM (SELECT ROWNUM AS RNUM, J.SEQ, J.START_DATE, J.END_DATE, J.READCOUNT, J.ID, J.LIKE_CNT, J.WDATE, J.TITLE "
				+ " FROM (SELECT SEQ, START_DATE, END_DATE, READCOUNT, ID, LIKE_CNT, WDATE, TITLE "
				+ " FROM JOURNAL WHERE TITLE LIKE('%" + stext + "%') ORDER BY WDATE DESC) J " + " WHERE ROWNUM <= ? ) P " + " WHERE P.RNUM >= ? ";

		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<JournalDto> list = new ArrayList<>();

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getMemInfo suceess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemInfo suceess");
			
			psmt.setInt(1, page * 9);
			psmt.setInt(2, page * 9 - 8);

			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new JournalDto(rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6),
						rs.getInt(7), rs.getString(8), rs.getString(9)));


			}
		} catch (SQLException e) {
			System.out.println("get information failed");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
    return list;
		
	}

	@Override
	public boolean updateDiary(DiaryDto dto) {
		
		String sql ="UPDATE DIARY SET CONTENT=?,TITLE=?,ID=?,PINS=?,JOUR_CHECK=?,FIRST_IMG=? WHERE SEQ=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count=0;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getContent());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getId());
			psmt.setString(4, dto.getPin_Seqs());
			psmt.setInt(5, dto.getJour_check());
			psmt.setString(6, dto.getFisrt_Img());
			psmt.setInt(7, dto.getSeq());
			
			count=psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count>0 ? true:false;
	}

	@Override
	public boolean addJournal(JournalDto dto) {
		
		String sql = "INSERT INTO JOURNAL(TITLE,WDATE,LIKE_CNT,ID,READCOUNT,END_DATE,START_dATE,SEQ) VALUES(?,SYSDATE,0,?,0,?,?,J_SEQ.NEXTVAL)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getEndDate());
			psmt.setString(4, dto.getStartDate());
			
			count = psmt.executeUpdate();

			System.out.println(dto.getStartDate() +" "+ dto.getEndDate());
			DBClose.close(psmt, conn, null);
			
			if(count > 0 ? true : false) {
				sql = "UPDATE DIARY SET JOUR_CHECK=1 WHERE ? <= TDAY AND ? >= TDAY AND ID=?";
				
				conn = DBConnection.makeConnection();
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, dto.getStartDate());
				psmt.setString(2, dto.getEndDate());
				psmt.setString(3, dto.getId());
				
				count = psmt.executeUpdate();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;
		
	}
	
	@Override
	public int getSearchCountJournal(String stext) {
		
		String sql = " SELECT COUNT(*) FROM JOURNAL WHERE TITLE LIKE('%" + stext + "%') ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		int jcount = 0;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getMemInfo suceess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemInfo suceess");
			rs = psmt.executeQuery();
			if (rs.next()) {
				jcount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("get information failed");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return jcount;
		
	}

	@Override
	public void addLike(int seq, String id) {
		
		String sql = " INSERT INTO LIKE_JOURNAL(SEQ, JSEQ, ID) "
				+ " VALUES(SEQ_DCOMMENT.NEXTVAL,?,?)";
		

		Connection conn = null;
		PreparedStatement psmt = null;


		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, seq);
			psmt.setString(2, id.trim());
			psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}

		
	}

	@Override
	public void countLike(int seq) {
		
		String sql = " UPDATE JOURNAL "
				+ " SET LIKE_CNT = LIKE_CNT+1 "
				+ " WHERE SEQ = ? ";
						
		Connection conn = null;
		PreparedStatement psmt = null;
		
		conn = DBConnection.makeConnection();

		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, seq);
			
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int Likecheack(int seq,String loginid) {

		String sql = " SELECT ID "
				+ " FROM LIKE_JOURNAL "
				+ " WHERE ID = ? AND JSEQ = ?";

		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, loginid);
			psmt.setInt(2, seq);

			count = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	
	public int getJournalSeq(String tday) {
		System.out.println("getJournalSeqTest: "+tday);
		String sql = " SELECT SEQ "
				+ "FROM JOURNAL WHERE ? >=START_DATE AND ? <=END_DATE ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int seq = -1;
		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getMemInfo suceess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemInfo suceess");
			psmt.setString(1, tday.substring(0, 10));
			psmt.setString(2, tday.substring(0,10));

			rs = psmt.executeQuery();

			if (rs.next()) {
				seq = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("get information failed");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return seq;

	}
	
	@Override
	public int getDiaryCount(String startdate, String enddate,String id) {
		String sql ="SELECT COUNT(*) FROM DIARY WHERE ? <= TDAY AND ? >= TDAY AND ID = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs= null;
		
		int count=0;
		try {

			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, startdate);
			psmt.setString(2, enddate);
			psmt.setString(3, id);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int checkJournal(String startDate, String endDate,String id) {
		String sql ="SELECT COUNT(*) FROM DIARY WHERE ? <= TDAY AND ? >= TDAY AND ID = ? AND JOUR_CHECK=0";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs= null;
		
		int count=0;
		try {

			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, startDate);
			psmt.setString(2, endDate);
			psmt.setString(3, id);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public boolean changeDiariesJour_Check_zero(String id, String startDate, String endDate) {
		String sql ="UPDATE DIARY SET JOUR_CHECK=0 WHERE ID=? AND ?<=TDAY AND ? >=TDAY";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count=0;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setString(2, startDate);
			psmt.setString(3, endDate);
			
			count=psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count>0 ? true:false;
	}

	@Override
	public boolean deleteJournal(int seq) {
		String sql ="DELETE FROM JOURNAL WHERE SEQ=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count=0;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, seq);
			
			count=psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count>0 ? true:false;
	}
	@Override
	public void deleteLike(int seq, String loginid) {
		String sql = " DELETE FROM LIKE_JOURNAL "
				+	" WHERE ID = ? AND JSEQ = ? " ;
		Connection conn = null;
		PreparedStatement psmt = null;

		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);

			
			psmt.setString(1, loginid.trim());
			psmt.setInt(2, seq);
			
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void countLikedel(int seq) {
		
		String sql = " UPDATE JOURNAL "
				+ " SET LIKE_CNT = LIKE_CNT-1 "
				+ " WHERE SEQ = ? ";
						
		Connection conn = null;
		PreparedStatement psmt = null;
		
		conn = DBConnection.makeConnection();

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			psmt.executeUpdate();

			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


}
