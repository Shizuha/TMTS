package ERP.Calendar.Model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONObject;

import ERP.Calendar.Model.vo.Calendar;
import static common.JDBCTemplate.close;

public class CalendarDao {

	public ArrayList<Calendar> listCalendar(Connection conn, JSONObject sendJson) {
		ArrayList<Calendar> list = new ArrayList<Calendar>();
		
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		
		String query = "select cal_num, emp_id, title, " + 
				"to_char(start_date, 'yyyy-mm-dd')||'T'||to_char(start_date, 'HH24:MM') as start_date, " + 
				"to_char(end_date, 'yyyy-mm-dd')||'T'||to_char(end_date, 'HH24:MM') as end_date, " + 
				"calendar_content from calendar";
		
		try {
			pstmt = conn.prepareStatement(query);
			/*pstmt.setString(1, String.valueOf(sendJson.get("start")));
			pstmt.setString(2, String.valueOf(sendJson.get("start")));
			pstmt.setString(3, String.valueOf(sendJson.get("end")));
			pstmt.setString(4, String.valueOf(sendJson.get("end")));*/
			
			rest = pstmt.executeQuery();
			
			while(rest.next()) {
				Calendar cal = new Calendar();
				cal.setCalnum(rest.getInt("cal_num"));
				cal.setEmpid(rest.getString("emp_id"));
				cal.setTitle(rest.getString("title"));
				cal.setStartdate(rest.getString("start_date"));
				cal.setEnddate(rest.getString("end_date"));
				cal.setCalendarcontent(rest.getString("calendar_content"));
				System.out.println(cal);
				list.add(cal);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return list;
	}

}
