package ERP.Ward.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static common.JDBCTemplate.close;

public class WardDao {
	
	public String selectTeamName(Connection conn, String wardCode) {
		String wardName = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select ward_name from ward where ward_code = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, wardCode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				wardName = rs.getString("ward_name");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return wardName;
	}
}
