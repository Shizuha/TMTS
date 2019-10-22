package ERP.notice.controller;

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

import ERP.notice.model.service.NoticeService;
import ERP.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeTopServlet
 */
@WebServlet("/ntop")
public class NoticeTopServlet extends HttpServlet {
	private static final long serialVersionUID = 7006L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeTopServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 게시글 조회수 많은 순 상위 3개 조회 처리용 컨트롤러 : ajax 요청 처리
		ArrayList<Notice> list = new NoticeService().selectTop3();

		// 전송용 json 객체 생성
		JSONObject sendJson = new JSONObject();

		// list 옮겨 저장할 json 배열 객체를 생성
		JSONArray jarr = new JSONArray();

		// list를 jarr로 옮기기
		for (Notice n : list) {
			// b 객체 저장할 json 객체 생성
			JSONObject job = new JSONObject();
			job.put("no", n.getNoticeNo());
			// JSON에서 한글 깨짐 막으려면, java.net.URLEncoder.encode() 메소드로 인코딩 처리
			job.put("title", URLEncoder.encode(n.getNoticeTitle(), "UTF-8"));
			job.put("date", String.valueOf(n.getNoticeDate()));

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
