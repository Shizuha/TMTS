package ERP.counselingLog.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.counselingLog.model.dao.CounselingLogDao;
import ERP.counselingLog.model.vo.CounselingLog;

import static common.JDBCTemplate.*;

public class CounselingLogService {
	private CounselingLogDao cldao = new CounselingLogDao();
	
	public CounselingLogService() {}
	
	public ArrayList<CounselingLog> ListView() {
		Connection conn = getConnection();
		ArrayList<CounselingLog> list = cldao.ListView(conn);
		close(conn);
		return list;
	}
	
	public CounselingLog DetailView(int clNo) {
		Connection conn = getConnection();
		CounselingLog counselingLog = cldao.DetailView(conn, clNo);
		close(conn);
		return counselingLog;
	}
	
	public int insertCounselingLog(CounselingLog counselingLog) {
		Connection conn = getConnection();
		int result = cldao.insertCounselingLog(conn, counselingLog);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int updateCounselingLog(CounselingLog counselingLog) {
		Connection conn = getConnection();
		int result = cldao.updateCounselingLog(conn, counselingLog);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteCounselingLog(int clNo) {
		Connection conn = getConnection();
		int result = cldao.deleteConselingLog(conn, clNo);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public CounselingLog search(String clPatName) {
		Connection conn = getConnection();
		CounselingLog counselingLog = cldao.search(conn, clPatName);
		close(conn);
		return counselingLog;
	}
}
