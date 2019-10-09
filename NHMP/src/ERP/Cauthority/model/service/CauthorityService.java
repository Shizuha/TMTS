package ERP.Cauthority.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.Cauthority.model.dao.CauthorityDao;
import ERP.Cauthority.model.vo.Cauthority;

public class CauthorityService {
	private CauthorityDao CADao = new CauthorityDao();

	public ArrayList<Cauthority> selectList() {
		Connection conn = getConnection();
		ArrayList<Cauthority> list = CADao.selectList(conn);
		close(conn);
		return list;
	}

	public CauthorityService UpdateAuthorrity() {
		
		return null;
	}

	public CauthorityService DeleteAuthorrity() {
		// TODO Auto-generated method stub
		return null;
	}

	public CauthorityService InsertAuthorrity() {
		// TODO Auto-generated method stub
		return null;
	}

}
