package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class dataSave_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>DATA SAVE</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css.css\">\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("<body bgcolor=\"pink\">\n");

    try{
        
String u=request.getParameter("userid");
String p=request.getParameter("pass");
String e=request.getParameter("email");
String n=request.getParameter("num");
String c=request.getParameter("city");
String t=request.getParameter("type");
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","root");
String query="insert into signup values(?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,u);
ps.setString(2,p);
ps.setString(3,e);
ps.setString(4,n);
ps.setString(5,c);
ps.setString(6,t);
ps.executeUpdate();
con.close();
if(t.equals("user"))
{out.println("1 "+t+" added");
    
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "index.html", out, false);
      out.write('\n');

}
else
{
out.println("1 "+t+" added");

      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "admin.html", out, false);
      out.write('\n');

}
}catch(Throwable t)
{
String userid=request.getParameter("userid");
String type=request.getParameter("type");
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","root");
String query="select * from signup where userid=? and type=?";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1, userid);
ps.setString(2, type);
ResultSet rs=ps.executeQuery();

if(rs.next()){
out.println("User with same userid already exists ");
out.println("Kindly log in ");

      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "login.html", out, false);
      out.write('\n');

}
con.close();
}

      out.write('\n');
      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
