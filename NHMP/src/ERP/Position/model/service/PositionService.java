package ERP.Position.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;
import ERP.Position.model.dao.PositionDao;
import ERP.Position.model.vo.Position;

public class PositionService {
private PositionDao pDao = new PositionDao();
	
	public PositionService() {}

	public String selectPositionName(String posCode) {
		Connection conn = getConnection();
		String posName = pDao.selectPositionName(conn, posCode);
		
		close(conn);
		return posName;
	}

	public ArrayList<Position> selectAll() {
		Connection conn = getConnection();
		ArrayList<Position> pList = pDao.selectAll(conn);
		close(conn);
		return pList;
	}
}
