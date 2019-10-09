package ERP.Deduction.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.Deduction.model.dao.DeductionDao;
import ERP.Deduction.model.vo.Deduction;

public class DeductionService {
	private DeductionDao DDao = new DeductionDao();

	public Deduction updateDeduction() {
		Connection conn = getConnection();
		DDao.updateDeduction();
		return null;
	}

	public ArrayList<Deduction> selectList() {
		Connection conn = getConnection();
		DDao.selectList();
		return null;
	}

	public Deduction insertDeduction() {
		Connection conn = getConnection();
		DDao.insertDeduction();
		return null;
	}

	public Deduction deleteDeduction() {
		Connection conn = getConnection();
		DDao.deleteDeduction();
		return null;
	}

}
