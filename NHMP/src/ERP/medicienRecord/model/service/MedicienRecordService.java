package ERP.medicienRecord.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.Employee.model.vo.Employee;
import ERP.medicienRecord.model.dao.MedicienRecordDao;
import ERP.medicienRecord.model.vo.MedicienRecord;

import static common.JDBCTemplate.*;

public class MedicienRecordService {
	private MedicienRecordDao mrdao = new MedicienRecordDao();
	
	public ArrayList<MedicienRecord> ListView(Employee emp) {
		Connection conn = getConnection(emp.getHostId(), emp.getHostPwd());
		ArrayList<MedicienRecord> list = mrdao.ListView(conn);
		close(conn);
		return list;
	}
	
	public MedicienRecord DetailView(Employee emp, int mrNo) {
		Connection conn = getConnection(emp.getHostId(), emp.getHostPwd());
		MedicienRecord medicienRecord = mrdao.DetailView(conn, mrNo);
		close(conn);
		return medicienRecord;
	}
	
	public int insertMedicienRecord(Employee emp, MedicienRecord medicienRecord) {
		Connection conn = getConnection(emp.getHostId(), emp.getHostPwd());
		int result = mrdao.insertMedicienRecord(conn, medicienRecord);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int updateMedicienRecord(Employee emp, MedicienRecord medicienRecord) {
		Connection conn = getConnection(emp.getHostId(), emp.getHostPwd());
		int result = mrdao.updateMedicienRecord(conn, medicienRecord);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteMedicienRecord(Employee emp, int mrNo) {
		Connection conn = getConnection(emp.getHostId(), emp.getHostPwd());
		int result = mrdao.deleteMedicienRecord(conn, mrNo);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public ArrayList<MedicienRecord> selectMrPatNameSearch(Employee emp, String mrPatName) {
		Connection conn = getConnection(emp.getHostId(), emp.getHostPwd());
		ArrayList<MedicienRecord> list = mrdao.selectMrPatNameSearch(conn, mrPatName);
		close(conn);
		return list;
	}
	
	public ArrayList<MedicienRecord> selectMrEmpNameSearch(Employee emp, String mrEmpName) {
		Connection conn = getConnection(emp.getHostId(), emp.getHostPwd());
		ArrayList<MedicienRecord> list = mrdao.selectMrEmpNameSearch(conn, mrEmpName);
		close(conn);
		return list;
	}
}
