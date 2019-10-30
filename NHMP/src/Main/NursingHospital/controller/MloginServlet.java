package Main.NursingHospital.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ERP.Employee.model.service.EmployeeService;
import ERP.Employee.model.vo.Employee;
import Main.NursingHospital.model.ov.NursingHospital;
import Main.NursingHospital.model.service.NHService;

/**
 * Servlet implementation class MloginServlet
 */
@WebServlet("/login")
public class MloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MloginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//메인 로그인 처리용 서블릿
		request.setCharacterEncoding("UTF-8");
		String Cname = request.getParameter("Cname");
		String userid = "";
		String userpwd = "";
		NursingHospital loginHospital = null;
		Employee loginEmployee = null;
		if(!Cname.equals("관리자")) {//직원
			String hostid = request.getParameter("hostid");
			String hostpwd = request.getParameter("hostpwd");
			userid = request.getParameter("userid");
			userpwd = request.getParameter("userpwd");
			loginEmployee = new EmployeeService().loginCheck(userid, userpwd, hostid, hostpwd);
			if( loginEmployee != null ) {
				HttpSession session = request.getSession();
				session.setAttribute("loginHospital", loginEmployee);
				response.sendRedirect("/NHMP/views/ERP/Employee.jsp");
					
			}else{
				RequestDispatcher view = request.getRequestDispatcher("views/common/Error.jsp");
				request.setAttribute("message", "로그인 실패!!");
				view.forward(request, response);
			}
			
		}else {//관리자
			userid = request.getParameter("userid");
			userpwd = request.getParameter("userpwd");
			loginHospital = new NHService().loginCheck(userid, userpwd);
			
			if( loginHospital != null ) {
				HttpSession session = request.getSession();
				session.setAttribute("loginHospital", loginHospital);
				response.sendRedirect("/NHMP/views/Main/login.jsp");
					
			}else{
				RequestDispatcher view = request.getRequestDispatcher("views/common/Error.jsp");
				request.setAttribute("message", "로그인 실패!!");
				view.forward(request, response);
			}
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
