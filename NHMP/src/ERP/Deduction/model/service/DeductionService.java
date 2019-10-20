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
		ArrayList<Deduction> list = DDao.selectList(conn);
		return list;
	}

	public int insertDeduction(Deduction deduction) {
		Connection conn = getConnection();
		int result = DDao.insertDeduction(conn, deduction);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}



	public String selectFormula(String dcode) {
		Connection conn = getConnection();
		String Formula = DDao.selectFormula(conn, dcode);
		close(conn);
		return Formula;
	}

	public int deleteDeduction(String code) {
		Connection conn = getConnection();
		int result = DDao.deleteDeduction(conn, code);
		close(conn);
		return result;
	}

	

}
