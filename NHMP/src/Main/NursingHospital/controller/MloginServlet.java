package Main.NursingHospital.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//메인 로그인 처리용 서블릿
		String userid = request.getParameter("userid");
		String userpwd = request.getParameter("userpwd");
		
		System.out.println("userid : " + userid);
		System.out.println("userpwd : " + userpwd);
				
		NursingHospital loginHospital = new NHService().loginCheck(userid, userpwd);
		
		if(loginHospital != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginHospital", loginHospital);
			response.sendRedirect("/NHMP/views/Main/login.jsp");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", "로그인 실패!!");
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
