package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Connection;

public final class c_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>C Language</title>\n");
      out.write("    </head>\n");
      out.write("    <body bgcolor=\"pink\">\n");
      out.write("  \n");

Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection
        ("jdbc:oracle:thin:@localhost:1521:xe","System","root");
String query="select * from ques_of_c where QNo="+1;
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(query);
boolean b=rs.next();

if(b)
{
String ques=rs.getString("ques");
String ans1=rs.getString("ans1");
String ans2=rs.getString("ans2");
String ans3=rs.getString("ans3");
String ans4=rs.getString("ans4");
String ca=rs.getString("correct_ans");
con.close();

      out.write("\n");
      out.write("<center>\n");
      out.write("<form action=\"ques2.jsp\" method=\"post\">\n");
      out.write("  \n");
      out.write("Ques1:");
      out.print(ques);
      out.write("<br>  <table>\n");
      out.write("<tr><input type=\"radio\" name=\"r\" id=\"a\" value=\"");
      out.print(ans1);
      out.write("\">A:");
      out.print(ans1);
      out.write("</tr><br>\n");
      out.write("<tr><input type=\"radio\" name=\"r\" id=\"b\" value=\"");
      out.print(ans2);
      out.write("\">B:");
      out.print(ans2);
      out.write("</tr><br>\n");
      out.write("<tr><input type=\"radio\" name=\"r\" id=\"c\" value=\"");
      out.print(ans3);
      out.write("\">C:");
      out.print(ans3);
      out.write("</tr><br>\n");
      out.write("<tr><input type=\"radio\" name=\"r\" id=\"d\" value=\"");
      out.print(ans4);
      out.write("\">D:");
      out.print(ans4);
      out.write("</tr><br>\n");
      out.write("</table>\n");
      out.write("<input type=\"hidden\" name=\"ca\" id=\"d\" value=\"");
      out.print(ca);
      out.write("\"><br>\n");
      out.write("<input type=\"hidden\" name=\"q\" id=\"q\" value=\"");
      out.print(ques);
      out.write("\"><br>\n");
      out.write("<input type=\"hidden\" name=\"c\" id=\"cc\" value=\"0\"><br>\n");
      out.write("<input type=\"hidden\" name=\"i\" id=\"i\" value=\"1\"><br>\n");
      out.write("<input type=\"submit\" value=\"Next\">\n");
      out.write("    </form></center>\n");

}


      out.write("\n");
      out.write("    \n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
