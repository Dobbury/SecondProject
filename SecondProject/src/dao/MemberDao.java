package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

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
	
	// 아이디 중복체크
	@Override
	public List<String> idcheck() {
		
		String sql = " SELECT ID "
				+ 	 " FROM MEM ";
				
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();
		
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while(rs.next()) {
				list.add(rs.getString(1));
			}
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
		
	}

	@Override
	public int dosignup(String id, String pw, String name, String nick) {
		
		String sql = " INSERT INTO MEM (ID,PW,NAME,NICK) "
				+ 	 " VALUES (?,?,?,?) ";
				
		Connection conn = null; 
		PreparedStatement psmt = null; 

		int count = 0; 

		try { 
		conn = DBConnection.makeConnection();
		psmt = conn.prepareStatement(sql); 
		
		psmt.setString(1, id.trim()); 
		psmt.setString(2, pw.trim()); 
		psmt.setString(3, name.trim()); 
		psmt.setString(4, nick.trim()); 
		
		count = psmt.executeUpdate(); 

		} catch (SQLException e) { 
		e.printStackTrace(); 
		} finally { 
			DBClose.close(psmt, conn, null); 
		} 

		return count; 
		}


	
}
