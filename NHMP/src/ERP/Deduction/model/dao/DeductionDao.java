package ERP.Deduction.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ERP.Deduction.model.vo.Deduction;

public class DeductionDao {

	public void updateDeduction() {
		// TODO Auto-generated method stub
		
	}

	public ArrayList<Deduction> selectList(Connection conn) {
		ArrayList<Deduction> list = new ArrayList<Deduction>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from deduction order by deduction_no desc";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Deduction DDuc = new Deduction();
				
				DDuc.setDEDUCTION_CODE(rset.getString("deduction_code"));
				DDuc.setDEDUCTION_NO(rset.getInt("deduction_no"));
				DDuc.setDEDUCTION_NAME(rset.getString("deduction_name"));
				DDuc.setDEDUCTION_FORMULA(rset.getString("deduction_formula"));
				DDuc.setDEDUCTION_ETC(rset.getString("deduction_etc"));
				
				list.add(DDuc);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
		
	}

	public void insertDeduction() {
		// TODO Auto-generated method stub
		
	}

	public void deleteDeduction() {
		// TODO Auto-generated method stub
		
	}

}
