package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Impl.MemberImpl;
import db.DBClose;
import db.DBConnection;
import dto.memberDto;

public class MemberDao implements MemberImpl {
	
	private static MemberDao dao = new MemberDao();
	
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		return dao;
	}
	
	public memberDto doLogin(String id, String pw) {
		
		String sql = " SELECT ID, NICK, NAME FROM MEM WHERE ID = ? AND PW = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		memberDto dto = null;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new memberDto(rs.getString(1), rs.getString(2), rs.getString(3));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return dto;
	}
}
