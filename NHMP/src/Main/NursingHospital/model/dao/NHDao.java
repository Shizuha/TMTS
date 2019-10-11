package Main.NursingHospital.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import Main.NursingHospital.model.ov.NursingHospital;

public class NHDao {
	public NHDao() {}

	public NursingHospital loginCheck(Connection conn, String userid, String userpwd) {
		NursingHospital nh = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from NURSING_HOSPITAL where nh_userid = ? and nh_userpwd = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				nh = new NursingHospital();
				
				nh.setNH_ID(rset.getInt("NH_ID"));
				nh.setNH_NAME(rset.getString("NH_NAME"));
				nh.setNH_NO(rset.getString("NH_NO"));
				nh.setNH_ADRESS(rset.getString("NH_ADDRESS"));
				nh.setNH_ITNAL_FOR(rset.getString("NH_ITNAL_FOR"));
				nh.setNH_AD_TEL(rset.getString("NH_AD_TEL"));
				nh.setNH_PHONE(rset.getString("NH_PHONE"));
				nh.setNH_EMAIL(rset.getString("NH_EMAIL"));
				nh.setNH_USERID(rset.getString("NH_USERID"));
				nh.setNH_USERPWD(rset.getString("NH_USERPWD"));
				nh.setNH_ETC(rset.getString("NH_ETC"));
				nh.setNH_IMG(rset.getString("NH_IMG"));
				nh.setGENDER(rset.getString("GENDER"));
				nh.setCOMPANY_NAME(rset.getString("COMPANY_NAME"));
				nh.setCOMPANY_NO(rset.getString("COMPANY_NO"));
				nh.setAUTHORITY_CODE(rset.getString("NH_AUTHORITY_CODE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return nh;
	}

	public int insertHPT(Connection conn, NursingHospital hospital) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO NURSING_HOSPITAL VALUES((select max(NH_ID)+1 from nursing_hospital), ?, DEFAULT, DEFAULT, ?, ?, ?, ?, ?, ?, ?, ?, 'null', 'null', ?, ?, ?,DEFAULT)";
		//이름, 주민번호, 주소, 내/외, 회사 전화번호, 폰, 이메일, 아이디, 패스워드, 성별, 회사명 , 사업자 등록번호 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, hospital.getNH_NAME());			//이름
			pstmt.setString(2, hospital.getNH_NO());			//주민번호
			pstmt.setString(3, hospital.getNH_ADRESS());		//주소
			pstmt.setString(4, hospital.getNH_ITNAL_FOR());		//내/외국인
			pstmt.setString(5, hospital.getNH_AD_TEL());		//회사 전화번호 AD
			pstmt.setString(6, hospital.getNH_PHONE());			//폰
			pstmt.setString(7, hospital.getNH_EMAIL());			//이메일
			pstmt.setString(8, hospital.getNH_USERID());		//아이디
			pstmt.setString(9, hospital.getNH_USERPWD());		//패스워드
			pstmt.setString(10, hospital.getGENDER());			//성별
			pstmt.setString(11, hospital.getCOMPANY_NAME());	//회사명
			pstmt.setString(12, hospital.getCOMPANY_NO());		//사업자 등록번호
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int idCheck(Connection conn, String userid) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from NURSING_HOSPITAL where nh_userid = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	
	
}
