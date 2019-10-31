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

	public Employee loginCheck(String userId, String userPwd,String hostId, String hostPwd) {
		Connection conn = getConnection(hostId, hostPwd);
		Employee emp = eDao.loginCheck(conn, userId, userPwd);
		close(conn);
		return emp;
	}

	public int getListCount(String hostId, String hostPwd) {
		Connection conn = getConnection(hostId, hostPwd);
		int result = eDao.getListCount(conn);
		close(conn);
		
		return result;
	}

	public ArrayList<Employee> selectList(int startRow, int endRow,String hostId, String hostPwd) {
		
		Connection conn = getConnection(hostId, hostPwd);
		ArrayList<Employee> memList = eDao.selectList(conn, startRow, endRow);
		
		close(conn);
		return memList;
	}
	//승민이가 손대쑵니다 죄송합니다 ㅠ
	public ArrayList<Employee> selectAll(NursingHospital loginHospital) {
		String userid = loginHospital.getNH_USERID();
		String userpwd = loginHospital.getNH_USERPWD();
		Connection conn = getConnection(userid, userpwd);
		ArrayList<Employee> empList = eDao.selectAll(conn);
		
		close(conn);
		return empList;
	}
	
	public int updateEmployee(Employee emp) {
		Connection conn = getConnection(emp.getHostId(), emp.getHostPwd());
		int result = eDao.updateEmployee(conn, emp);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		
		return result;
	}

	public int deleteEmployee(String empNo,String hostId, String hostPwd) {
		Connection conn = getConnection(hostId, hostPwd);
		int result = eDao.deleteEmployee(conn, empNo);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		
		return result;
	}

	public Employee selectOne(String empNo,String hostId, String hostPwd) {
		Connection conn = getConnection(hostId, hostPwd);
		Employee emp = eDao.selectOne(conn, empNo);
		close(conn);
		return emp;
	}

	public ArrayList<Employee> selectName(String empName,String hostId, String hostPwd) {
		Connection conn = getConnection(hostId, hostPwd);
		ArrayList<Employee> emp = eDao.selectName(conn, empName);
		close(conn);
		return emp;
	}

	public ArrayList<Employee> selectEMPOne(String empName, String deptName,String hostId, String hostPwd) {
		Connection conn = getConnection(hostId, hostPwd);
		ArrayList<Employee> memList = eDao.selectEMPOne(conn, empName, deptName);
		
		close(conn);
		return memList;
	}

	public int empNewPwdUpdate(String newPwd, String empId,String hostId, String hostPwd) {
		Connection conn = getConnection(hostId, hostPwd);
		int result = eDao.empNewPwdUpdate(conn, newPwd, empId);
		
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int insertEmp(Employee emp) {
		Connection conn = getConnection(emp.getHostId(), emp.getHostPwd());
		int result = eDao.insertEmp(conn, emp);
		
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public Employee selectEmpId(String empId,String hostId, String hostPwd) {
		Connection conn = getConnection(hostId, hostPwd);
		Employee emp = eDao.selectEmpId(conn, empId);
		close(conn);
		return emp;
	}

	public int selectCheckId(String userId,String hostId, String hostPwd) {
		Connection conn = getConnection(hostId, hostPwd);
		int result = eDao.selectCheckId(conn, userId);
		
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public String selectEmpName(String userName,String hostId, String hostPwd) {
		Connection conn = getConnection(hostId, hostPwd);
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

	public ArrayList<Employee> selectEmployeeList(String hostId, String hostPwd) {
		Connection conn = getConnection(hostId, hostPwd);
		ArrayList<Employee> empList = eDao.selectAll(conn);
		
		close(conn);
		return empList;
	}

	public ArrayList<Employee> selectOrganEmpList(String hostId, String hostPwd, String teamName) {
		Connection conn = getConnection(hostId, hostPwd);
		ArrayList<Employee> empList = eDao.selectOrganEmpList(conn, teamName);
		
		close(conn);
		return empList;
	}

	public Employee inSelectEmpName(String empName, String hostId, String hostPwd) {
		Connection conn = getConnection(hostId, hostPwd);
		Employee emp = eDao.inSelectEmpName(conn, empName);
		close(conn);
		return emp;
	}

	public int teamEmpcount(String teamCode, String hostId, String hostPwd) {
		Connection conn = getConnection(hostId, hostPwd);
		int result = eDao.teamEmpcount(conn, teamCode);
		
		close(conn);
		return result;
	}

	
	
	

}