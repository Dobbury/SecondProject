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
	
	@Override
	public boolean editMember(memberDto dto) {
		String sql=" UPDATE MEM "
				+ " SET PWD=?, NICK=?"
				+ " WHERE ID=? ";
		
		Connection conn=null;
		PreparedStatement psmt=null;
		
		int count=0;
		
		try {
			conn=DBConnection.makeConnection();
			System.out.println("1/6 edit member success");
			
			psmt=conn.prepareStatement(sql);
			System.out.println("2/6 edit member success");
			
			psmt.setString(1, dto.getPwd());
			psmt.setString(2, dto.getNick());
			psmt.setString(3, dto.getId());
			
			psmt.executeQuery();
			System.out.println("3/6 edit member success");
			
		} catch (SQLException e) {
			System.out.println("edit member failed");
		}finally {
			DBClose.close(psmt, conn, null);
		}
		System.out.println("4/6 edit member success");
		
		return count>0?true:false;
	}

	@Override
	public memberDto getMemInfo(String id) {
		String sql=" SELECT ID, PWD, NICK, NAME "
				+ " FROM MEM "
				+ " WHERE ID=? ";
		
		Connection conn=null;
		PreparedStatement psmt=null;
		ResultSet rs=null;
		
		memberDto dto=null;
		

		
		try {
			conn=DBConnection.makeConnection();
			System.out.println("1/6 getMemInfo suceess");
			
			psmt=conn.prepareStatement(sql);
			System.out.println("2/6 getMemInfo suceess");
			
			psmt.setString(1, dto.getId());
			
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				dto=new memberDto();
				
				dto.setId(rs.getString("ID"));
				dto.setPwd(rs.getString("PWD"));
				dto.setNick(rs.getString("NICK"));
				dto.setName(rs.getString("Name"));
				
			}
		} catch (SQLException e) {
			System.out.println("get information failed");
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return dto;
	}
	
	
	

}
