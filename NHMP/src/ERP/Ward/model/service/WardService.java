package ERP.Ward.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.Ward.model.dao.WardDao;
import ERP.Ward.model.vo.Ward;

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


	public ArrayList<Ward> selectAll() {
		Connection conn = getConnection();
		ArrayList<Ward> wList = wDao.selectAll(conn);
		close(conn);
		
		return wList;
	}
}
