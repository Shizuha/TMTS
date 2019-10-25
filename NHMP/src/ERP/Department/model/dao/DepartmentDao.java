package ERP.Department.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
}
