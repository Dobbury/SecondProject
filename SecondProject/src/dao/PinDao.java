package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		} finally {
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
			
		} finally {
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
		} finally {
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
		} finally {
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

	@Override

	public List<String[]> pinAVG() {
		String sql ="SELECT PINCOMMENT.PINNAME,KINDS,AVG(GRADE) AS GRADE_AVG "
				+ "FROM PINCOMMENT, PIN "
				+ "WHERE PINCOMMENT.PINNAME = PIN.PINNAME "
				+ "GROUP BY PINCOMMENT.PINNAME,KINDS "
				+ "ORDER BY GRADE_AVG DESC";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<String[]> list = null;
		
		try {

			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			list = new ArrayList<>();
			while(rs.next()) {
				String arr[] = {rs.getString(1),rs.getString(2),String.format("%.2f", rs.getDouble(3))}; 
				list.add(arr);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}

	public List<String[]> getAllPinList(int page) {
		String sql = " SELECT B.RNUM, B.PINNAME, B.KINDS, B.GRADE_AVG "
				+ " FROM (SELECT ROWNUM AS RNUM, A.PINNAME, A.KINDS, A.GRADE_AVG "
				+ " FROM (SELECT PINCOMMENT.PINNAME AS PINNAME,KINDS,AVG(GRADE) AS GRADE_AVG "
				+ " FROM PINCOMMENT, PIN WHERE PINCOMMENT.PINNAME = PIN.PINNAME GROUP BY PINCOMMENT.PINNAME,KINDS) A WHERE ROWNUM <= ? ) B WHERE B.RNUM >= ? ";
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<String[]> list = null;
		
		try {

			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, page*9);
			psmt.setInt(2, page*9-8);
			rs = psmt.executeQuery();
			list = new ArrayList<>();
			while(rs.next()) {
				String arr[] = {rs.getString(2),rs.getString(3),String.format("%.2f", rs.getDouble(4))}; 
				list.add(arr);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
		
	}

	@Override
	public int getAllPinCount() {
		String sql = " SELECT COUNT(*) FROM PIN ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		int pcount = 0;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getMemInfo suceess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemInfo suceess");

			rs = psmt.executeQuery();
			if (rs.next()) {
				pcount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("get information failed");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return pcount;
	}

	@Override
	public List<PinDto> getSearchPinList(int page, String stext) {
		String sql = " SELECT B.RNUM, B.LATI, B.LONGI, B.PINNAME, B.KINDS, B.LOC "
				+ " FROM (SELECT ROWNUM AS RNUM, A.LATI, A.LONGI, A.PINNAME, A.KINDS, A.LOC "
				+ " FROM (SELECT LATI, LONGI, PINNAME, KINDS, LOC "
				+ " FROM PIN WHERE PINNAME LIKE('%" + stext + "%')) A WHERE ROWNUM <= ? ) B WHERE B.RNUM >= ? ";
		
		
		Connection conn =null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<PinDto> list = new ArrayList<>();
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, page*9);
			psmt.setInt(2, page*9-8);
			
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				list.add(new PinDto(
						rs.getDouble(2),
						rs.getDouble(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6)
						));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}

	@Override
	public int getSearchPinCount(String stext) {
		String sql = " SELECT COUNT(*) FROM PIN WHERE PINNAME LIKE('%" + stext + "%') ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		int pcount = 0;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 getMemInfo suceess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getMemInfo suceess");

			rs = psmt.executeQuery();
			if (rs.next()) {
				pcount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("get information failed");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return pcount;
	}

	@Override
	public List<pinCommentDto> getPinCommentList(String pin_name) {
		String sql = " SELECT GRADE,PCOMMENT,ID,PINNAME,SEQ FROM PINCOMMENT WHERE PINNAME = ? ";
		
		Connection conn =null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<pinCommentDto> list = new ArrayList<>();
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, pin_name);
		
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				pinCommentDto Dto =new pinCommentDto(
						rs.getDouble(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5)
						);
				list.add(Dto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
		
	}
	
	

}
