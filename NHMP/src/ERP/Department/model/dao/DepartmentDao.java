package ERP.Department.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ERP.Department.model.vo.Department;
import ERP.Ward.model.vo.Ward;

import static common.JDBCTemplate.*;


public class DepartmentDao {
	public String selectDeptName(Connection conn, String deptCode) {
		String deptName = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select dept_name from department where dept_code = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, deptCode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				deptName = rs.getString("dept_name");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return deptName;
	}

	public ArrayList<Department> selectAll(Connection conn) {
		ArrayList<Department> dList = new ArrayList<Department>();
		Department dp = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String query = "select * from department";
		
		try {
			stmt = conn.createStatement();
			
			
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				dp = new Department();
				
				dp.setDeptCode(rs.getString("dept_code"));
				dp.setDeptName(rs.getString("dept_name"));
				
				dList.add(dp);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		
		return dList;
	}
}
