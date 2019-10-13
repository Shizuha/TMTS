package ERP.Allowance.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ERP.Allowance.model.vo.Allowance;
import ERP.Deduction.model.vo.Deduction;

public class AllowanceDao {

	public void updateAllowance() {
		// TODO Auto-generated method stub
		
	}

	public ArrayList<Allowance> selectList(Connection conn) {
		ArrayList<Allowance> list = new ArrayList<Allowance>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from allowance order by allowance_no desc";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Allowance Allow = new Allowance();
				
				Allow.setALLOWANCE_CODE(rset.getString("allowance_code"));
				Allow.setALLOWANCE_NO(rset.getInt("allowance_no"));
				Allow.setALLOWANCE_NAME(rset.getString("allowance_name"));
				Allow.setALLOWANCE_FORMULA(rset.getString("allowance_formula"));
				Allow.setALLOWANCE_ETC(rset.getString("allowance_etc"));
				
				list.add(Allow);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
				
	}

	public void insertAllowance() {
		// TODO Auto-generated method stub
		
	}

	public void deleteAllowance() {
		// TODO Auto-generated method stub
		
	}

}
