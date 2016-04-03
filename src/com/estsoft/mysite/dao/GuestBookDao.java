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

	public void insert(GuestBookVo vo) {  //vo 인풋을 받는다
		Connection conn = null;
		PreparedStatement pstmt = null;

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

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}

			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
	}

	public List<GuestBookVo> getList() { // DB에서 가져오는 메소드야!!
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

}
