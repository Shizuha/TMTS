package Main.Cnotice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Main.Cnotice.model.service.CnoticeService;
import Main.Cnotice.model.vo.Cnotice;

/**
 * Servlet implementation class CnoticeListServlet
 */
@WebServlet("/gongall")
public class CnoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 7006L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CnoticeListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int currentPage = 1;
		
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} 
		
		int limit = 14; // 한 페이지에 출력할 목록 갯수
		CnoticeService notice = new CnoticeService();
		
		int listCount = notice.getListCount(); //테이블의 전체 목록 갯수 조회
		//총 페이지 수 계산
		int maxPage = listCount / limit ;
		if(listCount % limit > 0) {
			maxPage++;
		};
		int startRow = (currentPage * limit) - 13;
		int endRow = currentPage * limit;
		
		//currentPage 가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
		//예, 현재 34페이지이면 31~40이 됨. (페이지그룹의 수를 10개로 한 경우)
		int beginPage = (currentPage / limit) * limit + 1;
		int endPage = beginPage + 13;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		// 전체 공지글 조회 컨트롤러
		ArrayList<Cnotice> list = notice.selectList(startRow, endRow);

		RequestDispatcher view = null;
		
		if (list.size() > 0) {
			view = request.getRequestDispatcher("views/Main/serviceNotice.jsp");
			request.setAttribute("list", list);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("beginPage", beginPage);
			request.setAttribute("endPage", endPage);
		} else {
			view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", "공지사항 목록 조회 실패했습니다.");
		}
			view.forward(request, response);
		
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
