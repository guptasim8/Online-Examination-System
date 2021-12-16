<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DATA SAVE</title>
        <link rel="stylesheet" type="text/css" href="css.css">

    </head>
<body bgcolor="pink">
<%
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
    %>
<jsp:include page="index.html"/>
<%
}
else
{
out.println("1 "+t+" added");
%>
<jsp:include page="admin.html"/>
<%
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
%>
<jsp:include page="login.html"/>
<%
}
con.close();
}
%>

