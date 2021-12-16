
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Inc extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        HttpSession session=request.getSession();
            try{
                
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       
        ArrayList <CQues>list=(ArrayList<CQues>)session.getAttribute("list");
        ArrayList <String>choice=(ArrayList<String>)session.getAttribute("choice");
        int index= (int)session.getAttribute("index");

        
if((list.size())>index){
                     CQues c=list.get(index);
                     if((list.size()-1)>index)
                     out.println("<body bgcolor=black><form action=Increment method=post>"
                                + "<table width=300 class=t align=center cellspacing=8 style=background-image:url(picture.jpg);>" 
                                + "<tr><th>Ques.No."+(index+1)+"</th><td>"+c.getQues()+"</td></tr>"
                                + "<tr><td><input type=radio name=select value="+(c.getAns1()).replace(" ","--")+">A</td><td>"+c.getAns1()+"</td></tr>"
                                + "<tr><td><input type=radio name=select value="+(c.getAns2()).replace(" ","--")+">B</td><td>"+c.getAns2()+"</td></tr>"
                                + "<tr><td><input type=radio name=select value="+(c.getAns3()).replace(" ","--")+">C</td><td>"+c.getAns3()+"</td></tr>"
                                + "<tr><td><input type=radio name=select value="+(c.getAns4()).replace(" ","--")+">D</td><td>"+c.getAns4()+"</td></tr>"
                             + "<tr><td colspan=2><input type=hidden name=var value=1></td></tr>"   
                             +"<tr><td colspan=2><input type=button value=PREV ></td>"
                             + "<td colspan=1><input type=submit value=NEXT ></td></tr>");
                         else
                        out.println("<body bgcolor=blue><form action=Parinaam method=post><table align=center bgcolor=white><tr><th>Ques.No."+(index+1)+"</th><td>"+c.getQues()+"</td></tr>"
                                + "<tr><td><input type=radio name=select value="+(c.getAns1()).replace(" ","--")+">A</td><td>"+c.getAns1()+"</td></tr>"
                                + "<tr><td><input type=radio name=select value="+(c.getAns2()).replace(" ","--")+">B</td><td>"+c.getAns2()+"</td></tr>"
                                + "<tr><td><input type=radio name=select value="+(c.getAns3()).replace(" ","--")+">C</td><td>"+c.getAns3()+"</td></tr>"
                                + "<tr><td><input type=radio name=select value="+(c.getAns4()).replace(" ","--")+">D</td><td>"+c.getAns4()+"</td></tr>"
                                +"<tr><td colspan=2><input type=button value=PREV ></td>"
                                + "<td colspan=1><input type=submit value=SUBMIT ></td></tr>");
}

            }  
            catch(NullPointerException e){
                response.sendRedirect("index.html");
                }      

    }

    }


