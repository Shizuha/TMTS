package ERP.Calendar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.sun.javafx.scene.paint.GradientUtils.Parser;

import ERP.Calendar.Model.Service.CalendarService;
import ERP.Calendar.Model.vo.Calendar;

/**
 * Servlet implementation class CalendarListServlet
 */
@WebServlet("/callist")
public class CalendarListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CalendarListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 캘린더 값 가져오는 서블릿
		try {
			String jsondata = request.getParameter("jsondata");
			System.out.println(jsondata);

			JSONParser parser = new JSONParser();

			Object obj = parser.parse(jsondata);

			JSONObject sendJson = (JSONObject) obj;

			ArrayList<Calendar> list = new CalendarService().listCalendar(sendJson);
			
			System.out.println(list);
			JSONArray jarr = new JSONArray();

			// list를 jarr로 옮기기
			for (Calendar c : list) {
				// b 객체 저장할 json 객체 생성
				JSONObject job = new JSONObject();
				job.put("_id", c.getCalnum());
				job.put("title",c.getTitle());
				// JSON에서 한글 깨짐 막으려면, java.net.URLEncoder.encode() 메소드로 인코딩 처리
				job.put("description", c.getCalendarcontent());
				job.put("start", c.getStartdate());
				job.put("end", c.getEnddate());
				job.put("type", "카테고리1");
				job.put("username", "다현");
				job.put("backgroundColor", "#D25565");
				job.put("textColor", "#ffffff");
				job.put("allDay", "false");
				
				/*"_id": 1,
			    "title": "거래처 미팅",
			    "description": "Lorem ipsum dolor sit incid idunt ut Lorem ipsum sit.",
			    "start": "2019-05-07T09:30",
			    "end": "2019-05-07T15:00",
			    "type": "카테고리1",
			    "username": "다현",
			    "backgroundColor": "#D25565",
			    "textColor": "#ffffff",
			    "allDay": false*/

				jarr.add(job);
			}

			// json 배열을 전송용 json 객체에 저장한다.
			sendJson.put("list", jarr);

			// 요청한 뷰로 응답처리한다.
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write(sendJson.toJSONString());
			out.flush();
			out.close();

			System.out.println(list);
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
