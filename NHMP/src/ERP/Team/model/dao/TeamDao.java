package ERP.Team.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

	public String[] selectOrganTeamName(Connection conn, String deptName) {
		String[] teamName = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select team_name " + 
				"from team " + 
				"where UP_DEPT = ( " + 
				"select dept_code " + 
				"from department " + 
				"where dept_name like ?);";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + deptName + "%");
			
			rs = pstmt.executeQuery();
			teamName = new String[rs.getRow()];
			int i = 0;
			while(rs.next()) {
				
				teamName[i] = rs.getString("team_name");
				i++;
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
