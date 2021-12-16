
<%@page import="cetpa.User1"%>
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
String tablename=request.getParameter("lang");
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection
        ("jdbc:oracle:thin:@localhost:1521:xe","System","root");
String query="select * from "+tablename;
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
        String ca=rs.getString("correct_ans");
        String qno=rs.getString("qno");
        User1 user=new User1(ques,ans1,ans2,ans3,ans4,ca,qno);
        u.add(user);
}
con.close();
out.println("<form method=post action=deleteques.jsp><table border=2 align=center>");
 out.println("<br><tr><td>Delete</td><td>Question</td><td>A</td><td>B</td><td>C</td><td>D</td><td>Correct Answer</td></tr>");
for(User1 b:u)
{
 out.println("<br><tr><td><input type=checkbox name=cb value="+b.getQno()+"></td>");
 out.println("<td>"+b.getQues()+"</td><td>"+b.getAns1()+"</td><td>"+b.getAns2()+"</td><td>"+b.getAns3()+"</td><td>"+b.getAns4()+"</td><td>"+b.getCa()+"</td></tr>");   
}
%><center>
<tr colspan=2><input type=hidden name=lang value=<%=tablename%>>
<tr colspan=2><input type=submit name=submit value=Delete></table></form>



        
