package ERP.Calendar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.oracle.jrockit.jfr.RequestableEvent;

import ERP.Calendar.Model.Service.CalendarService;
import ERP.Calendar.Model.vo.Calendar;
import Main.NursingHospital.model.ov.NursingHospital;

/**
 * Servlet implementation class CalendarInsertServlet
 */
@WebServlet("/calin")
public class CalendarInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 7001L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CalendarInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 캘린더 등록 서블릿
		try {
			
		NursingHospital nh = (NursingHospital) request.getSession().getAttribute("loginHospital");
		
		String jsoncal = request.getParameter("jsondata");
		
		System.out.println("전송온 값 : " + jsoncal);

		response.setCharacterEncoding("utf-8");

		JSONParser parser = new JSONParser();

		Object obj = parser.parse(jsoncal);

		JSONObject sendJson = (JSONObject) obj;
		sendJson.put("_id", String.valueOf(nh.getNH_USERID()));
		CalendarService calendarService = new CalendarService();
		calendarService.InsertCalendar(sendJson);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
