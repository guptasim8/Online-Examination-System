<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>C Language</title>
    </head>
    <body>

<%

String ques=request.getParameter("q");
String r=request.getParameter("r");
String ca=request.getParameter("ca");
String c1=(String)request.getAttribute("c");
String i1=request.getParameter("i");
out.println(c1+i1);
int i=1;
int c=0;
if(i1.equals("10"))i=11;
if(c1.equals("10"))c=10;
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
%>
<a href="result.jsp">submit</a>