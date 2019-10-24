package ERP.Dependents.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static common.JDBCTemplate.*;
import ERP.Dependents.model.dao.DependentsDao;
import ERP.Dependents.model.vo.Dependents;

public class DependentsService {
	
private DependentsDao dDao = new DependentsDao();
	
	
	public DependentsService() {}


	public int insertDependent(Dependents drr) {
		Connection conn = getConnection();
		int result = dDao.insertDependent(conn, drr);
		if(result > 0) 
			commit(conn);
		else
			rollback(conn);
		close(conn);
		
		return result;
	}


	public ArrayList<Dependents> selectOne(String empId) {
		Connection conn = getConnection();
		ArrayList<Dependents> dpenList = dDao.selectOne(conn, empId);
		close(conn);
		return dpenList;
	}


	public int updateDependent(Dependents d, String fyno) {
		Connection conn = getConnection();
		int result = dDao.updateDependent(conn, d, fyno);
		if(result > 0) 
			commit(conn);
		else
			rollback(conn);
		close(conn);
		
		return result;
	}


	public String[] selectDepenCode(String empId, int dpenSize) {
		Connection conn = getConnection();
		String[] result = dDao.selectDepenCode(conn, empId, dpenSize);
		
		close(conn);
		return result;
	}
}
