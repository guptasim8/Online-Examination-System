
<%@page import="cetpa.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection
        ("jdbc:oracle:thin:@localhost:1521:xe","System","root");
String query="select * from SIGNUP";
PreparedStatement ps=con.prepareStatement(query);
ResultSet rs=ps.executeQuery();
ArrayList <User> u=new ArrayList<User>();
while(rs.next())
{
        String  userid=rs.getString("userid");
        String pass=rs.getString("pass");
        String email=rs.getString("email");
        String num=rs.getString("num");
        String city=rs.getString("city");
        String type=rs.getString("type");
        User user=new User(userid,pass,email,num,city,type);
        u.add(user);
}

out.println("<body bgcolor=pink><table border=2 align=center>");
 out.println("<br><tr><td>USER ID</td><td>PASSWORD</td><td>EMAIL</td><td>MOBILE NUMBER</td><td>TYPE</td><td>CITY</td></tr>");
for(User b:u)
{
 out.println("<br><tr><td>"+b.getUserid()+"</td><td>"+b.getPass()+"</td><td>"+b.getEmail()+"</td><td>"+b.getNum()+"</td><td>"+b.getType()+"</td><td>"+b.getCity()+"</td");   
}
con.close();

%><center>
<button name="del" onclick="location.href='del.jsp'">DELETE USER</button>
<button name="add" onclick="location.href='adduser.html'">ADD USER</button></center>
