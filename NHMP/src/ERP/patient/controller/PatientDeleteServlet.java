package ERP.patient.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ERP.patient.model.service.PatientService;

/**
 * Servlet implementation class PatientDeleteServlet
 */
@WebServlet("/patientdelete")
public class PatientDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ȯ�� ���� ����
		
		//1. �ѱ� ������ ���ڵ�ó��
		request.setCharacterEncoding("utf-8");
		
		//2.
		int patNum = Integer.parseInt("patNum");
		String renameFileName = request.getParameter("rfile");
		
		//3.
		
		//���� ���� �ȵ�
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
