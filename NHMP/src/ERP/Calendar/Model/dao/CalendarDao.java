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
		
		String query = "select cal_num, id_, title, description, " + 
				"to_char(start_date, 'yyyy-mm-dd')||'T'||to_char(start_date, 'HH24:MM') as start_date, " + 
				"to_char(end_date, 'yyyy-mm-dd')||'T'||to_char(end_date, 'HH24:MM') as end_date, " + 
				"cate_gory, backgroundcolor, textcolor from calendar";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			/*pstmt.setString(1, String.valueOf(sendJson.get("_id")));*/
			
			/*System.out.println(String.valueOf(sendJson.get("id")));*/
			rest = pstmt.executeQuery();
			
			while(rest.next()) {
				Calendar cal = new Calendar();
				cal.setCalnum(rest.getInt("cal_num"));
				cal.setTitle(rest.getString("title"));
				cal.setDescription(rest.getString("description"));
				cal.setStartdate(rest.getString("start_date"));
				cal.setEnddate(rest.getString("end_date"));
				cal.setCategory(rest.getString("cate_gory"));
				cal.setBackgroundcolor(rest.getString("backgroundcolor"));
				cal.setTextcolor(rest.getString("textcolor"));
				cal.setUsername(rest.getString("id_"));
				list.add(cal);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return list;
	}

	public void InsertCalendar(Connection conn, JSONObject sendJson) {
		
		PreparedStatement pstmt = null;
		String query = "INSERT INTO CALENDAR VALUES (?, "
				+ "?, ?, ?, to_date(?, 'yyyy-mm-dd hh24:mi'), "
				+ "to_date(?, 'yyyy-mm-dd hh24:mi'), "
				+ "?, ?, DEFAULT)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, String.valueOf(sendJson.get("calnum")));
			pstmt.setString(2, String.valueOf(sendJson.get("_id")));
			pstmt.setString(3, String.valueOf(sendJson.get("title")));
			pstmt.setString(4, String.valueOf(sendJson.get("description")));
			pstmt.setString(5, String.valueOf(sendJson.get("start")));
			pstmt.setString(6, String.valueOf(sendJson.get("end")));
			pstmt.setString(7, String.valueOf(sendJson.get("type")));
			pstmt.setString(8, String.valueOf(sendJson.get("backgroundColor")));
			
			pstmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return;
	}

	public void updateCalendar(Connection conn, JSONObject sendJson) {
		PreparedStatement pstmt = null;
		Calendar cal = new Calendar();
		String query = "update calendar set title = ?, description = ?, "
				+ "start_date = to_date(?, 'yyyy-mm-dd hh24:mi'), "
				+ "end_date = to_date(?, 'yyyy-mm-dd hh24:mi'), "
				+ "cate_gory = ?, backgroundcolor = ? where cal_num = ?";
		System.out.println(Integer.parseInt((String) sendJson.get("_id")));
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, String.valueOf(sendJson.get("title")));
			pstmt.setString(2, String.valueOf(sendJson.get("description")));
			pstmt.setString(3, String.valueOf(sendJson.get("start")));
			pstmt.setString(4, String.valueOf(sendJson.get("end")));
			pstmt.setString(5, String.valueOf(sendJson.get("type")));
			pstmt.setString(6, String.valueOf(sendJson.get("backgroundColor")));
			pstmt.setInt(7, Integer.parseInt((String) sendJson.get("_id")));
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return;
	}

}
