package ERP.Department.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.Department.model.dao.DepartmentDao;
import ERP.Department.model.vo.Department;
import static common.JDBCTemplate.*;

public class DepartmentService {
	private DepartmentDao dDao = new DepartmentDao();
	
	public DepartmentService() {}
	
public ArrayList<Department> selectAll(String hostId, String hostPwd) {
	Connection conn = getConnection(hostId, hostPwd);
	ArrayList<Department> dList = dDao.selectAll(conn);
	close(conn);
	return dList;
}

public String selectDeptName(String deptCode, String hostId, String hostPwd) {
	Connection conn = getConnection(hostId, hostPwd);
	String deptName = dDao.selectDeptName(conn, deptCode);
	
	close(conn);
	return deptName;
}
}
