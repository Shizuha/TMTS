/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.43
 * Generated at: 2019-10-27 14:07:09 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.ERP.counselingLog;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ERP.counselingLog.model.vo.CounselingLog;
import java.util.ArrayList;

public final class CounselingLogListView_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("ERP.counselingLog.model.vo.CounselingLog");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");

	ArrayList<CounselingLog> list = (ArrayList<CounselingLog>)request.getAttribute("list");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>TMTS</title>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function movelist(){\r\n");
      out.write("\tlocation.href = \"/NHMP/counseldetail\";\r\n");
      out.write("\treturn false;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function movemain(){\r\n");
      out.write("\tlocation.href= \"/NHMP/views/ERP/main.jsp\";\r\n");
      out.write("\treturn false;\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<h2 align=\"center\">상담일지 전체 목록 : ");
      out.print( list.size() );
      out.write(" 개</h2>\r\n");
      out.write("<table align=\"center\" border=\"1\" cellspacing=\"1\" cellpadding=\"5\">\r\n");
      out.write("<tr>\r\n");
      out.write("\t<th>상담일지번호</th>\r\n");
      out.write("\t<th>제목</th>\r\n");
      out.write("\t<th>날짜</th>\r\n");
      out.write("\t<th>내용</th>\r\n");
      out.write("\t<th>연락처</th>\r\n");
      out.write("\t<th>비고</th>\r\n");
      out.write("\t<th>환자명</th>\r\n");
      out.write("\t<th>상담자</th>\r\n");
      out.write("\t<th>첨부파일</th>\r\n");
      out.write("</tr>\r\n");
 for(int i = 0; i < list.size(); i++){
	CounselingLog cl = list.get(i);

      out.write("\r\n");
      out.write("<tr>\r\n");
      out.write("\t<td align=\"center\"><a href=\"/NHMP/counseldetail?cl_no=");
      out.print( cl.getClNo() );
      out.write('"');
      out.write('>');
      out.print( cl.getClNo() );
      out.write("</a></td>\r\n");
      out.write("\t<td>");
      out.print( cl.getClTitle() );
      out.write("</td>\r\n");
      out.write("\t<td>");
      out.print( cl.getClDate() );
      out.write("</td>\r\n");
      out.write("\t<td>");
      out.print( cl.getClContents() );
      out.write("</td>\r\n");
      out.write("\t<td>");
      out.print( cl.getClPhone() );
      out.write("</td>\r\n");
      out.write("\t<td>");
      out.print( cl.getClComment() );
      out.write("</td>\r\n");
      out.write("\t<td>");
      out.print( cl.getClPatName() );
      out.write("</td>\r\n");
      out.write("\t<td>");
      out.print( cl.getClEmpName() );
      out.write("</td>\r\n");
      out.write("\t<td>");
      out.print( cl.getClOriginalFileName() );
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
 } 
      out.write(" \r\n");
      out.write("<tr>\r\n");
      out.write("<th colspan=\"30\">\r\n");
      out.write("<input type=\"submit\" value=\"목록\" onclick=\"return movemain();\"> &nbsp; &nbsp;\r\n");
      out.write("<input type=\"reset\" value=\"취소\"> &nbsp; &nbsp;\r\n");
      out.write("<a href=\"javascript:history.go(-1);\">이전페이지로 이동</a>\r\n");
      out.write("</th>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}