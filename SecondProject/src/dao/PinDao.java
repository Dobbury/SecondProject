package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Impl.PinImpl;
import db.DBClose;
import db.DBConnection;
import dto.PinDto;
import dto.pinCommentDto;

public class PinDao implements PinImpl {
	private static PinDao dao = new PinDao();
	
	private PinDao() {}
	
	public static PinDao getInstance() {
		return dao;
	}
	
	public boolean Insert(PinDto dto) {
		
		String sql = "INSERT INTO PIN(LONGI,LATI,LOC,KINDS,PINNAME) VALUES(?,?,?,?,?)";
		
		Connection conn =null;
		
		PreparedStatement psmt = null;
		int count=0;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, dto.getLng());
			psmt.setDouble(2, dto.getLat());
			psmt.setString(3, dto.getLocation());
			psmt.setString(4, dto.getKinds());
			psmt.setString(5, dto.getPin_name());
			
			count = psmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt,conn,null);
		}

		return count >0 ? true : false ;
		
	}

	@Override
	public List<PinDto> PinList(String pin_name, String place_kind) {
		
		String sql = "SELECT LATI,LONGI,PINNAME,KINDS,LOC FROM PIN WHERE PINNAME LIKE ? AND KINDS=?";
		
		Connection conn =null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<PinDto> list = new ArrayList<>();
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, "%"+pin_name+"%");
			psmt.setString(2, place_kind);
			
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				list.add(new PinDto(
						rs.getDouble(1),
						rs.getDouble(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5)
						));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}

	@Override
	public boolean PinCommentInsert(pinCommentDto dto) {
		
		String sql = "INSERT INTO PINCOMMENT(GRADE,PCOMMENT,ID,PINNAME,SEQ) VALUES(?,?,?,?,SEQ_PINC.NEXTVAL)";
		
		
		Connection conn =null;
		PreparedStatement psmt = null;
		int count=0;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setDouble(1, dto.getGrade());
			psmt.setString(2, dto.getPcomment());
			psmt.setString(3, dto.getId());
			psmt.setString(4, dto.getPinname());
			
			count = psmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt,conn,null);
		}

		return count >0 ? true : false ;
		
	}

	@Override
	public PinDto getPin(String pin_name) {
		
		String sql = "SELECT LATI,LONGI,PINNAME,KINDS,LOC FROM PIN WHERE PINNAME=?";
		
		Connection conn =null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		PinDto Dto = null;
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1,pin_name);
		
			
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				Dto =new PinDto(
						rs.getDouble(1),
						rs.getDouble(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5)
						);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			DBClose.close(psmt, conn, rs);
		}
		
		return Dto;
	}

	@Override
	public int getLastPinSeq() {
		String sql= "SELECT MAX(SEQ) FROM PINCOMMENT";
		
		Connection conn =null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int seq=-1;
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			System.out.println("11111");
			if(rs.next()) {
				System.out.println("22222");
				seq=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			DBClose.close(psmt, conn, rs);
		}
		
		return seq;
	}

	@Override
	public pinCommentDto getPinComment(int seq) {
		 
		String sql = "SELECT GRADE,PCOMMENT,ID,PINNAME,SEQ FROM PINCOMMENT WHERE SEQ=?";
		
		Connection conn =null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		pinCommentDto Dto = null;
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1,seq);
		
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				Dto =new pinCommentDto(
						rs.getDouble(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5)
						);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			DBClose.close(psmt, conn, rs);
		}
		
		return Dto;
	}

	@Override
	public boolean delPinComment(int seq) {

		String sql = "DELETE FROM PINCOMMENT WHERE SEQ=?";
		
		
		Connection conn =null;
		PreparedStatement psmt = null;
		int count=0;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, seq);
			
			count = psmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt,conn,null);
		}

		return count >0 ? true : false ;
	}
}
