<%@include file="header.html" %>
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
<body bgcolor="orange">
<%
String email= (String) request.getParameter("email");
String num= (String) request.getParameter("num");
String p1=request.getParameter("pass1");
String pass=request.getParameter("pass2");

if(p1.equals(pass)){
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","root");
String query="update SIGNUP set pass=? where ( email=? and num=?)";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,p1);
ps.setString(2,email);
ps.setString(3,num);
int i=ps.executeUpdate();
if(i==1){
    out.println(p1+"/t"+pass+"/t"+email+"/t"+num);
con.close();
out.println("<b>password updated</b>");
%>
<jsp:include page="login.html"/>
<%
}

}
else{

request.setAttribute("email", email);
request.setAttribute("num", num);

%>
<jsp:include page="ChangePassword.jsp"/>
<%

}
%>

<%@include file="footer.html" %>


