package ERP.Team.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static common.JDBCTemplate.close;
public class TeamDao {
	public String selectTeamName(Connection conn, String teamCode) {
		String teamName = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select team_name from team where team_code = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, teamCode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				teamName = rs.getString("team_name");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return teamName;
	}
}
