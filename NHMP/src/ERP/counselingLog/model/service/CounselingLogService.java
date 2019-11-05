package ERP.counselingLog.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.Employee.model.vo.Employee;
import ERP.counselingLog.model.dao.CounselingLogDao;
import ERP.counselingLog.model.vo.CounselingLog;

public class CounselingLogService {
	private CounselingLogDao cldao = new CounselingLogDao();
	
	public CounselingLogService() {}
	
	public ArrayList<CounselingLog> ListView(Employee emp) {
		Connection conn = getConnection(emp.getHostId(), emp.getHostPwd());
		ArrayList<CounselingLog> list = cldao.ListView(conn);
		close(conn);
		return list;
	}
	
	public CounselingLog DetailView(Employee emp, int clNo) {
		Connection conn = getConnection(emp.getHostId(), emp.getHostPwd());
		CounselingLog counselingLog = cldao.DetailView(conn, clNo);
		close(conn);
		return counselingLog;
	}
	
	public int insertCounselingLog(Employee emp, CounselingLog counselingLog) {
		Connection conn = getConnection(emp.getHostId(), emp.getHostPwd());
		int result = cldao.insertCounselingLog(conn, counselingLog);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int updateCounselingLog(Employee emp, CounselingLog counselingLog) {
		Connection conn = getConnection(emp.getHostId(), emp.getHostPwd());
		int result = cldao.updateCounselingLog(conn, counselingLog);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteCounselingLog(Employee emp, int clNo) {
		Connection conn = getConnection(emp.getHostId(), emp.getHostPwd());
		int result = cldao.deleteConselingLog(conn, clNo);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	public ArrayList<CounselingLog> selectTitleSearch(Employee emp, String clTitle) {
		Connection conn = getConnection(emp.getHostId(), emp.getHostPwd());
		ArrayList<CounselingLog> list = cldao.selectTitleSearch(conn, clTitle);
		close(conn);
		return list;
	}

	public ArrayList<CounselingLog> selectClEmpNameSearch(Employee emp, String clEmpName) {
		Connection conn = getConnection(emp.getHostId(), emp.getHostPwd());
		ArrayList<CounselingLog> list = cldao.selectClEmpNameSearch(conn, clEmpName);
		close(conn);
		return list;
	}
}
