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

import ERP.Employee.model.service.EmployeeService;
import ERP.Employee.model.vo.Employee;

/**
 * Servlet implementation class EmployeeSearchServlet
 */
@WebServlet("/esel")
public class EmployeeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int currentPage = 1;
		if (request.getParameter("page") != null) {
			
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		 
		String empName = request.getParameter("empname");
		String deptName = request.getParameter("dept");
		System.out.println(empName + "," + deptName);
		ArrayList<Employee> empList = null;
		
		
		
		Employee emp = null;
		//나이구분 도 같이 날아와서 처리함.
		if(deptName.equals("--부서구분--") == true) {
			empList = new ArrayList<Employee>();
			emp = new EmployeeService().selectName(empName);
			System.out.println(emp);
			empList.add(emp);
		}else {
			
			empList = new EmployeeService().selectEMPOne(empName, deptName);
		}
				
		
			System.out.println(empList);
			 
		
		
		int limit = 10;
		int listCount = empList.size();
		int maxPage = listCount / limit;
		
		if(listCount % limit > 0) {
			maxPage++;
		}
		int beginPage = (currentPage / limit) *limit + 1;
		int endPage = beginPage + 9;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		RequestDispatcher view = null;
		if(empList.size() > 0) {
			
			view = request.getRequestDispatcher("views/Employee/employeeListView.jsp");
			request.setAttribute("empList", empList);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("beginPage", beginPage);
			request.setAttribute("endPage", endPage);
			
			
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			
				pw.println("<script >");
				pw.println("alert('해당 정보가 없습니다.')");
				pw.println("location.href='/lp/list'");
				pw.println("</script>");
				pw.flush();
				pw.close();
				
			
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
