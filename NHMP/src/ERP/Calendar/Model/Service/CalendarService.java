package ERP.Calendar.Model.Service;

import java.sql.Connection;
import java.util.ArrayList;

import org.json.simple.JSONObject;

import ERP.Calendar.Model.dao.CalendarDao;
import ERP.Calendar.Model.vo.Calendar;
import static common.JDBCTemplate.*;

public class CalendarService {
	
	CalendarDao cdao = new CalendarDao();

	public void InsertCalendar(JSONObject sendJson) {
		Connection conn = getConnection();
		cdao.InsertCalendar(conn, sendJson);
		close(conn);
	}

	public ArrayList<Calendar> listCalendar(JSONObject sendJson) {
		Connection conn = getConnection();
		ArrayList<Calendar> list = cdao.listCalendar(conn, sendJson);
		close(conn);
		return list;
	}
	
	

}
