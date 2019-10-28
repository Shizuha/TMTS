/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.43
 * Generated at: 2019-10-23 04:48:58 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.ERP.counselingLog;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ERP.counselingLog.model.vo.CounselingLog;

public final class CounselingLogEnroll_jsp extends org.apache.jasper.runtime.HttpJspBase
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

	CounselingLog cl = (CounselingLog) request.getAttribute("cl");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>CounselingLog</title>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function movelist(){\r\n");
      out.write("\tlocation.href = \"/NHMP/counselone\";\r\n");
      out.write("\treturn false;\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<!-- 상담일지 등록 페이지 -->\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<h1 align=\"center\">환자 상담일지 등록 페이지</h1>\r\n");
      out.write("\t<table align=\"center\" width=\"600\" border=\"1\" cellspacing=\"0\"\r\n");
      out.write("\t\tcellpadding=\"5\">\r\n");
      out.write("\t\t<form action=\"/NHMP/counselinsert\" method=\"post\" enctype=\"multipart/form-data\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>상담일지번호</th><td><input type=\"number\" name=\"cl_no\"></td>\r\n");
      out.write("\t\t\t\t<th>제목</th><td><input type=\"text\" name=\"cl_title\"></td>\r\n");
      out.write("\t\t\t\t<th>날짜</th><td><input type=\"date\" name=\"cl_date\"></td>\r\n");
      out.write("\t\t\t\t<th>내용</th>\r\n");
      out.write("\t\t\t\t<td><input type=\"text\" name=\"cl_name\" value=\"");
      out.print( cl.getClName() );
      out.write("\"></td>\r\n");
      out.write("\t\t\t\t<th>연락처</th><td><input type=\"tel\" name=\"cl_phone\"></td>\r\n");
      out.write("\t\t\t\t<th>비고</th><td><input type=\"text\" name=\"cl_comment\"></td>\r\n");
      out.write("\t\t\t\t<th>환자명</th>\r\n");
      out.write("\t\t\t\t<td><input type=\"text\" name=\"cl_pat_name\"\r\n");
      out.write("\t\t\t\t\tvalue=\"");
      out.print(cl.getClPatName());
      out.write("\"></td>\r\n");
      out.write("\t\t\t\t<th>상담자</th><td><input type=\"text\" name=\"cl_emp_name\"></td>\r\n");
      out.write("\t\t\t\t<th>첨부파일</th><td><input type=\"file\" name=\"cl_upfiles\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th colspan=\"10\">\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<input type=\"submit\" value=\"등록하기\">\r\n");
      out.write("\t\t\t\t\t&nbsp; <input type=\"reset\" value=\"등록취소\"> &nbsp; \r\n");
      out.write("\t\t\t\t<input type=\"button\" value=\"조회하기\" onclick=\"return movelist();\"><a\r\n");
      out.write("\t\t\t\t\thref=\"javascript:history.go(-1);\">이전 페이지로 이동</a></th>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("</form>\r\n");
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
