package ERP.patient.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

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
		//환자 등록 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		Patient patient = new Patient();
		
		patient.setPatNum(Integer.parseInt(request.getParameter("pat_num")));
		patient.setPatName(request.getParameter("pat_name"));
		patient.setPatType(request.getParameter("pat_type"));
		patient.setPatEntDate(Date.valueOf(request.getParameter("pat_entdate")));
		patient.setPatGender(request.getParameter("pat_gender"));
		patient.setPatNo(request.getParameter("pat_no"));
		patient.setAddress(request.getParameter("address"));
		patient.setFamily(request.getParameter("family"));
		patient.setEmail(request.getParameter("email"));
		patient.setPatPhone(request.getParameter("pat_phone"));
		patient.setWard(request.getParameter("ward"));
		patient.setPatDoc(request.getParameter("pat_doc"));
		
		
		int result = new PatientService().insertPatient(patient);
		
		if(result > 0) {
			response.sendRedirect("views/ERP/Admin_main.jsp");
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
