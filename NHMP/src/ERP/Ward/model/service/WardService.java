package ERP.Ward.model.service;

import java.sql.Connection;

import ERP.Ward.model.dao.WardDao;
import static common.JDBCTemplate.*;
public class WardService {
	
	private WardDao wDao = new WardDao();
	
	public WardService () {}
	

	public String selectWardName(String wardCode) {
		Connection conn = getConnection();
		String wardName = wDao.selectTeamName(conn, wardCode);
		
		close(conn);
		return wardName;
	}
}
