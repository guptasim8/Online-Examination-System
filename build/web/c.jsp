<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>C Language</title>
         <link rel="stylesheet" type="text/css" href="css.css">
    </head>
    <body bgcolor="pink">
  
<%
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
%>
<center>
<form action="ques2.jsp" method="post">
  <table class="t">
      <tr><th colspan=2>Ques1:<%=ques%></th></tr><br> 
    <tr><td><input type="radio" name="r" id="a" value="<%=ans1%>"></td><td align="left">A:<%=ans1%></td></tr><br>
    <tr><td><input type="radio" name="r" id="b" value="<%=ans2%>"></td><td align="left">B:<%=ans2%></td></tr><br>
    <tr><td><input type="radio" name="r" id="c" value="<%=ans3%>"></td><td align="left">C:<%=ans3%></td></tr><br>
    <tr><td><input type="radio" name="r" id="d" value="<%=ans4%>"></td><td align="left">D:<%=ans4%></td></tr><br>
</table><input type="hidden" name="lang" id="lang" value="ques_of_c"><br>
<input type="hidden" name="ca" id="d" value="<%=ca%>"><br>
<input type="hidden" name="q" id="q" value="<%=ques%>"><br>
<input type="hidden" name="c" id="cc" value="0"><br>
<input type="hidden" name="i" id="i" value="1"><br>
<input type="submit" value="Next">
    </form></center>
<%
}

%>
    
    </body>
</html>
