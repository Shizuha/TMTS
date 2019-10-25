package ERP.Employee.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.Employee.model.dao.EmployeeDao;
import ERP.Employee.model.vo.Employee;
import Main.NursingHospital.model.ov.NursingHospital;
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
	//승민이가 손대쑵니다 죄송합니다 ㅠ
	public ArrayList<Employee> selectAll(NursingHospital loginHospital) {
		String userid = loginHospital.getNH_USERID();
		String userpwd = loginHospital.getNH_USERPWD();
		Connection conn = getConnection(userid, userpwd);
		ArrayList<Employee> memList = eDao.selectAll(conn);
		
		close(conn);
		return memList;
	}
	
	public int updateEmployee(Employee emp) {
		Connection conn = getConnection();
		int result = eDao.updateEmployee(conn, emp);
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

	public int empNewPwdUpdate(String newPwd, String empId) {
		Connection conn = getConnection();
		int result = eDao.empNewPwdUpdate(conn, newPwd, empId);
		
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int insertEmp(Employee emp) {
		Connection conn = getConnection();
		int result = eDao.insertEmp(conn, emp);
		
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public Employee selectEmpId(String empId) {
		Connection conn = getConnection();
		Employee emp = eDao.selectEmpId(conn, empId);
		close(conn);
		return emp;
	}

	public int selectCheckId(String userId) {
		Connection conn = getConnection();
		int result = eDao.selectCheckId(conn, userId);
		
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public String selectEmpName(String userName) {
		Connection conn = getConnection();
		String empName = eDao.selectEmpName(conn, userName);
		close(conn);
		return empName;
	}

	public Employee selectIDOne(String empid, NursingHospital loginHospital) {
		String userid = loginHospital.getNH_USERID();
		String userpwd = loginHospital.getNH_USERPWD();
		Connection conn = getConnection(userid, userpwd);
		Employee emp = eDao.selectEmpId(conn, empid);
		close(conn);
		return emp;
	}

	
	
	

}

