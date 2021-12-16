package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import cetpa.User1;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class update_jsp extends org.apache.jasper.runtime.HttpJspBase
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

Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection
        ("jdbc:oracle:thin:@localhost:1521:xe","System","root");
String query="select * from ques_of_c";
PreparedStatement ps=con.prepareStatement(query);
ResultSet rs=ps.executeQuery();
ArrayList <User1> u=new ArrayList<User1>();
while(rs.next())
{
        String  ques=rs.getString("ques");
        String ans1=rs.getString("ans1");
        String ans2=rs.getString("ans2");
        String ans3=rs.getString("ans3");
        String ans4=rs.getString("ans4");
        String ca=rs.getString("ca");
        String qno=rs.getString("qno");
        User1 user1=new User1(ques ,ans1,ans2,ans3,ans4,ca,qno);
        u.add(user1);
}

out.println("<table border=2 align=center>");
 out.println("<br><tr><td>Q.No.</td><td>QUES</td><td>A</td><td>B</td><td>C</td><td>D</td><td>CORRECT ANSWER</td></tr>");
for(User1 b:u)
{
 out.println("<br><tr><td>"+b.getQno()+"</td><td>"+b.getQues()+"</td><td>"+b.getAns1()+"</td><td>"+b.getAns2()+"</td><td>"+b.getAns3()+"</td><td>"+b.getAns4()+"</td><td>"+b.getCa()+"</td></tr>");   
}
out.println("</table>");
out.println("Update Ques Number:<input type=text name=update>");
con.close();


      out.write("<center>\n");
      out.write("<button name=\"del\" value=\"UPDATE\" onclick=\"location.href='updateq.jsp'\"></button>\n");
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
