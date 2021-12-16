<%@page import="cetpa.User1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("oracle.jdbc.OracleDriver");
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
        String ca=rs.getString("correct_ans");
        String qno=rs.getString("qno");
        User1 user1=new User1(ques ,ans1,ans2,ans3,ans4,ca,qno);
        u.add(user1);
}
con.close();
out.print("<body bgcolor=pink>"
        + "<a href=admin.html>Home</a>"
        + "<table border=2 align=center>"
        + "<tr><td>Q.No.</td><td>QUES</td>"
        + "<td>A</td><td>B</td><td>C</td>"
        + "<td>D</td><td>CORRECT ANSWER</td></tr>");
for(User1 b:u)
{
 out.print("<br><tr><td>"+b.getQno()+"</td>"
         + "<td>"+b.getQues()+"</td>"
         + "<td>"+b.getAns1()+"</td>"
         + "<td>"+b.getAns2()+"</td>"
         + "<td>"+b.getAns3()+"</td>"
         + "<td>"+b.getAns4()+"</td>"
         + "<td>"+b.getCa()+"</td></tr>");   
}
out.print("</table>");
%>
<div align="right"> 
<form action="delques.jsp" method="post">
    <input type="hidden" name="lang" value="ques_of_c">
    <input type="submit" value="DELETE" onclick="location.href='delques.jsp'"></form></div>

<div align="left"><form action="updateq.jsp" method="post">
        <input type="hidden" name="lang" value="ques_of_c">
        Update Ques Number:<input type="text" class="fmt" name="qno" id="123">
    <input type="submit" value="UPDATE" onclick="location.href='updateq.jsp'"></form></div>


</body>
