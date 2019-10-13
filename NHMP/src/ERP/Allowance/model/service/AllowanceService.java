package ERP.Allowance.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.Allowance.model.dao.AllowanceDao;
import ERP.Allowance.model.vo.Allowance;
import ERP.Deduction.model.vo.Deduction;

public class AllowanceService {
	private AllowanceDao ADao = new AllowanceDao();
	
	public Allowance updateAllowance() {
		Connection conn = getConnection();
		ADao.updateAllowance();
		return null;
	}

	public ArrayList<Allowance> selectList() {
		Connection conn = getConnection();
		ArrayList<Allowance> list = ADao.selectList(conn);
		return list;
		
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
