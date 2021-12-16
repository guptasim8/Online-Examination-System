import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class Resultt extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    {
        response.setContentType("text/html;charset=UTF-8");
        
        try{
            PrintWriter out = response.getWriter();

out.println("<body bgcolor=blue>");

HttpSession session=request.getSession();
ArrayList <CQues>list=(ArrayList<CQues>)session.getAttribute("list");
ArrayList <String>choice=(ArrayList<String>)session.getAttribute("choice");
int index= (int)session.getAttribute("index");
String ch=request.getParameter("select");
if(ch.equals(null))ch="---";

choice.add(ch);
index=0;
out.println("<body bgcolor=blue><table align=center bgcolor=white>"
        + "<tr><th>Ques.No.</th><th>A</th><th>B</th><th>C</th><th>D</th><th>Correct Answer</th><th>Your Choice</th><th>status</th>");
int i=0;
for((CQues c:list)){
                     out.println("<tr><td>"+(i+1)+"</td>"
                                + "<td>"+c.getAns1()+"</td>"
                                + "<td>"+c.getAns2()+"</td>"
                                + "<td>"+c.getAns3()+"</td>"
                                + "<td>"+c.getAns4()+"</td>"
                                + "<td>"+c.getCa()+"</td>"
                             + "<td>"+choice.get(i)+"</td>"
                     );
                     if((choice.get(i)).equals(c.getCa))
                     out.println("<td>Correct</td>");
                     else out.println("<td>X</td>");
                     i++;
                    }

        }
        catch(Throwable t){
            out.println(t);  
        }
    }
}

