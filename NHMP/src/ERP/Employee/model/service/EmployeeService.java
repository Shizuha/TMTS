package ERP.Employee.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.Employee.model.dao.EmployeeDao;
import ERP.Employee.model.vo.Employee;
public class EmployeeService {
	
	private EmployeeDao eDao = new EmployeeDao();
	
	public EmployeeService() {}

	public Employee loginCheck(String userId, String userPwd) {
		Connection conn = getConnection();
		Employee emp = eDao.loginCheck(conn, userId, userPwd);
		close(conn);
		return emp;
	}

	public int getListCount() {
		Connection conn = getConnection();
		int result = eDao.getListCount(conn);
		close(conn);
		
		return result;
	}

	public ArrayList<Employee> selectList(int startRow, int endRow) {
		
		Connection conn = getConnection();
		ArrayList<Employee> memList = eDao.selectList(conn, startRow, endRow);
		
		close(conn);
		return memList;
	}
	public ArrayList<Employee> selectAll() {
		
		Connection conn = getConnection();
		ArrayList<Employee> memList = eDao.selectAll(conn);
		
		close(conn);
		return memList;
	}
	
	public int updateEmployee(String empNo) {
		Connection conn = getConnection();
		int result = eDao.updateEmployee(conn, empNo);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		
		return result;
	}

	public int deleteEmployee(String empNo) {
		Connection conn = getConnection();
		int result = eDao.deleteEmployee(conn, empNo);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		
		return result;
	}

	public Employee selectOne(String empNo) {
		Connection conn = getConnection();
		Employee emp = eDao.selectOne(conn, empNo);
		close(conn);
		return emp;
	}

	public Employee selectName(String empName) {
		Connection conn = getConnection();
		Employee emp = eDao.selectName(conn, empName);
		close(conn);
		return emp;
	}

	public ArrayList<Employee> selectEMPOne(String empName, String deptName) {
		Connection conn = getConnection();
		ArrayList<Employee> memList = eDao.selectEMPOne(conn, empName, deptName);
		
		close(conn);
		return memList;
	}

	public int empNewPwdUpdate(int empId, String newPwd) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertEmp(Employee emp) {
		Connection conn = getConnection();
		int result = eDao.insertEmp(conn, emp);
		close(conn);
		return result;
	}

	
	public Employee selectIDOne(String empid) {
		Connection conn = getConnection();
		Employee emp = eDao.selectIDOne(conn, empid);
		close(conn);
		return emp;
	}

	
	
	

}

