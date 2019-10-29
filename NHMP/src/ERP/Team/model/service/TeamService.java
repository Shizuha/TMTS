package ERP.Team.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.Team.model.dao.TeamDao;
import ERP.Team.model.vo.Team;
import static common.JDBCTemplate.*;

public class TeamService {

	
	private TeamDao tDao = new TeamDao();

	public ArrayList<Team> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public String selectTeamName(String teamCode, String hostId, String hostPwd) {
		Connection conn = getConnection(hostId, hostPwd);
		String deptName = tDao.selectTeamName(conn, teamCode);
		
		close(conn);
		return deptName;
	}

	public String[] selectOrganTeamName(String deptName, String hostId, String hostPwd) {
		Connection conn = getConnection(hostId, hostPwd);
		String[] teamName = tDao.selectOrganTeamName(conn, deptName);
		
		close(conn);
		return teamName;
	}
}
