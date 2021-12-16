<%@page import="cetpa.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<html>
    <head><title></title></head>
        
    <body bgcolor="pink">
<%
    String tname=request.getParameter("tname");
    String[] cb=request.getParameterValues("cb");
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection
        ("jdbc:oracle:thin:@localhost:1521:xe","System","root");
String[] c=(String[])request.getParameterValues("cb");
if(c!=null)
{

for(int i=0;i<c.length;i++)
{
String q="delete from signup where email=?";
PreparedStatement p=con.prepareStatement(q);
p.setString(1, c[i]);
p.executeUpdate();
}
}

con.close();
out.println("no of users deleted:"+cb.length);

%><center>
<jsp:include page="admin.html"/>
   