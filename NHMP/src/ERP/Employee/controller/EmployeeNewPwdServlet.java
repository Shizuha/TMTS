package ERP.Employee.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ERP.Department.model.service.DepartmentService;
import ERP.Employee.model.service.EmployeeService;
import ERP.Employee.model.vo.Employee;
import ERP.Position.model.service.PositionService;

/**
 * Servlet implementation class EmployeeNewPwdServlet
 */
@WebServlet("/newpwd")
public class EmployeeNewPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeNewPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String empNo = request.getParameter("empno");
		
		System.out.println("아이디:" + empNo);
		
		Employee emp = new EmployeeService().selectOne(empNo);
		System.out.println(emp);
		
		String deptName = new DepartmentService().selectDeptName(emp.getDeptCode());
		String posName = new PositionService().selectPositionName(emp.getPosCode());
		
		RequestDispatcher view = null;
		
		if(emp != null && deptName != null && posName != null) {
			view = request.getRequestDispatcher("views/ERP/Employee/newPwd.jsp");
			request.setAttribute("emp", emp);
			request.setAttribute("deptName", deptName);
			request.setAttribute("posName", posName);
			
			
		}else {
			 view = request.getRequestDispatcher("views/common/error.jsp");
			
			request.setAttribute("message", "실패!");
			
		}
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
