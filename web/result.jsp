<!DOCTYPE html>
<html>
    <head>
        <title>Online Test</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css.css">
    </head>
<body bgcolor="pink"><div align="right"> <a href="logout.jsp">logout</a></DIV>
    <table class="t" align="center"><tr><th>RESULT
            </th></tr>
        <tr><td>NO OF CORRECT ANSWERS:</td></tr>
        <tr><th><%
        String c= (String) request.getAttribute("c");
    out.println(c);
    %>
            </th></tr></table></BODY>
    <br><br><br><br><br><br>
    <a href="index.html" >Wanna Continue Another Quiz or repeat the same</a><br><br>



