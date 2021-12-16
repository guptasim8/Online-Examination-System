
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz</title>
         <link rel="stylesheet" type="text/css" href="css.css">
    </head>
    <body bgcolor="pink">
        <%
            try{
                String tablename=request.getParameter("lang");
String ques=request.getParameter("q");
String r=request.getParameter("r");
String ca=request.getParameter("ca");
String c1=request.getParameter("c");
String i1=request.getParameter("i");

int i=0;
int c=0;
byte[] c2=c1.getBytes();
byte[] i2=i1.getBytes();
for(int k=0;k<(i2.length);k++)
{
for(int j=0;j<10;j++)
{
    double d=(double)k;
    if(((char)i2[k]+"").equals(((char)(48+j))+""))
    {if(k==0)i=j;
    else
      i=i*10+j;
    }
    if(k<c2.length){
    if(((char)c2[k]+"").equals(((char)(48+j))+""))
    {if(k==0)c=j;
    else
     c=c*10+j;
    }
    }
}
}
i++;
out.println("Ques"+(i-1)+": "+ques+"\n");
%>
<br>
<%
out.println("\n correct ans:\n"+ca);
%>
<br>
<%
if((r!=null)&&(r.equals(ca))){
    out.println("YOUR ANSWER IS CORRECT");
    c++;
}
else
     out.println("YOUR ANSWER IS WRONG");
    out.println();
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection
        ("jdbc:oracle:thin:@localhost:1521:xe","System","root");
    String query="select * from "+tablename+" where qno="+i;
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery(query);
    if(rs.next()){
        String  q=rs.getString("ques");
        String ans1=rs.getString("ans1");
        String ans2=rs.getString("ans2");
        String ans3=rs.getString("ans3");
        String ans4=rs.getString("ans4");
        String correct_ans=rs.getString("correct_ans");
        con.close();
        %>
    <center>
        <form action="ques2.jsp" method="post">
            <table class="t">
      <tr><th colspan=2>Ques<%=i%>:<%=q%></th></tr><br> 
           
                <tr><td><input type="radio" name="r" id="a" value="<%=ans1%>"></td><td align="left">A:<%=ans1%></td></tr><br>
                <tr><td><input type="radio" name="r" id="b" value="<%=ans2%>"></td><td align="left">B:<%=ans2%></td></tr><br>
                <tr><td><input type="radio" name="r" id="c" value="<%=ans3%>"></td><td align="left">C:<%=ans3%></td></tr><br>
                <tr><td><input type="radio" name="r" id="d" value="<%=ans4%>"></td><td align="left">D:<%=ans4%></td></tr><br></table>
        <input type="hidden" name="ca" id="ca" value="<%=correct_ans%>"><br>
        <input type="hidden" name="lang" id="lang" value="<%=tablename%>"><br>
        <input type="hidden" name="q" id="q" value="<%=q%>"><br>
        <input type="hidden" name="c" id="cc" value="<%=c%>"><br>
        <input type="hidden" name="i" id="i" value="<%=i%>"><br>
        <input type="submit" value="Next"></form></center>
        <%
        
    }
else{
request.setAttribute("c",c+"");
%>

<jsp:include page="result.jsp"/>
<%
}
}
catch(Throwable e){
 out.println("error:"+e);
}
%>
 </body>
</html>

