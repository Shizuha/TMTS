package ERP.Employee.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ERP.Career.model.service.CareerService;
import ERP.Career.model.vo.Career;
import ERP.Dependents.model.service.DependentsService;
import ERP.Dependents.model.vo.Dependents;
import ERP.Education.model.service.EducationService;
import ERP.Education.model.vo.Education;
import ERP.Employee.model.service.EmployeeService;
import ERP.Employee.model.vo.Employee;
import ERP.Empsalary.model.service.EmpSalaryService;
import ERP.Empsalary.model.vo.EmpSalary;

/**
 * Servlet implementation class EmpMInfoServlet
 */
@WebServlet("/minfo")
public class EmpMInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpMInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String empId = request.getParameter("empid");
		
		Employee emp = new EmployeeService().selectEmpId(empId);
		System.out.println(emp);
		EmpSalary empSal = new EmpSalaryService().selectOne(empId);
		System.out.println(empSal);
		ArrayList<Dependents> dpenList = new DependentsService().selectOne(empId);
		System.out.println(dpenList);
		if(dpenList.size() == 0)
			dpenList = null;
			
		ArrayList<Career> carList = new CareerService().selectList(empId);
		if(carList.size() == 0)
			carList = null;
		
		ArrayList<Education> eduList = new EducationService().selectList(empId);
		if(eduList.size() == 0)
			eduList = null;
		System.out.println(eduList);
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		if(emp != null) {
			RequestDispatcher view = request.getRequestDispatcher("views/ERP/Employee/updateEmployee.jsp");
			request.setAttribute("emp", emp);
			request.setAttribute("empSal", empSal);
			request.setAttribute("dpenList", dpenList);
			request.setAttribute("carList", carList);
			request.setAttribute("eduList", eduList);
			view.forward(request, response);
			
		}else {
			pw.println("<script>");
			pw.println("alert('해당사원정보가 없습니다.')");
			pw.println("location.href='/NHMP/list'");
			pw.println("</script>");
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
