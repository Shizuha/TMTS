package ERP.counselingLog.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ERP.counselingLog.model.service.CounselingLogService;
import ERP.counselingLog.model.vo.CounselingLog;

/**
 * Servlet implementation class CounselingLogSerachServlet
 */
@WebServlet("/counselsearch")
public class CounselingLogSerachServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CounselingLogSerachServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//������� �˻� ó���� ��Ʈ�ѷ�
		request.setCharacterEncoding("utf-8");
		
		String search = request.getParameter("search");
		
		ArrayList<CounselingLog> list = null;
		CounselingLogService cservice = new CounselingLogService();
		
		switch(search) {
		case "cl_title" : String clTitle = request.getParameter("cl_title");
						list = cservice.selectTitleSearch(clTitle);
						break;
		case "cl_emp_name" : String clEmpName = request.getParameter("cl_emp_name");
										list = cservice.selectClEmpNameSearch(clEmpName);
										break;
		}
		
		RequestDispatcher view = null;
		if(list.size() > 0) {
			view = request.getRequestDispatcher("views/ERP/counselingLog/CounselingLogListView.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", search + "�˻� ��ȸ ����!");
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
