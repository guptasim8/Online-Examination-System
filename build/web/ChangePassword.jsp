<!DOCTYPE html>
<% 
    
String e= (String) request.getAttribute("email");
String n= (String) request.getAttribute("num");
%>
<html>
    <head>
        <title>Change Password</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body bgcolor="orange">
<form action="PassProcessing.jsp" method="post" >
<table width="200" class="t" align="center">
<tr><th><label>New Password</label></th>
<td><input type="password" id="up" class="fmt" name="pass1" ></td></tr>
<tr><th><label>Re-enter New Password</label></th>
<td><input type="password" id="up" class="fmt" name="pass2" ></td></tr>
<td><input type="hidden" id="1" class="fmt" name="email" value="<%=e%>"></td></tr>
<td><input type="hidden" id="2" class="fmt" name="num" value="<%=n%>"></td></tr>
<tr><th colspan="2"><input type="submit" value="submit" id="id">Save</th></tr>
    
</table></form>
        
    </body>
</html>
