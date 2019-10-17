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
		// 상담일지 등록 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		RequestDispatcher view = null;
		if(!ServletFileUpload.isMultipartContent(request)) {
			view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", "form 태그에 enctype  속성 사용이 되지 않았습니다. 다시 입력 고고씽");
			view.forward(request, response);
		}
		
		int maxSize = 1024 * 1024 * 50;
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/ERP/cl_upfiles");
		
		MultipartRequest mrequest = new MultipartRequest(request,
						savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		CounselingLog cl = new CounselingLog();
		cl.setClNo(Integer.parseInt(mrequest.getParameter("cl_no")));
		cl.setClName(mrequest.getParameter("cl_name"));
		cl.setClType(mrequest.getParameter("cl_type"));
		cl.setClComment(mrequest.getParameter("cl_comment"));
		cl.setClPatName(mrequest.getParameter("cl_pat_name"));
		cl.setClEmpName(mrequest.getParameter("cl_emp_name"));
		
		String originalFileName = mrequest.getFilesystemName("clupfile");
		
		if(originalFileName != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
			
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
			
			cl.setClOriginalFileName(originalFileName);
			cl.setClRenameFileName(renameFileName);
		}
		
		int result = new CounselingLogService().insertCounselingLog(cl);
		
		if(result > 0) {
			response.sendRedirect("/NHMP/main.jsp");
		}else {
			view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", "새 상담일지 등록 실패!");
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
