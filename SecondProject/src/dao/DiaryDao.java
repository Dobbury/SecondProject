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

            list.add(new DiaryDto(rs.getString(7),rs.getString(6), rs.getString(5), rs.getString(4), rs.getString(3),rs.getInt(2),
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
            list.add(new DiarycommentDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));

         }
      } catch (SQLException e) {
         System.out.println("get information failed");
      } finally {
         DBClose.close(psmt, conn, rs);
      }
      return list;

   }

   // ��ۻ���
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
public int countMyJournal(String id) {
	 String sql = " SELECT COUNT(*) FROM JOURNAL WHERE id=? ";
     
     Connection conn = null;
     PreparedStatement psmt = null;
     ResultSet rs = null;

     int jcount = 0;

     try {
        conn = DBConnection.makeConnection();
        System.out.println("1/6 getMemInfo suceess");

        psmt = conn.prepareStatement(sql);
        System.out.println("2/6 getMemInfo suceess");
        psmt.setString(1, id);
        
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
public List<JournalDto> myJournalList(String id, int page) {
	String sql = " SELECT P.RNUM, P.SEQ, P.START_DATE, P.END_DATE, P.READCOUNT, P.ID, P.LIKE_CNT, P.WDATE, P.TITLE "
            + " FROM (SELECT ROWNUM AS RNUM, J.SEQ, J.START_DATE, J.END_DATE, J.READCOUNT, J.ID, J.LIKE_CNT, J.WDATE, J.TITLE "
            + " FROM (SELECT SEQ, START_DATE, END_DATE, READCOUNT, ID, LIKE_CNT, WDATE, TITLE "
            + " FROM JOURNAL WHERE ID = '" + id + "' ORDER BY WDATE DESC) J " + " WHERE ROWNUM <= ? ) P " + " WHERE P.RNUM >= ? ";

	Connection conn = null;
    PreparedStatement psmt = null;
    ResultSet rs = null;

    List<JournalDto> list = new ArrayList<>();

    try {
       conn = DBConnection.makeConnection();
       System.out.println("1/6 getMemInfo suceess");

       psmt = conn.prepareStatement(sql);
       System.out.println("2/6 getMemInfo suceess");

       psmt.setInt(1, page * 6);
       psmt.setInt(2, page * 6 - 5);

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
}


