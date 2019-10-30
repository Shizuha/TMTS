package ERP.counselingLog.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ERP.counselingLog.model.service.CounselingLogService;
import ERP.counselingLog.model.vo.CounselingLog;

/**
 * Servlet implementation class CounselingLogDetailViewServlet
 */
@WebServlet("/counseldetail")
public class CounselingLogDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CounselingLogDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ���� �� ������� ���������ȣ�� ���� ����ȸ ó���� ��Ʈ�ѷ�
		
		int clNo = Integer.parseInt(request.getParameter("cl_no"));
		CounselingLog counselingLog = new CounselingLogService().DetailView(clNo);
				
		RequestDispatcher view = null;
		if(counselingLog != null) {
			view = request.getRequestDispatcher("views/ERP/counselingLog/CounselingLogDetailView.jsp");
			request.setAttribute("counselingLog", counselingLog);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", clNo + "���� ȯ������ �󼼺��� ����!");
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
