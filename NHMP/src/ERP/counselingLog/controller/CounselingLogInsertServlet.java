package ERP.counselingLog.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ERP.counselingLog.model.service.CounselingLogService;
import ERP.counselingLog.model.vo.CounselingLog;

/**
 * Servlet implementation class CounselingLogInsertServlet
 */
@WebServlet("/counselinsert")
public class CounselingLogInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 6001L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CounselingLogInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ������� ��� ó���� ��Ʈ�ѷ�
		request.setCharacterEncoding("utf-8");
		
		RequestDispatcher view = null;
		if(!ServletFileUpload.isMultipartContent(request)) {
			view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", "form �±��� enctype �Ӽ� ��� �ȵ�");
			view.forward(request, response);
		}
		
		int maxSize = 1024 * 1024 * 50;
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/ERP/cl_upfiles");
		
		MultipartRequest mrequest = new MultipartRequest(request,
						savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		CounselingLog counselingLog = new CounselingLog();
		counselingLog.setClNo(Integer.parseInt(mrequest.getParameter("cl_no")));
		counselingLog.setClTitle(mrequest.getParameter("cl_title"));
		counselingLog.setClContents(mrequest.getParameter("cl_contents"));
		counselingLog.setClPhone(mrequest.getParameter("cl_phone"));
		counselingLog.setClComment(mrequest.getParameter("cl_comment"));
		counselingLog.setClPatName(mrequest.getParameter("cl_pat_name"));
		counselingLog.setClEmpName(mrequest.getParameter("cl_emp_name"));
		System.out.println(counselingLog);
		String originalFileName = mrequest.getFilesystemName("cl_upfile");
		System.out.println(originalFileName);
		if(originalFileName != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
					+ "." + originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			
			File originFile = new File(savePath + "\\" + originalFileName);
			File renameFile = new File(savePath +"\\" + renameFileName);
			
			if(!originFile.renameTo(renameFile)) {
				int read = -1;
				byte[] buf = new byte[1024];
				
				FileInputStream fin = new FileInputStream(originFile);
				FileOutputStream fout = new FileOutputStream(renameFile);
				
				while((read = fin.read(buf, 0, buf.length)) != -1) {
					fout.write(buf, 0, read);
				}
				
				fin.close();
				fout.close();
				originFile.delete();
			}
			
			counselingLog.setClOriginalFileName(originalFileName);
			counselingLog.setClRenameFileName(renameFileName);
		}
		
		int result = new CounselingLogService().insertCounselingLog(counselingLog);
		
		if(result > 0) {
			response.sendRedirect("/NHMP/views/ERP/main.jsp");
		}else {
			view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", "������� ��� ����!");
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
