package ERP.Empment.model.service;

import java.sql.Connection;

import ERP.Empment.model.dao.EmpmentDao;
import static common.JDBCTemplate.*;

public class EmpmentService {
	
	private EmpmentDao emDao = new EmpmentDao();
	
	
	public EmpmentService () {}


	public String selectEmpmentName(String empmentCode) {
		Connection conn = getConnection();
		String empmentName = emDao.selectEmpId(conn, empmentCode);
		close(conn);
		return empmentName;
	}
}
