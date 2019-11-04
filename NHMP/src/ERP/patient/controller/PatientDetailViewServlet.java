package ERP.patient.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ERP.patient.model.service.PatientService;
import ERP.patient.model.vo.Patient;

/**
 * Servlet implementation class PatientDetailViewServlet
 */
@WebServlet("/patientdetail")
public class PatientDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//환자 상세조회 처리용 컨트롤러
		int patNum = Integer.parseInt(request.getParameter("pat_num"));
		Patient patient = new PatientService().DetailView(patNum);
		
		RequestDispatcher view = null;
		if(patient != null) {
			view = request.getRequestDispatcher("views/ERP/patient/PatientDetailView.jsp");
			request.setAttribute("patient", patient);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", patNum + "번 환자 상세조회 실패!");
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
