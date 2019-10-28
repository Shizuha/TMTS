package ERP.counselingLog.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ERP.counselingLog.model.vo.CounselingLog;

public class CounselingLogDao {
	public CounselingLogDao() {}
	
	public ArrayList<CounselingLog> selectAll(Connection conn) {
		ArrayList<CounselingLog> list = new ArrayList<CounselingLog>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from counselinglog";
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				CounselingLog counselingLog = new CounselingLog();
				
				counselingLog.setClNo(rset.getInt("cl_no"));
				counselingLog.setClTitle(rset.getString("cl_title"));
				counselingLog.setClDate(rset.getDate("cl_date"));
				counselingLog.setClContents(rset.getString("cl_contents"));
				counselingLog.setClPhone(rset.getString("cl_phone"));
				counselingLog.setClComment(rset.getString("cl_comment"));
				counselingLog.setClPatName(rset.getString("cl_pat_name"));
				counselingLog.setClEmpName(rset.getString("cl_emp_name"));
				counselingLog.setClOriginalFileName(rset.getString("cl_original_filename"));
				counselingLog.setClRenameFileName(rset.getString("cl_rename_filename"));
				
				list.add(counselingLog);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	public CounselingLog DetailView(Connection conn, int clNo) {
		CounselingLog counselingLog = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from counselinglog where cl_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, clNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				counselingLog = new CounselingLog();
				
				counselingLog.setClNo(rset.getInt("cl_no"));
				counselingLog.setClTitle(rset.getString("cl_title"));
				counselingLog.setClDate(rset.getDate("cl_date"));
				counselingLog.setClContents(rset.getString("cl_contents"));
				counselingLog.setClPhone(rset.getString("cl_phone"));
				counselingLog.setClComment(rset.getString("cl_comment"));
				counselingLog.setClPatName(rset.getString("cl_pat_name"));
				counselingLog.setClEmpName(rset.getString("cl_emp_name"));
				counselingLog.setClOriginalFileName(rset.getString("cl_original_filename"));
				counselingLog.setClRenameFileName(rset.getString("cl_rename_filename"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return counselingLog;
	}
	
	public int insertCounselingLog(Connection conn, CounselingLog counselingLog) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into counselingLog values("
				+ "cl_seq.nextval, ?, default, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, counselingLog.getClTitle());
			pstmt.setString(2, counselingLog.getClContents());
			pstmt.setString(3, counselingLog.getClPhone());
			pstmt.setString(4, counselingLog.getClComment());
			pstmt.setString(5, counselingLog.getClPatName());
			pstmt.setString(6, counselingLog.getClEmpName());
			pstmt.setString(8, counselingLog.getClOriginalFileName());
			pstmt.setString(9, counselingLog.getClRenameFileName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public CounselingLog search(Connection conn, String clPatName) {
		CounselingLog counselingLog = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from counselinglog where cl_pat_Name like? order by cl_no desc";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, clPatName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				counselingLog = new CounselingLog();
				
				counselingLog.setClNo(rset.getInt("cl_no"));
				counselingLog.setClTitle(rset.getString("cl_title"));
				counselingLog.setClDate(rset.getDate("cl_date"));
				counselingLog.setClComment(rset.getString("cl_contents"));
				counselingLog.setClPhone(rset.getString("cl_phone"));
				counselingLog.setClComment(rset.getString("cl_comment"));
				counselingLog.setClPatName(rset.getString("cl_pat_name"));
				counselingLog.setClEmpName(rset.getString("cl_emp_name"));
				counselingLog.setClOriginalFileName(rset.getString("cl_original_filename"));
				counselingLog.setClRenameFileName(rset.getString("cl_rename_filename"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return counselingLog;
	}
}
