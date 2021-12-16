package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import cetpa.User;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class del_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head><title></title></head>\n");
      out.write("        \n");
      out.write("    <body>\n");

Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection
        ("jdbc:oracle:thin:@localhost:1521:xe","System","root");
String query="select * from SIGNUP";
PreparedStatement ps=con.prepareStatement(query);
ResultSet rs=ps.executeQuery();
ArrayList <User> u=new ArrayList<User>();
while(rs.next())
{
        String  userid=rs.getString("userid");
        String pass=rs.getString("pass");
        String email=rs.getString("email");
        String num=rs.getString("num");
        String city=rs.getString("city");
        String type=rs.getString("type");
        User user=new User(userid,pass,email,num,city,type);
        u.add(user);
}
out.println("<table border=2 align=center>");
 out.println("<br><tr><td>Delete</td><td>USER ID</td><td>PASSWORD</td><td>EMAIL</td><td>MOBILE NUMBER</td><td>TYPE</td><td>CITY</td></tr>");
for(User b:u)
{
 out.println("<br><tr><td><input type=checkbox name=cb value="+b.getEmail()+"></td>");
 out.println("<td>"+b.getUserid()+"</td><td>"+b.getPass()+"</td><td>"+b.getEmail()+"</td><td>"+b.getNum()+"</td><td>"+b.getType()+"</td><td>"+b.getCity()+"</td");   
}
String[] cb=request.getParameterValues("cb");

con.close();



      out.write("<center>\n");
      out.write("        <button type=\"button\" onclick=\"request.setAttribute(\"cb\",cb>DELETE USER</button>\n");
      out.write("    </body></html>\n");
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
