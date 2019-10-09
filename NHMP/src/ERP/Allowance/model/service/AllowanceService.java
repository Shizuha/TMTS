package ERP.Allowance.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.Allowance.model.dao.AllowanceDao;
import ERP.Allowance.model.vo.Allowance;

public class AllowanceService {
	private AllowanceDao ADao = new AllowanceDao();
	
	public Allowance updateAllowance() {
		Connection conn = getConnection();
		ADao.updateAllowance();
		return null;
	}

	public ArrayList<Allowance> selectList() {
		ADao.selectList();
		return null;
	}

	public Allowance insertAllowance() {
		ADao.insertAllowance();
		return null;
	}

	public Allowance deleteAllowance() {
		ADao.deleteAllowance();
		return null;
	}

}
