package ERP.Deduction.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ERP.Deduction.model.service.DeductionService;
import ERP.Deduction.model.vo.Deduction;

/**
 * Servlet implementation class DeductionInFservlet
 */
@WebServlet("/insertF")
public class DeductionInFservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeductionInFservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공제 수식 등록 처리용 컨트롤러
		String Bnum = request.getParameter("Bnum");
		System.out.println(Bnum);
		ArrayList<Deduction> list = new DeductionService().selectList();
		RequestDispatcher view = null;
		if(list.size() > 0) {
			view = request.getRequestDispatcher("views/ERP/Deduction/insertFormula.jsp");
			request.setAttribute("list", list);
			request.setAttribute("Bnum", Bnum);
		}else {
			view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", "로딩 실패 다시 시도해 주세요");
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
