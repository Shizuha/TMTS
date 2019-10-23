package Main.NursingHospital.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import Main.NursingHospital.model.dao.NHDao;
import Main.NursingHospital.model.ov.NursingHospital;

import static common.JDBCTemplate.*;

public class NHService {
	private NHDao ndao = new NHDao();
	
	public NHService() {}

	public NursingHospital loginCheck(String userid, String userpwd) {
		Connection conn = getConnection();
		NursingHospital nh = ndao.loginCheck(conn, userid, userpwd);
		close(conn);
		return nh;
	}

	public int insertHPT(NursingHospital hospital) {
		int result = 0;
		Connection conn = getConnection();
		result = ndao.insertHPT(conn, hospital);
		
		if(result > 0) {
			commit(conn);			
		}else {
			rollback(conn);			
		}
		return result;
	}

	public int idCheck(String userid) {
		Connection conn = getConnection();
		int result = ndao.idCheck(conn, userid);
		close(conn);
		return result;
	}

	public int serviceUpdate(String service, NursingHospital loginHospital) {
		Connection conn = getConnection();
		int result = ndao.serviceUpdate(conn, service, loginHospital);
		close(conn);
		return result;
	}

	public ArrayList<NursingHospital> selectList() {
		Connection conn = getConnection();
		ArrayList<NursingHospital> list = ndao.selectList(conn);
		return list;
	}

	public int UpdateAuthority(String nHch, String authch) {
		Connection conn = getConnection();
		int result = ndao.UpdateAuthority(conn, nHch, authch);
		close(conn);
		return result;
	}
	
	
}
