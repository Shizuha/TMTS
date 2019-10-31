package ERP.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ERP.notice.model.service.NoticeService;
import ERP.notice.model.vo.Notice;
import Main.NursingHospital.model.ov.NursingHospital;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/nlist.ad")
public class NoticeAdminListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAdminListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지사항 전체 목록보기 출력 처리용 컨트롤러 모델서비스로 요청받고 처리(패이징 처리)
		
				//nursinghospital 의 로그인정보 받아오기
				NursingHospital loginHospital = (NursingHospital)request.getSession().getAttribute("loginHospital");
			
				int currentPage = 1;
				if(request.getParameter("page") != null) {
					currentPage = Integer.parseInt(request.getParameter("page"));
				}
				
				int limit = 10;  //한 페이지에 출력할 목록 갯수
				NoticeService nservice = new NoticeService();
				
				int listCount = nservice.getListCount(loginHospital);  //테이블의 전체 목록 갯수 조회
				//총 페이지 수 계산
				int maxPage = listCount / limit;
				if(listCount % limit > 0)
					maxPage++;
				
				//currentPage 가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
				//예, 현재 34페이지이면 31 ~ 40 이 됨. (페이지그룹의 수를 10개로 한 경우)
				int beginPage = (currentPage / limit) * limit + 1;
				int endPage = beginPage + 9;
				if(endPage > maxPage)
					endPage = maxPage;
				
				//currentPage 에 출력할 목록의 조회할 행 번호 계산
				int startRow = (currentPage * limit) - 9;
				int endRow = currentPage * limit;
				
				//조회할 목록의 시작행과 끝행 번호 서비스로 전달하고 결과받기
				ArrayList<Notice> list = nservice.selectList(startRow, endRow, loginHospital);
				
				RequestDispatcher view = null;
				if(list.size() >= 0) {
					view = request.getRequestDispatcher("views/ERP/Notice/ErpAdminNoticeListView.jsp");
					request.setAttribute("list", list);
					request.setAttribute("maxPage", maxPage);
					request.setAttribute("currentPage", currentPage);
					request.setAttribute("beginPage", beginPage);
					request.setAttribute("endPage", endPage);
					request.setAttribute("loginHospital", loginHospital);
					
				}else {
					view = request.getRequestDispatcher("views/common/Error.jsp");
					request.setAttribute("message", currentPage + "공지사항 관리자화면 전체 목록 조회 실패!");
					
				} 
				view.forward(request, response);
				
			}

			/**
			 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
			 */
			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// TODO Auto-generated method stub
				doGet(request, response);
			}

		}


