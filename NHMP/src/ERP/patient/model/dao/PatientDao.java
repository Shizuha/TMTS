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
				Patient patient = new Patient();
				
				patient.setPatNum(rset.getInt("pat_num"));
				patient.setPatName(rset.getString("pat_name"));
				patient.setPatType(rset.getString("pat_type"));
				patient.setPatEntDate(rset.getDate("pat_entdate"));
				patient.setPatOutDate(rset.getDate("pat_outdate"));
				patient.setPatGender(rset.getString("pat_gender"));
				patient.setPatNo(rset.getString("pat_no"));
				patient.setAddress(rset.getString("address"));
				patient.setFamily(rset.getString("family"));
				patient.setEmail(rset.getString("email"));
				patient.setPatPhone(rset.getString("pat_phone"));
				patient.setWard(rset.getString("ward"));
				patient.setPatDoc(rset.getString("pat_doc"));
				
				list.add(patient);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public Patient selectOne(Connection conn, String patName) {
		Patient patient = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from patient where patname = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, patName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				patient = new Patient();
				
				patient.setPatNum(rset.getInt("pat_num"));
				patient.setPatName(patName);
				patient.setPatType(rset.getString("pat_type"));
				patient.setPatEntDate(rset.getDate("pat_ent_date"));
				patient.setPatOutDate(rset.getDate("pat_out_date"));
				patient.setPatGender(rset.getString("pat_gender"));
				patient.setPatNo(rset.getString("pat_no"));
				patient.setAddress(rset.getString("address"));
				patient.setFamily(rset.getString("family"));
				patient.setEmail(rset.getString("email"));
				patient.setPatPhone(rset.getString("pat_phone"));
				patient.setWard(rset.getString("ward"));
				patient.setPatDoc(rset.getString("pat_doc"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return patient;
	}


	public int insertPatient(Connection conn, Patient patient) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into patient values (pat_seq.nextval, ?, ?, "
				+ "sysdate, default, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, patient.getPatName());
			pstmt.setString(2, patient.getPatType());
			pstmt.setString(3, patient.getPatGender());
			pstmt.setString(4, patient.getPatNo());
			pstmt.setString(5, patient.getAddress());
			pstmt.setString(6, patient.getFamily());
			pstmt.setString(7, patient.getEmail());
			pstmt.setString(8, patient.getPatPhone());
			pstmt.setString(9, patient.getWard());
			pstmt.setString(10, patient.getPatDoc());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updatePatient(Connection conn, Patient patient) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update patient set pat_num = pat_seq.nextval, pat_name = ?, "
				+ "address = ?, family = ?, "
				+ "email = ?, pat_phone = ? "
				+ "where pat_name = ?";
				
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, patient.getPatName());
			pstmt.setString(2, patient.getAddress());
			pstmt.setString(3, patient.getFamily());
			pstmt.setString(4, patient.getEmail());
			pstmt.setString(5, patient.getPatPhone());
			
			result = pstmt.executeUpdate();
			
			System.out.println("dao result : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
}
