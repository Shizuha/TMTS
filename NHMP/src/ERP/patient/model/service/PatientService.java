package ERP.patient.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.patient.model.dao.PatientDao;
import ERP.patient.model.vo.Patient;

import static common.JDBCTemplate.*;

public class PatientService {
	PatientDao pdao = new PatientDao();
	
	public PatientService() {}
	
	public ArrayList<Patient> selectAll() {
		Connection conn = getConnection();
		ArrayList<Patient> list = pdao.selectAll(conn);
		close(conn);
		return list;
	}
	
	public Patient selectOne(int patNum) {
		Connection conn = getConnection();
		Patient patient = pdao.selectOne(conn, patNum);
		close(conn);
		return patient;
	}
	
	public int insertPatient(Patient patient) {
		Connection conn = getConnection();
		int result = pdao.insertPatient(conn, patient);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		return result;
	}
	
	public int updatePatient(Patient patient) {
		Connection conn = getConnection();
		int result = pdao.updatePatient(conn, patient);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		return result;
	}
	
	
	public int deletePatient(int patNum) {
		Connection conn = getConnection();
		int result = pdao.deletePatient(conn, patNum);
		if(result > 0) 
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		return result;
	}


	
}
