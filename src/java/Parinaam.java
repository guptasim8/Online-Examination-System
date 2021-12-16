import java.util.ArrayList;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Parinaam extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try{
            PrintWriter out = response.getWriter();
           out.println("<body bgcolor=black>");
           HttpSession session=request.getSession();

           ArrayList <CQues>list=(ArrayList<CQues>)session.getAttribute("list");

ArrayList <String>choice=(ArrayList<String>)session.getAttribute("choice");
int index= (int)session.getAttribute("index");
String  ch="";
try{
ch=request.getParameter("select");
ch=ch.replaceAll("--"," ");
}
catch(Throwable t){
    ch="---";
}
finally{
    try{choice.remove(index);
    response.sendRedirect("index.html");
    }
catch(Throwable t){
choice.add(index, ch);
session.setAttribute("choice", choice);
out.println("<body bgcolor=blue><h1>RESULT</h1>"
        + "<table width=500 class=t align=center style=background-image:url(picture.jpg);>" 
        + "<tr><th>Ques.No.</th><th>A</th><th>B</th><th>C</th><th>D</th><th>Correct Answer</th><th>Your Choice</th><th>status</th>");
int i=0;
int score=0;
for(CQues c:list){
    String g=choice.get(i);

                     out.println("<tr><td>"+(i+1)+") "+c.getQues()+"</td>"
                             + "<td>"+c.getAns1()+"</td>"
                                + "<td>"+c.getAns2()+"</td>"
                                + "<td>"+c.getAns3()+"</td>"
                                + "<td>"+c.getAns4()+"</td>"
                                + "<td>"+c.getCa()+"</td>"
                             + "<td>"+g+"</td>"
                     );
                     if(g.equals(c.getCa())){
                     out.println("<td>Correct</td></tr>");
                     score=score+1;
                     }
                     else out.println("<td>X</td></tr>");
                     i++;
                    }
                    out.println("<tr><th colspan=8><center>Your Score :("+score+"/10)</th></tr></table>");
}   }  }  
            catch(NullPointerException e){
                response.sendRedirect("index.html");
                } 
    }

}
