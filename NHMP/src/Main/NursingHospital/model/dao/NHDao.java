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
		return result;
	}
	
	
	
}
