package ERP.notice.model.dao;

import static common.JDBCTemplate.*;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import ERP.notice.model.vo.Notice;


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

}
