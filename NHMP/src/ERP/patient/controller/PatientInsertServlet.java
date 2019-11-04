package ERP.patient.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		//1. 한글 있으면 인코딩 처리
		request.setCharacterEncoding("utf-8");
		
		//2. 전송온 값 꺼내서 변수에 담기
		Patient pat = new Patient();
		
		pat.setPatNo(request.getParameter("pat_num"));
		pat.setPatName(request.getParameter("pat_name"));
		pat.setPatType(request.getParameter("pat_type"));
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
