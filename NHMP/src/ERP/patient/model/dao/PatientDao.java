package ERP.patient.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ERP.patient.model.vo.Patient;

import static common.JDBCTemplate.*;

public class PatientDao {
	public PatientDao() {}

	public ArrayList<Patient> selectAll(Connection conn) {
		ArrayList<Patient> list = new ArrayList<Patient>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from patient";
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Patient pat = new Patient();
				
				pat.setPatNum(rset.getInt("patNum"));
				pat.setPatName(rset.getString("patName"));
				pat.setPatType(rset.getString("patType"));
				pat.setPatEntDate(rset.getDate("patEntDate"));
				pat.setPatOutDate(rset.getDate("patOutDate"));
				pat.setPatGender(rset.getString("patGender"));
				pat.setPatNo(rset.getString("patNo"));
				pat.setAddress(rset.getString("address"));
				pat.setFamily(rset.getString("family"));
				pat.setEmail(rset.getString("email"));
				pat.setPatPhone(rset.getString("patPhone"));
				pat.setWard(rset.getString("ward"));
				pat.setPatDoc(rset.getString("patDoc"));
				
				list.add(pat);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public Patient selectOne(Connection conn, int patNum) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int insertPatient(Connection conn, Patient patient) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int updatePatient(Connection conn, Patient patient) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deletePatient(Connection conn, int patNum) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
