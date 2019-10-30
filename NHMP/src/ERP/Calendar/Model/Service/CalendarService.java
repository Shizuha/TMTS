package ERP.Calendar.Model.Service;

import java.sql.Connection;
import java.util.ArrayList;

import org.json.simple.JSONObject;

import ERP.Calendar.Model.dao.CalendarDao;
import ERP.Calendar.Model.vo.Calendar;
import static common.JDBCTemplate.*;
import Main.NursingHospital.model.ov.NursingHospital;

public class CalendarService {
	
	CalendarDao cdao = new CalendarDao();

	public void InsertCalendar(JSONObject sendJson, String adminid) {
		Connection conn = getConnection();
		cdao.InsertCalendar(conn, sendJson, adminid);
		commit(conn);
		close(conn);
	}

	public ArrayList<Calendar> listCalendar(NursingHospital loginHospital, JSONObject sendJson, String adminid) {
		String userid = loginHospital.getNH_USERID();
		String userpwd = loginHospital.getNH_USERPWD();
		Connection conn = getConnection(userid, userpwd);
		ArrayList<Calendar> list = cdao.listCalendar(conn, sendJson, adminid);
		close(conn);
		return list;
	}

	public void updateCalendar(JSONObject sendJson) {
		Connection conn = getConnection();
		cdao.updateCalendar(conn, sendJson);
		commit(conn);
		close(conn);
	}

	public void deleteCalendar(JSONObject sendJson) {
		Connection conn = getConnection();
		cdao.deleteCalendar(conn, sendJson);
		commit(conn);
		close(conn);
		
	}

	public ArrayList<Calendar> EmployeelistCalendar(JSONObject sendJson, String empname) {
		Connection conn = getConnection();
		ArrayList<Calendar> list = cdao.EmployeelistCalendar(conn, sendJson, empname);
		close(conn);
		return list;
	}

	public void EmployeeInsertCalendar(JSONObject sendJson, String empname) {
		Connection conn = getConnection();
		cdao.EmployeeInsertCalendar(conn, sendJson, empname);
		commit(conn);
		close(conn);
		
	}

	public ArrayList<Calendar> EmployeeSelectList(String empname) {
		Connection conn = getConnection();
		ArrayList<Calendar> list = cdao.EmployeeSelectList(conn, empname);
		close(conn);
		return list;
	}

	
	

}
