package ERP.Employee.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import ERP.Employee.model.vo.Employee;
import ERP.Team.model.service.TeamService;
import Main.NursingHospital.model.ov.NursingHospital;

/**
 * Servlet implementation class EmployeeOrganizationChartListServlet
 */
@WebServlet("/organlist")
public class EmployeeOrganizationChartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeOrganizationChartListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String deptName = request.getParameter("deptName").trim();
		System.out.println(deptName);
		String hostId = null;
		String hostPwd = null;
		Employee emp = (Employee)request.getSession().getAttribute("loginEmployee");
		NursingHospital loginHospital = (NursingHospital)request.getSession().getAttribute("loginHospital");
		if(emp != null) {
		
		hostId = emp.getHostId();
		hostPwd = emp.getHostPwd();
		}else {
			hostId = loginHospital.getNH_USERID();
			hostPwd = loginHospital.getNH_USERPWD();
		}
		
		String[] teamName = new TeamService().selectOrganTeamName(deptName, hostId, hostPwd);
		System.out.println(teamName[0]);
		System.out.println(teamName[2]);
		
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		if(teamName != null) {
			
			for(String t : teamName) {
				JSONObject tn = new JSONObject();
				
				tn.put("teamname",URLEncoder.encode(t, "utf-8"));
				
				jarr.add(tn);
			}
			sendJson.put("list", jarr);
			
			
			response.setContentType("application/json");
			
			PrintWriter out = response.getWriter();
			
			out.print(sendJson.toJSONString());
			out.flush();
			out.close();
			
			
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
