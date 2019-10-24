package ERP.Career.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import ERP.Career.model.dao.CareerDao;
import ERP.Career.model.vo.Career;
import static common.JDBCTemplate.*;

public class CareerService {
	
private CareerDao cDao = new CareerDao();
	
	public CareerService() {}

	public int inserCar(Career c) {
		Connection conn = getConnection();
		int result = cDao.insertCar(conn, c);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		
		return result;
	}

	public ArrayList<Career> selectList(String empId) {
		Connection conn = getConnection();
		ArrayList<Career> carList = cDao.selectList(conn, empId);
		close(conn);
		return carList;
	}

	public int updateCar(Career c) {
		Connection conn = getConnection();
		int result = cDao.updateCar(conn, c);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		
		return result;
	}

	public String[] selectCarCode(String empId, int length) {
		Connection conn = getConnection();
		String[] carCode = cDao.selectCarCode(empId, length, conn);
		close(conn);
		return carCode;
	}
}
