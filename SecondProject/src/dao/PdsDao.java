package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Impl.PdsImpl;
import db.DBClose;
import db.DBConnection;


public class PdsDao implements PdsImpl{
	private static PdsDao dao = new PdsDao();
	
	private PdsDao() {}
	
	public static PdsDao getInstance() {
		return dao;
	}
	
	// ¥Ò±€ æ≤±‚ ¿ŒΩ‰∆Æ
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

	
}
