package ERP.Employee.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ERP.Employee.model.vo.Employee;




public class EmployeeDao {
	
	public Employee loginCheck(Connection conn, String userId, String userPwd) {
		Employee emp= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "select * from employee where userid =? and userpwd = ?";

		try {

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				emp = new Employee();

				emp.setEmpId(rs.getString("emp_id"));
				emp.setEmpName(rs.getString("emp_name"));
				emp.setHireDate(rs.getDate("hire_date"));
				emp.setRsnDate(rs.getDate("rsn_date"));
				emp.setEmpNo(rs.getString("emp_no"));
				emp.setAddress(rs.getString("address"));
				emp.setItnalFor(rs.getString("itnal_for"));
				emp.setAdTel(rs.getString("ad_tel"));
				emp.setPhone(rs.getString("phone"));
				emp.setEmail(rs.getString("email"));
				emp.setUserId(rs.getString("userid"));
				emp.setUserpwd(rs.getString("userpwd"));
				emp.setEmpEtc(rs.getString("emp_etc"));
				emp.setEmpImgOriginalFilename(rs.getString("emp_img_original_filename"));
				emp.setEmpRenameFilename(rs.getString("emp_img_rename_filename"));
				emp.setGender(rs.getString("gender"));
				emp.setEmpmentCode(rs.getString("empment_code"));
				emp.setDeptCode(rs.getString("dept_code"));
				emp.setTeamCode(rs.getString("team_code"));
				emp.setPosCode(rs.getString("pos_code"));
				emp.setDeductionCode(rs.getString("deduction_code"));
				emp.setAllowanceCode(rs.getString("allowance_code"));
				emp.setAuthorityCode(rs.getString("authority_code"));
				emp.setWardCode(rs.getString("ward_code"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return emp;
	}

	public Employee selectOne(Connection conn, String empNo) {
		Employee emp = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "select * from employee where emp_no = ?";

		try {

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, empNo);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				emp = new Employee();
				
				emp.setEmpId(rs.getString("emp_id"));
				emp.setEmpName(rs.getString("emp_name"));
				emp.setHireDate(rs.getDate("hire_date"));
				emp.setRsnDate(rs.getDate("rsn_date"));
				emp.setEmpNo(rs.getString("emp_no"));
				emp.setAddress(rs.getString("address"));
				emp.setItnalFor(rs.getString("itnal_for"));
				emp.setAdTel(rs.getString("ad_tel"));
				emp.setPhone(rs.getString("phone"));
				emp.setEmail(rs.getString("email"));
				emp.setUserId(rs.getString("userid"));
				emp.setUserpwd(rs.getString("userpwd"));
				emp.setEmpEtc(rs.getString("emp_etc"));
				emp.setEmpImgOriginalFilename(rs.getString("emp_img_original_filename"));
				emp.setEmpRenameFilename(rs.getString("emp_img_rename_filename"));
				emp.setGender(rs.getString("gender"));
				emp.setEmpmentCode(rs.getString("empment_code"));
				emp.setDeptCode(rs.getString("dept_code"));
				emp.setTeamCode(rs.getString("team_code"));
				emp.setPosCode(rs.getString("pos_code"));
				emp.setDeductionCode(rs.getString("deduction_code"));
				emp.setAllowanceCode(rs.getString("allowance_code"));
				emp.setAuthorityCode(rs.getString("authority_code"));
				emp.setWardCode(rs.getString("ward_code"));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return emp;
	}

	public ArrayList<Employee> selectAll(Connection conn) {
		ArrayList<Employee> memList = new ArrayList<Employee>();

		Employee emp = null;
		Statement pstmt = null;
		ResultSet rs = null;

		String query = "select * from employee ";

		try {

			pstmt = conn.createStatement();

			rs = pstmt.executeQuery(query);

			while (rs.next()) {

				emp = new Employee();

				emp.setEmpId(rs.getString("emp_id"));
				emp.setEmpName(rs.getString("emp_name"));
				emp.setHireDate(rs.getDate("hire_date"));
				emp.setRsnDate(rs.getDate("rsn_date"));
				emp.setEmpNo(rs.getString("emp_no"));
				emp.setAddress(rs.getString("address"));
				emp.setItnalFor(rs.getString("itnal_for"));
				emp.setAdTel(rs.getString("ad_tel"));
				emp.setPhone(rs.getString("phone"));
				emp.setEmail(rs.getString("email"));
				emp.setUserId(rs.getString("userid"));
				emp.setUserpwd(rs.getString("userpwd"));
				emp.setEmpEtc(rs.getString("emp_etc"));
				emp.setEmpImgOriginalFilename(rs.getString("emp_img_original_filename"));
				emp.setEmpRenameFilename(rs.getString("emp_img_rename_filename"));
				emp.setGender(rs.getString("gender"));
				emp.setEmpmentCode(rs.getString("empment_code"));
				emp.setDeptCode(rs.getString("dept_code"));
				emp.setTeamCode(rs.getString("team_code"));
				emp.setPosCode(rs.getString("pos_code"));
				emp.setDeductionCode(rs.getString("deduction_code"));
				emp.setAllowanceCode(rs.getString("allowance_code"));
				emp.setAuthorityCode(rs.getString("authority_code"));
				emp.setWardCode(rs.getString("ward_code"));
				System.out.println(emp);
				memList.add(emp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return memList;
	}

	

	

	public int deleteEmployee(Connection conn, String empNo) {
		int result = 0;

		PreparedStatement pstmt = null;
		String query = "delete from employee where emp_no =?";

		try {

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, empNo);
			

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close(pstmt);

		}

		return result;
	}

	public int getListCount(Connection conn) {
		int result = 0;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select count(*) from employee ";
		try {
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		
		
		return result;
	}

	public ArrayList<Employee> selectList(Connection conn, int startRow, int endRow) {
		ArrayList<Employee> empList = new ArrayList<Employee>();
		Employee emp = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT * " + 
				"FROM (SELECT ROWNUM rnum, emp_id, hire_date, phone, email, emp_name, address, emp_no" +  
				" FROM (SELECT * FROM employee " + 
				" ORDER BY emp_id desc, hire_date asc nulls first, phone asc, email asc nulls first))" + 
				" WHERE rnum >= ? and rnum <= ? ";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {

				emp = new Employee();
				emp.setEmpId(rs.getString("emp_id"));
				emp.setHireDate(rs.getDate("hire_date"));
				emp.setEmpName(rs.getString("emp_name"));
				emp.setPhone(rs.getString("phone"));
				emp.setEmail(rs.getString("email"));
				emp.setAddress(rs.getString("address"));
				emp.setEmpNo(rs.getString("emp_no"));
				empList.add(emp);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return empList;
	}

	public ArrayList<Employee> selectEMPOne(Connection conn, String empName, String deptName) {
		ArrayList<Employee> empList = new ArrayList<Employee>();
		Employee emp = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT * " + 
				"FROM EMPLOYEE " + 
				"WHERE EMP_NAME LIKE ? " + 
				"AND DEPT_CODE like ? ";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + empName + "%");
			pstmt.setString(2, "%" + deptName + "%");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {

				emp = new Employee();
				
				emp.setEmpId(rs.getString("emp_id"));
				emp.setEmpName(rs.getString("emp_name"));
				emp.setHireDate(rs.getDate("hire_date"));
				emp.setRsnDate(rs.getDate("rsn_date"));
				emp.setEmpNo(rs.getString("emp_no"));
				emp.setAddress(rs.getString("address"));
				emp.setItnalFor(rs.getString("itnal_for"));
				emp.setAdTel(rs.getString("ad_tel"));
				emp.setPhone(rs.getString("phone"));
				emp.setEmail(rs.getString("email"));
				emp.setUserId(rs.getString("userid"));
				emp.setUserpwd(rs.getString("userpwd"));
				emp.setEmpEtc(rs.getString("emp_etc"));
				emp.setEmpImgOriginalFilename(rs.getString("emp_img_original_filename"));
				emp.setEmpRenameFilename(rs.getString("emp_img_rename_filename"));
				emp.setGender(rs.getString("gender"));
				emp.setEmpmentCode(rs.getString("empment_code"));
				emp.setDeptCode(rs.getString("dept_code"));
				emp.setTeamCode(rs.getString("team_code"));
				emp.setPosCode(rs.getString("pos_code"));
				emp.setDeductionCode(rs.getString("deduction_code"));
				emp.setAllowanceCode(rs.getString("allowance_code"));
				emp.setAuthorityCode(rs.getString("authority_code"));
				emp.setWardCode(rs.getString("ward_code"));
				
				empList.add(emp);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return empList;
	}

	public Employee selectName(Connection conn, String empName) {
		Employee emp = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "select * from employee where emp_name = ?";

		try {

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, empName);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				emp = new Employee();

				emp.setEmpId(rs.getString("emp_id"));
				emp.setEmpName(rs.getString("emp_name"));
				emp.setHireDate(rs.getDate("hire_date"));
				emp.setRsnDate(rs.getDate("rsn_date"));
				emp.setEmpNo(rs.getString("emp_no"));
				emp.setAddress(rs.getString("address"));
				emp.setItnalFor(rs.getString("itnal_for"));
				emp.setAdTel(rs.getString("ad_tel"));
				emp.setPhone(rs.getString("phone"));
				emp.setEmail(rs.getString("email"));
				emp.setUserId(rs.getString("userid"));
				emp.setUserpwd(rs.getString("userpwd"));
				emp.setEmpEtc(rs.getString("emp_etc"));
				emp.setEmpImgOriginalFilename(rs.getString("emp_img_original_filename"));
				emp.setEmpRenameFilename(rs.getString("emp_img_rename_filename"));
				emp.setGender(rs.getString("gender"));
				emp.setEmpmentCode(rs.getString("empment_code"));
				emp.setDeptCode(rs.getString("dept_code"));
				emp.setTeamCode(rs.getString("team_code"));
				emp.setPosCode(rs.getString("pos_code"));
				emp.setDeductionCode(rs.getString("deduction_code"));
				emp.setAllowanceCode(rs.getString("allowance_code"));
				emp.setAuthorityCode(rs.getString("authority_code"));
				emp.setWardCode(rs.getString("ward_code"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return emp;
	}

	public int updateEmployee(Connection conn, String empNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertEmp(Connection conn, Employee emp) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "insert into employee values("
				+ "seq_emp_id.nextval,?,sysdate, null, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
				+ "?, ?, ?, ?, ?, ?, ?, ?, default, default, ?, ?, ?)";
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, emp.getEmpName());
			pstmt.setString(2, emp.getEmpNo());
			pstmt.setString(3, emp.getAddress());
			pstmt.setString(4, emp.getItnalFor());
			pstmt.setString(5, emp.getAdTel());
			pstmt.setString(6, emp.getPhone());
			pstmt.setString(7, emp.getEmail());
			pstmt.setInt(8, emp.getSalary());
			pstmt.setString(9, emp.getUserId());
			pstmt.setString(10, emp.getUserpwd());
			pstmt.setString(11, emp.getEmpEtc());
			pstmt.setString(12, emp.getEmpImgOriginalFilename());
			pstmt.setString(13, emp.getEmpRenameFilename());
			pstmt.setString(14, emp.getGender());
			pstmt.setString(15, emp.getEmpmentCode());
			pstmt.setString(16, emp.getDeptCode());
			pstmt.setString(17, emp.getTeamCode());
			pstmt.setString(18, emp.getPosCode());
			pstmt.setString(19, emp.getAuthorityCode());
			pstmt.setString(20, emp.getWardCode());
			pstmt.setString(21, emp.getHoldOffice());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Employee selectIDOne(Connection conn, String empid) {
		Employee emp = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "select * from employee where emp_id = ?";

		try {

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, empid);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				emp = new Employee();
				
				emp.setEmpId(rs.getString("emp_id"));
				emp.setEmpName(rs.getString("emp_name"));
				emp.setHireDate(rs.getDate("hire_date"));
				emp.setRsnDate(rs.getDate("rsn_date"));
				emp.setEmpNo(rs.getString("emp_no"));
				emp.setAddress(rs.getString("address"));
				emp.setItnalFor(rs.getString("itnal_for"));
				emp.setAdTel(rs.getString("ad_tel"));
				emp.setPhone(rs.getString("phone"));
				emp.setEmail(rs.getString("email"));
				emp.setSalary(rs.getInt("salary"));
				emp.setUserId(rs.getString("userid"));
				emp.setUserpwd(rs.getString("userpwd"));
				emp.setEmpEtc(rs.getString("emp_etc"));
				emp.setEmpImgOriginalFilename(rs.getString("emp_img_original_filename"));
				emp.setEmpRenameFilename(rs.getString("emp_img_rename_filename"));
				emp.setGender(rs.getString("gender"));
				emp.setEmpmentCode(rs.getString("empment_code"));
				emp.setDeptCode(rs.getString("dept_code"));
				emp.setTeamCode(rs.getString("team_code"));
				emp.setPosCode(rs.getString("pos_code"));
				emp.setDeductionCode(rs.getString("deduction_code"));
				emp.setAllowanceCode(rs.getString("allowance_code"));
				emp.setAuthorityCode(rs.getString("authority_code"));
				emp.setWardCode(rs.getString("ward_code"));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return emp;
	}

	

}

