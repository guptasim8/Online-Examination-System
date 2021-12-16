import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class Questions extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        try{
            PrintWriter out = response.getWriter();

out.println("<!DOCTYPE html><html><head>"
        + "<meta http-equiv=Content-Type content=text/html; charset=UTF-8>"
        + "        <title>Questions</title>\n"
        + " <link rel=\"stylesheet\" type=\"text/css\" href=\"css.css\">\n"
        + " </head>"
        + "<body bgcolor=black>");

Class.forName("oracle.jdbc.OracleDriver");

Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","root");
String query="select * from ques_of_c";

PreparedStatement ps=con.prepareStatement(query);
ResultSet rs=ps.executeQuery(query);
ArrayList <CQues>list=new ArrayList<CQues>();
ArrayList <String>choice=new ArrayList<String>();
HttpSession session=request.getSession();

while(rs.next())
{
    CQues q=new CQues();
q.setQues(rs.getString("ques"));
q.setAns1(rs.getString("ans1"));
q.setAns2(rs.getString("ans2"));
q.setAns3(rs.getString("ans3"));
q.setAns4(rs.getString("ans4"));
q.setCa(rs.getString("correct_ans"));
list.add(q);
}
con.close();
Collections.shuffle(list);
session.setAttribute("list", list);
session.setAttribute("choice", choice);
session.setAttribute("index",0);
response.sendRedirect("Inc");
        }  
        catch(NullPointerException e){   
        }
        catch(Exception e){   
        }
    }
}

