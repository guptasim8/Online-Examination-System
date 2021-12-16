<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String tablename=request.getParameter("lang");   
String qno=request.getParameter("qno");
String ques=request.getParameter("ques");
String ans1=request.getParameter("ans1");
String ans2=request.getParameter("ans2");
String ans3=request.getParameter("ans3");
String ans4=request.getParameter("ans4");
String ca=request.getParameter("ca");
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection
        ("jdbc:oracle:thin:@localhost:1521:xe","System","root");
String query="update "+tablename+" set ques=?,ans1=? ,ans2=? ,ans3=? ,ans4=? ,correct_ans=? where qno=?";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1, ques);
ps.setString(2, ans1);
ps.setString(3, ans2);
ps.setString(4, ans3);
ps.setString(5, ans4);
ps.setString(6, ca);
ps.setString(7, qno);
ps.executeUpdate();
out.println("1 question updated");
%>
<jsp:include page="update.jsp"/>
