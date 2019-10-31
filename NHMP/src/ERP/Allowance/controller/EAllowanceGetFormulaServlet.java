package ERP.Allowance.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ERP.Allowance.model.service.AllowanceService;
import ERP.Employee.model.vo.Employee;

/**
 * Servlet implementation class EAllowanceGetFormulaServlet
 */
@WebServlet("/Egetallow")
public class EAllowanceGetFormulaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EAllowanceGetFormulaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 직원 수당 처리용 컨트롤러
		
		Employee loginEmployee = (Employee)request.getSession().getAttribute("loginEmployee");
		String Acode = request.getParameter("Acode");
		System.out.println(Acode);
		
		String aformula = new AllowanceService().EselectFormula(Acode, loginEmployee);
			
		System.out.println("servlet aformula : "+aformula);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(aformula);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
