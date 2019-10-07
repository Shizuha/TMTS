package Main.NursingHospital.model.service;

import java.sql.Connection;

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
	
	
}
