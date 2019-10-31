package ERP.notice.controller;

import java.io.IOException;

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
 * Servlet implementation class NoticeDatailServlet
 */
@WebServlet("/ndetail")
public class NoticeDatailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDatailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지글 상세보기 처리용 컨트롤러
				String noticeNo = (String)request.getParameter("no");
				
				//코드 & 코드 해석
				NursingHospital loginHospital = (NursingHospital)request.getSession().getAttribute("loginHospital");
				//널싱하스피럴     로그인하스피럴로 지정  = 널싱하스피럴로 형변환후 리퀘스트로요청 세션에 저장하여 getAttribute에서로그인호스팅값 구함
				
				//1증가된 조회수 셀렉트
				NoticeService noticeservice = new NoticeService();
				noticeservice.updateReadCount(noticeNo,loginHospital); //조회수 1 증가 처리함
				
				
				
				Notice notice = new NoticeService().selectOne(noticeNo, loginHospital);
				
				RequestDispatcher view = null;
				if (notice != null) {
					view = request.getRequestDispatcher("views/ERP/Notice/ErpNoticeDetailView.jsp");
					request.setAttribute("notice", notice);
					request.setAttribute("noticeno", noticeNo);
					
					
				}else {
					view = request.getRequestDispatcher("views/common/Error.jsp");
					request.setAttribute("message", noticeNo + "번 공지 상세보기 실패!");
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
