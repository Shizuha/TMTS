package ERP.patient.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ERP.patient.model.service.PatientService;
import ERP.patient.model.vo.Patient;

/**
 * Servlet implementation class PatientUpdateServlet
 */
@WebServlet("/patientupdate")
public class PatientUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//환자 정보 수정페이지로 이동 처리하는 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		Patient patient = new Patient();
		
		String patName = request.getParameter("pat_name");
		patient.setPatName(patName);
		patient.setPatNum(Integer.parseInt(request.getParameter("pat_num")));
		patient.setAddress(request.getParameter("address"));
		patient.setFamily(request.getParameter("family"));
		patient.setEmail(request.getParameter("email"));
		patient.setPatPhone(request.getParameter("pat_phone"));
		
		PatientService pservice = new PatientService();
		int result = pservice.updatePatient(patient);
		
		RequestDispatcher view = null;
		if(result > 0) {
			HttpSession session = request.getSession(false);
			
			Patient loginPatient = pservice.selectOne(patName);
			session.setAttribute("loginPatient", loginPatient);
			response.sendRedirect("/NHMP/views/ERP/patient/PatientUpdateView.jsp");
		}else {
			request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", patName + "님의 환자 정보 수정 실패!");
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
