package ERP.notice.model.dao;

import static common.JDBCTemplate.*;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import ERP.notice.model.vo.Notice;
import ERP.Employee.model.vo.*;

public class NoticeDao {

	public ArrayList<Notice> selectAll(Connection conn) {
		//공지사항 전체 화면
		ArrayList<Notice> list = new ArrayList<Notice>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from notice order by notice_no desc";
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Notice notice = new Notice();
				
				notice.setNoticeNo(rset.getInt("notice_no"));
				notice.setNoticeTitle(rset.getString("notice_title"));
				notice.setNoticeContent(rset.getString("notice_content"));
				notice.setNoticeCount(rset.getInt("notice_count"));
				notice.setNoticeWriter(rset.getString("notice_writer"));
				notice.setNoticeDate(rset.getDate("notice_date"));
			
				list.add(notice);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public Notice selectOne(Connection conn, int noticeNo) {
		// 공지사항 클릭시 상세 화면
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		
		String query = "select * from notice where notice_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				notice = new Notice();
				
				notice.setNoticeNo(rset.getInt("notice_no"));
				notice.setNoticeTitle(rset.getString("notice_title"));
				notice.setNoticeContent(rset.getString("notice_content"));
				notice.setNoticeCount(rset.getInt("notice_count"));
				notice.setNoticeWriter(rset.getString("notice_writer"));
				notice.setNoticeDate(rset.getDate("notice_date"));
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return notice;
	}


	// 조회수 처리하는 dao
	public int updateReadCount(Connection conn, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query ="update notice "
				+ "set notice_count = notice_count + 1 "
				+ "where notice_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}	
		return result;
	}
	
		//조회수 페이징
		public int getListCount(Connection conn) {
			int listCount = 0;
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select count(*) from notice";
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(stmt);
			}
			return listCount;
		}
	

		//페이징 처리
		public ArrayList<Notice> selectList(Connection conn, int startRow, int endRow) {
			ArrayList<Notice> list = new ArrayList<Notice>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			///쿼리문 모르겠음
			String query = "select * from ("
					+ "select rownum rnum, notice_no, notice_title, notice_content,"
					+ "notice_count, notice_writer,"
					+ " notice_date from (select * from notice order by notice_no desc)) " 
					+ " where rnum >= ? and rnum <= ?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Notice notice = new Notice();
					
					notice.setNoticeNo(rset.getInt("notice_no"));
					notice.setNoticeTitle(rset.getString("notice_title"));
					notice.setNoticeContent(rset.getString("notice_content"));
					notice.setNoticeCount(rset.getInt("notice_count"));
					notice.setNoticeWriter(rset.getString("notice_writer"));
					notice.setNoticeDate(rset.getDate("notice_date"));
					
					list.add(notice);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
		}
		
		//글 추가 dao
		public int insertNotice(Connection conn, Notice notice) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String query = "INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, ?, " + 
					"?, default, SYSDATE, ?)";
			
			try {
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, notice.getNoticeTitle());
				pstmt.setString(2, notice.getNoticeContent());
				pstmt.setString(3, notice.getNoticeWriter());
			
				
				
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}

		public ArrayList<Notice> selectTop3(Connection conn) {
			ArrayList<Notice> list = new ArrayList<Notice>();
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "SELECT * FROM (SELECT ROWNUM RNUM, NOTICE_NO, NOTICE_TITLE, NOTICE_DATE " + 
					"FROM (SELECT * FROM NOTICE ORDER BY NOTICE_DATE DESC)) WHERE RNUM >= 1 AND RNUM <= 8";
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Notice n = new Notice();
					
					n.setNoticeNo(rset.getInt("notice_no"));
					n.setNoticeTitle(rset.getString("notice_title"));
					n.setNoticeDate(rset.getDate("notice_date"));
		
					list.add(n);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset); 
				close(stmt);
			}
			
			return list;
		}
}











