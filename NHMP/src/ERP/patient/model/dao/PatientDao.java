package ERP.patient.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ERP.patient.model.vo.Patient;

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
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query= "insert into patient values(?, ?, ?, sysdate, default, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, patient.getPatNum());
			pstmt.setString(2, patient.getPatName());
			pstmt.setString(3, patient.getPatType());
			pstmt.setString(4, patient.getPatGender());
			pstmt.setString(5, patient.getPatNo());
			pstmt.setString(6, patient.getAddress());
			pstmt.setString(7, patient.getFamily());
			pstmt.setString(8, patient.getEmail());
			pstmt.setString(9, patient.getPatPhone());
			pstmt.setString(10, patient.getWard());
			pstmt.setString(11, patient.getPatDoc());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
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
