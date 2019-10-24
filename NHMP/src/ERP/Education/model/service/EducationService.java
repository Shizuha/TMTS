package ERP.Education.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.Education.model.dao.EducationDao;
import ERP.Education.model.vo.Education;
import static common.JDBCTemplate.*;

public class EducationService {
	
private EducationDao eDao = new EducationDao();
	
	
	public EducationService () {}


	public int insertEdu(Education e) {
		Connection conn = getConnection();
		int result = eDao.insertEdu(conn, e);
		if(result > 0) 
			commit(conn);
		else
			rollback(conn);
		return result;
	}


	public ArrayList<Education> selectList(String empId) {
		Connection conn = getConnection();
		ArrayList<Education> eduList = eDao.selectList(conn, empId);
		close(conn);
		return eduList;
	}


	public int updateEdu(Education e, String eduCode) {
		Connection conn = getConnection();
		int result = eDao.updateEdu(conn, e, eduCode);
		if(result > 0) 
			commit(conn);
		else
			rollback(conn);
		return result;
	}


	public String[] selectEduCode(String empId, int length) {
		Connection conn = getConnection();
		String[] dCode = eDao. selectEduCode(conn, empId, length);
		close(conn);
		return dCode;
	}
}
