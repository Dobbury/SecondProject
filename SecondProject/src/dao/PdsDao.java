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

	@Override
	public int CommantWrite(int seq, String id, String dcomment) {
		
		String sql = " INSERT INTO DIARYCOMMANT(SEQ, DSEQ, ID, DCOMMENT) " 
				+	 " VALUES (SEQ_DCOMMENT.NEXTVAL,?,?,?)";
		
		Connection conn = null; 
		PreparedStatement psmt = null; 

		int count = 0; 

		try { 
		conn = DBConnection.makeConnection();
		psmt = conn.prepareStatement(sql); 
		
		psmt.setInt(1, seq);
		psmt.setString(2, id.trim()); 
		psmt.setString(3, dcomment.trim()); 

		count = psmt.executeUpdate(); 

		} catch (SQLException e) { 
		// TODO Auto-generated catch block 
		e.printStackTrace(); 
		} finally { 
		DBClose.close(psmt, conn, null); 
		} 

		return count; 
		}

		
	
	
	
	
	
}
