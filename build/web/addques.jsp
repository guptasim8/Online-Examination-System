<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAVING QUESTION</title>
        <link rel="stylesheet" type="text/css" href="css.css">

    </head>
<body bg="orange">
<%
    try{
String ques=request.getParameter("ques");
String ans1=request.getParameter("ans1");
String ans2=request.getParameter("ans2");
String ans3=request.getParameter("ans3");
String ans4=request.getParameter("ans4");
String ca=request.getParameter("ca");
String tablename=request.getParameter("lang");
out.println(tablename);
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","root");
String q="select count(*) from "+tablename;
out.println(q);
PreparedStatement p=con.prepareStatement(q);
ResultSet rs=p.executeQuery();
int qno=0;
if(rs.next())
qno=rs.getInt(1);
qno++;

String query="insert into "+tablename+" values(?,?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,ques);
ps.setString(2,ans1);
ps.setString(3,ans2);
ps.setString(4,ans3);
ps.setString(5,ans4);
ps.setString(6,ca);
ps.setInt(7,qno);
ps.executeUpdate();
con.close();
%>
<jsp:include page="admin.html"/>
<%
}
catch(Throwable t)
{
out.println("error"+t);
}
%>


