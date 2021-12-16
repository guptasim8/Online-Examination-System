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
 String tablename=request.getParameter("lang");
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection
        ("jdbc:oracle:thin:@localhost:1521:xe","System","root");
String[] qno=(String[])request.getParameterValues("cb");
if(qno!=null)
{

for(int i=0;i<qno.length;i++)
{
String q="delete from "+tablename+" where qno=?";
PreparedStatement p=con.prepareStatement(q);
p.setString(1, qno[i]);
p.executeUpdate();
}
}
String q="select * from "+tablename;
PreparedStatement p=con.prepareStatement(q);
ResultSet rs=p.executeQuery();
int qn=1,x=1;
while(rs.next())
{int y=0;
do{
 String qu="update "+tablename+" set qno=? where qno=?";
PreparedStatement pss=con.prepareStatement(qu);
pss.setString(1, qn+"");
pss.setString(2, x+"");
y=pss.executeUpdate();
x++;
}while(y!=1);
qn++;
}

con.close();
out.println("no of users deleted:"+qno.length);

%><center>
<jsp:include page="admin.html"/>
  