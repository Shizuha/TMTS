package ERP.medicienRecord.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ERP.medicienRecord.model.service.MedicienRecordService;


/**
 * Servlet implementation class MedicienRecordDeleteServlet
 */
@WebServlet("/recorddelete")
public class MedicienRecordDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MedicienRecordDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//투약일지 삭제 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		int mrNo = Integer.parseInt(request.getParameter("mr_no"));
		String renameFileName = request.getParameter("rfile");
		
		int result = new MedicienRecordService().deleteMedicienRecord(mrNo);
		
		if(result > 0) {
			if(renameFileName != null) {
				String savePath = request.getSession().getServletContext().getRealPath("/resources/ERP/mr_upfiles");
				File renameFile = new File(savePath + "\\" + renameFileName);
				renameFile.delete();
			}
			
			response.sendRedirect("/NHMP/views/ERP/Admin_main.jsp");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", mrNo + "번 투약일지 삭제 실패!");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
