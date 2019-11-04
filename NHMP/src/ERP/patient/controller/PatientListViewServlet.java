package ERP.patient.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ERP.patient.model.service.PatientService;
import ERP.patient.model.vo.Patient;

/**
 * Servlet implementation class PatientListViewServlet
 */
@WebServlet("/patientlistview")
public class PatientListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//환자 전체조회 처리용 컨트롤러
		ArrayList<Patient> list = new PatientService().ListView();
		
		RequestDispatcher view = null;
		if(list.size() > 0) {
			view = request.getRequestDispatcher("views/ERP/patient/PatientListView.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", "환자 전체 조회 실패!");
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
