<%
    session.invalidate();
    
    response.addHeader("Cache-Control","no-cache,no-store,max-age=0,must-revalidate");
    response.addHeader("Pragma","no-cache");
    response.setDateHeader("Expires", -1);
    response.sendRedirect("login.html");
    /*String u=(String)session.getAttribute("userid");
if(u.equals(null))
{

}else{

}*/
%>