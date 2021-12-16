<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String tablename=request.getParameter("lang");
  
String qno=request.getParameter("qno");

try{
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection
        ("jdbc:oracle:thin:@localhost:1521:xe","System","root");
String query="select * from "+tablename+" where qno=?";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1, qno);
ResultSet rs=ps.executeQuery();
if(rs.next()){
    String oq=rs.getString("ques");
    String oa1=rs.getString("ans1");
    String oa2=rs.getString("ans2");
    String oa3=rs.getString("ans3");
    String oa4=rs.getString("ans4");
    String oca=rs.getString("correct_ans");

%>
<body bgcolor="pink">
<form action="updating.jsp" method="post">
    <table border="2" align="center">
    <tr><th>Ques<%=qno%>:</th><td><input type=text name=ques value="<%=oq%>"></td></tr>
    <tr><th>A:</th><td><input type=text name=ans1 value="<%=oa1%>"></td></tr>
    <tr><th>B:</th><td><input type=text name=ans2 value="<%=oa2%>"></td></tr>
    <tr><th>C:</th><td><input type=text name=ans3 value="<%=oa3%>"></td></tr>
    <tr><th>D:</th><td><input type=text name=ans4 value="<%=oa4%>"></td></tr>
    <tr><th>Correct Answer:</th><td><input type=text name=ca value="<%=oca%>"></td></tr>
    <tr><td colspan="2"><input type=hidden name=qno value="<%=qno%>"></td></tr>
    <tr><th colspan="2"><input type="hidden" name="lang" value="<%=tablename%>"></th></tr>
    <tr><th colspan="2"><input type="submit" name=save value="Save" ></th></tr>
    </table></form>
    <%  
}
else{
out.println("Invalid Question Number:"+qno);
%>
<jsp:include page="update.jsp"/>
<%
    }
}
catch(Throwable t)
{
out.println(t);
}

%>
</body>