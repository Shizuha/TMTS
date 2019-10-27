package ERP.Deduction.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.Deduction.model.dao.DeductionDao;
import ERP.Deduction.model.vo.Deduction;
import Main.NursingHospital.model.ov.NursingHospital;

public class DeductionService {
	private DeductionDao DDao = new DeductionDao();

	public Deduction updateDeduction() {
		Connection conn = getConnection();
		DDao.updateDeduction();
		return null;
	}

	public ArrayList<Deduction> selectList(NursingHospital loginHospital) {
		String userid = loginHospital.getNH_USERID();
		String userpwd = loginHospital.getNH_USERPWD();
		Connection conn = getConnection(userid, userpwd);
		ArrayList<Deduction> list = DDao.selectList(conn);
		return list;
	}

	public int insertDeduction(Deduction deduction, NursingHospital loginHospital) {
		String userid = loginHospital.getNH_USERID();
		String userpwd = loginHospital.getNH_USERPWD();
		Connection conn = getConnection(userid, userpwd);
		int result = DDao.insertDeduction(conn, deduction);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}



	public String selectFormula(String dcode, NursingHospital loginHospital) {
		String userid = loginHospital.getNH_USERID();
		String userpwd = loginHospital.getNH_USERPWD();
		Connection conn = getConnection(userid, userpwd);
		String Formula = DDao.selectFormula(conn, dcode);
		close(conn);
		return Formula;
	}

	public int deleteDeduction(String code, NursingHospital loginHospital) {
		String userid = loginHospital.getNH_USERID();
		String userpwd = loginHospital.getNH_USERPWD();
		Connection conn = getConnection(userid,userpwd);
		int result = DDao.deleteDeduction(conn, code);
		close(conn);
		return result;
	}

	

}
