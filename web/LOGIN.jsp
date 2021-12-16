<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String u=request.getParameter("userid");
String p=request.getParameter("pass");
String t=request.getParameter("type");
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection
        ("jdbc:oracle:thin:@localhost:1521:xe","System","root");
String query="select * from SIGNUP where userid=? and (pass=? and type=?)";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,u);
ps.setString(2,p);
ps.setString(3,t);
ResultSet rs=ps.executeQuery();
boolean b=rs.next();
con.close();


if(b)
{
    session=request.getSession();
    session.setAttribute("userid",u);
if(t.equals("user")){
%>
<jsp:include page="index.html"/>
<%}
else if(t.equals("admin")){
%>
<jsp:include page="admin.html"/>
<%
}
}
else
{
out.println("<b><center>Invalid Username or Password<center></b>");
%>
<jsp:include page="login.html"/>
<%
    }
%>
