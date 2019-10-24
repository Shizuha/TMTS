package ERP.Position.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static common.JDBCTemplate.close;

public class PositionDao {
	public String selectPositionName(Connection conn, String posCode) {
		String posName = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select pos_name from POSITIONS where pos_code = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, posCode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				posName = rs.getString("pos_name");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return posName;
	}
}
