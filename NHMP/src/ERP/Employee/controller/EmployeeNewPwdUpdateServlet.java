package ERP.Employee.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ERP.Employee.model.service.EmployeeService;

/**
 * Servlet implementation class EmployeeNewPwdUpdateServlet
 */
@WebServlet("/uppwd")
public class EmployeeNewPwdUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeNewPwdUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newPwd = request.getParameter("newpwd");
		String empId = request.getParameter("empid");
		
		int result = new EmployeeService().empNewPwdUpdate(newPwd, empId);
		
		
		if(result > 0 ) {
			response.sendRedirect("/lp/list");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/Error.jsp");
			
			request.setAttribute("message", "실패!");
			
		
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
