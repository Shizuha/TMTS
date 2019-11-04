package ERP.medicienRecord.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.medicienRecord.model.dao.MedicienRecordDao;
import ERP.medicienRecord.model.vo.MedicienRecord;

import static common.JDBCTemplate.*;

public class MedicienRecordService {
	private MedicienRecordDao mrdao = new MedicienRecordDao();
	
	public ArrayList<MedicienRecord> ListView() {
		Connection conn = getConnection();
		ArrayList<MedicienRecord> list = mrdao.ListView(conn);
		close(conn);
		return list;
	}
	
	public MedicienRecord DetailView(int mrNo) {
		Connection conn = getConnection();
		MedicienRecord medicienRecord = mrdao.DetailView(conn, mrNo);
		close(conn);
		return medicienRecord;
	}
	
	public int insertMedicienRecord(MedicienRecord medicienRecord) {
		Connection conn = getConnection();
		int result = mrdao.insertMedicienRecord(conn, medicienRecord);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int updateMedicienRecord(MedicienRecord medicienRecord) {
		Connection conn = getConnection();
		int result = mrdao.updateMedicienRecord(conn, medicienRecord);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteMedicienRecord(int mrNo) {
		Connection conn = getConnection();
		int result = mrdao.deleteMedicienRecord(conn, mrNo);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public ArrayList<MedicienRecord> selectMrPatNameSearch(String mrPatName) {
		Connection conn = getConnection();
		ArrayList<MedicienRecord> list = mrdao.selectMrPatNameSearch(conn, mrPatName);
		close(conn);
		return list;
	}
	
	public ArrayList<MedicienRecord> selectMrEmpNameSearch(String mrEmpName) {
		Connection conn = getConnection();
		ArrayList<MedicienRecord> list = mrdao.selectMrEmpNameSearch(conn, mrEmpName);
		close(conn);
		return list;
	}
}
