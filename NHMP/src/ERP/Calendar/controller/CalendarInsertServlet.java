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

import ERP.Calendar.Model.Service.CalendarService;
import ERP.Calendar.Model.vo.Calendar;

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
		
		response.setCharacterEncoding("utf-8");
		
		//전송용 json 객체 생성
		JSONObject sendJson = new JSONObject();
		
		//list 옮겨 저장할 json 배열 객체를 생성
		JSONArray jarr = new JSONArray();
		
		//list를 jarr로 옮기기
		for(Calendar c : list) {
			//b 객체 저장할 json 객체 생성
			JSONObject job = new JSONObject();
			job.put("edit-title", URLEncoder.encode(c.getTitle(), "utf-8"));
			//JSON에서 한글 깨짐 막으려면, java.net.URLEncoder.encode() 메소드로 인코딩 처리
			job.put("edit-start", c.getStartdate());
			job.put("edit-end", c.getEnddate());
			job.put("edit-desc", URLEncoder.encode(c.getCalendarcontent(), "utf-8"));
			
			jarr.add(job);
		}
		
		//json 배열을 전송용 json 객체에 저장한다.
		sendJson.put("list", jarr);
		
		//요청한 뷰로 응답처리한다.
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(sendJson.toJSONString());
		out.flush();
		out.close();
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
