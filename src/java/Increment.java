
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Increment extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       HttpSession session=request.getSession();
        ArrayList <CQues>list=(ArrayList<CQues>)session.getAttribute("list");
        ArrayList <String>choice=(ArrayList<String>)session.getAttribute("choice");
        int index= (int)session.getAttribute("index");
        
String ch="";

try{
ch=request.getParameter("select");
ch=ch.replaceAll("--", " ");
}catch(Throwable t){
    ch="---";
}
finally{
try{
    choice.remove(index);}
catch(Throwable t){
}
finally{
choice.add(index, ch);
session.setAttribute("choice", choice);
index=index+1;
session.setAttribute("index", index);
response.sendRedirect("questionsC");

        }
    }
}  
            catch(NullPointerException e){
                response.sendRedirect("index.html");
                } 
}
}

