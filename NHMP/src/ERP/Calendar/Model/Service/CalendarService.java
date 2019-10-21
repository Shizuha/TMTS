package ERP.Calendar.Model.Service;

import java.sql.Connection;
import java.util.ArrayList;

import org.json.simple.JSONObject;

import ERP.Calendar.Model.dao.CalendarDao;
import ERP.Calendar.Model.vo.Calendar;
import static common.JDBCTemplate.*;

public class CalendarService {
	
	CalendarDao cdao = new CalendarDao();

	public void InsertCalendar(JSONObject sendJson, String adminid) {
		Connection conn = getConnection();
		cdao.InsertCalendar(conn, sendJson, adminid);
		commit(conn);
		close(conn);
	}

	public ArrayList<Calendar> listCalendar(JSONObject sendJson, String adminid) {
		Connection conn = getConnection();
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
	
	

}
