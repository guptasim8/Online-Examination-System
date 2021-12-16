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
String u=request.getParameter("userid");
String e=request.getParameter("email");
String n=request.getParameter("num");
String c=request.getParameter("city");
request.setAttribute("email", e);
request.setAttribute("num", n);

Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","root");
String query="select * from SIGNUP where  email=? and num=?";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,e);
ps.setString(2,n);

ResultSet rs=ps.executeQuery();

if(rs.next())
{con.close();
out.println("<b>ENTER NEW ONE:</b>");
%>

<jsp:forward page="ChangePassword.jsp"/>
<%
}
else{con.close();
out.println("<b>NO MATCH FOUND</b>");
%>
<a href="sign_up.html"><u>SIGN UP</u></a>
<a href="login.html"><u>HOME</u></a>
<%}
%>


