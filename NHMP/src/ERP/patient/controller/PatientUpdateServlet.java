package ERP.patient.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

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
		//환자 수정 처리용 컨트롤러
		boolean isMulti = ServletFileUpload.isMultipartContent(request);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		if(isMulti != true) {
			pw.println("<script >");
			pw.println("alert('정상적인 발송방식이 아닙니다 확인하세요.')");
			pw.println("history.back()");
			pw.println("</script>");
			pw.flush();
			pw.close();
			
		}
		
		Patient patient = new Patient();
		
		patient.setPatNum(Integer.parseInt(request.getParameter("pat_num")));
		patient.setPatName(request.getParameter("pat_name"));
		patient.setPatType(request.getParameter("pat_type"));
		patient.setPatEntDate(Date.valueOf(request.getParameter("pat_entdate")));
		patient.setPatOutDate(Date.valueOf(request.getParameter("pat_outdate")));
		patient.setPatGender(request.getParameter("pat_gender"));
		patient.setPatNo(request.getParameter("pat_no"));
		String address1 = request.getParameter("address1");
		
		if(address1 == null)
			address1 = " ";
		String address2 = request.getParameter("address2");
		
		if(address2 == null)
			address2 = " ";
		String address3 = request.getParameter("address3");
		
		if(address3 == null)
			address3 = " ";
		String address4 = request.getParameter("address4");
		
		if(address4 == null)
			address4 = " ";
		
		patient.setAddress(address1 + address2 + address3 + address4);
		patient.setFamily(request.getParameter("family"));
		patient.setEmail(request.getParameter("email"));
		patient.setPatPhone(request.getParameter("pat_phone"));
		patient.setWard(request.getParameter("ward"));
		patient.setPatDoc(request.getParameter("pat_doc"));
		
		int result = new PatientService().updatePatient(patient);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
