package com.estsoft.mysite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.estsoft.db.DBConnection;
import com.estsoft.db.MySQLWebDBConnection;
import com.estsoft.mysite.vo.GuestBookVo;
import com.estsoft.mysite.vo.UserVo;

public class GuestBookDao {
	private DBConnection dbConnection;
	// 원래 MYSQLWebDBConnection 형이었다가 인터페이스 만들고 바꿔줌!

	public GuestBookDao ( MySQLWebDBConnection dbConnection ) {
		this.dbConnection = dbConnection;
	}

	 public void delete( GuestBookVo vo ) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      try {
	         conn = dbConnection.getConnection( );
	         //
	         String sql = "DELETE FROM guestbook WHERE no=? AND passwd= password(?)";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setLong(1, vo.getNo( ));
	         pstmt.setString(2, vo.getPasswd( ));
	         pstmt.executeUpdate( );

	      } catch (SQLException ex) {
	         System.out.println("Error" + ex);
	         ex.printStackTrace();
	      }
	   }

	public Long insert(GuestBookVo vo) {  //vo 인풋을 받는다
		Long no = 0L;
		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = dbConnection.getConnection();

//			String sql = "INSERT INTO guestbook VALUES (null, ?, NOW( ), ?, ?)";
			//암호화 시키는 목적이 있기 때문에 ㅋㅋㅋㅋ 추가해준다! 이것때문에 안됐구만;;
			String sql = "INSERT INTO guestbook VALUES (null, ?, NOW( ), ?, password(?))";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName( ) );
			pstmt.setString(2, vo.getMessage( ) );
			pstmt.setString(3, vo.getPasswd( ) );
			pstmt.executeUpdate();
			
			stmt = conn.createStatement( );
			rs = stmt.executeQuery("SELECT LAST_INSERT_ID( )");
			if (rs.next( ) ) {
				no = rs.getLong(1);
			}
			return no;	
		} catch (SQLException ex) {
			ex.printStackTrace();
			return 0L;
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if( rs != null) {
					rs.close();
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
	}

	public GuestBookVo get( Long no ) {
		GuestBookVo vo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbConnection.getConnection();
			String sql = "SELECT name, passwd, message, reg_date FROM guestbook WHERE no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, no );
			
			rs = pstmt.executeQuery();
			if( rs.next( ) ) {
				String name = rs.getString(1);
				String password = rs.getString(2);
				String message= rs.getString(3);
				String regDate = rs.getString(4);
				
				vo = new GuestBookVo( );
				vo.setName(name);
				vo.setPasswd(password);
				vo.setMessage(message);
				vo.setRegDate(regDate);
			}
			return vo;
		} catch (SQLException e) {
			System.out.println("error : "+e);
			return null;
		} finally {
			try {
				if( rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch ( SQLException e ) {
				e.printStackTrace();
			}
		}
	}	
	public List<GuestBookVo> getList( ) { // DB에서 가져오는 메소드야!!
		List<GuestBookVo> list = new ArrayList<GuestBookVo>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = dbConnection.getConnection();
			stmt = conn.createStatement();

			String sql = "SELECT no, name, reg_date, message FROM guestbook ORDER BY reg_date DESC";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				Long no = rs.getLong(1);
				String name = rs.getString(2);
				String regDate = rs.getString(3);
				String message = rs.getString(4);

				GuestBookVo vo = new GuestBookVo();
				vo.setNo(no);
				vo.setName(name);
				vo.setRegDate(regDate);
				vo.setMessage(message);
				list.add(vo);
			}

		} catch (SQLException ex) {
			System.out.println("error : " + ex);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				} 
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		return list;
	}
	
	public List<GuestBookVo> getList( int page ) { // DB에서 가져오는 메소드야!!
		List<GuestBookVo> list = new ArrayList<GuestBookVo>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = dbConnection.getConnection();
			stmt = conn.createStatement();

			String sql = "SELECT no, name, reg_date, message "
					+ "FROM guestbook ORDER BY reg_date DESC "
					+ "LIMIT "+ (page-1)*5 +", 5";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				Long no = rs.getLong(1);
				String name = rs.getString(2);
				String regDate = rs.getString(3);
				String message = rs.getString(4);

				GuestBookVo vo = new GuestBookVo();
				vo.setNo(no);
				vo.setName(name);
				vo.setRegDate(regDate);
				vo.setMessage(message);
				list.add(vo);
			}

		} catch (SQLException ex) {
			System.out.println("error : " + ex);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				} 
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		return list;
	}

}
