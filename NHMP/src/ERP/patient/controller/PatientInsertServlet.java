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
 * Servlet implementation class PatientInsertServlet
 */
@WebServlet("/patientinsert")
public class PatientInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 환자 등록 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		Patient pat = new Patient();
		
		pat.setPatNo(request.getParameter("pat_num"));
		pat.setPatName(request.getParameter("pat_name"));
		pat.setPatType(request.getParameter("pat_type"));
		pat.setPatGender(request.getParameter("pat_gender"));
		pat.setPatNo(request.getParameter("pat_no"));
		pat.setAddress(request.getParameter("address"));
		pat.setFamily(request.getParameter("family"));
		pat.setEmail(request.getParameter("email"));
		pat.setPatPhone(request.getParameter("pat_phone"));
		pat.setWard(request.getParameter("ward"));
		pat.setPatDoc(request.getParameter("pat_doc"));
		
		int result = new PatientService().insertPatient(pat);
		
		if(result > 0) {
			response.sendRedirect("views/ERP/main.jsp");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", "환자 등록 실패!");
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
