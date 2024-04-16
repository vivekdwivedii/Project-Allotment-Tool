/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DB.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vivek Dwivedi
 */
public class select_stu extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           // String name1=null,sos=null;
           
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);

            String course=request.getParameter("course");
            String session=request.getParameter("session");
HttpSession ss=request.getSession();
if(session!=null)
ss.setAttribute("session", session);
if(session==null)
{
   
    session=""+ss.getAttribute("session");
     //response.sendRedirect("Login.jsp?error=Please Login First.");
}

            DBConnection db=new DBConnection();
            db.stmt=db.con.createStatement();
            db.rst=db.stmt.executeQuery("select * from student where course='"+course+"' and session='"+session+"' and status='0'");
             out.println("<html><head></head><body style='background-image:url(city_scape5b.jpg);background-repeat: no-repeat;background-position: right top;background-attachment: fixed;'>"
                     + "<button style='background-color: white;color: black;border: 2px solid #008CBA;'onclick=\"window.location.href='GroupAllotment.jsp'\">Back</button>&nbsp; &nbsp;<button style='background-color: white;color: black;border: 2px solid #008CBA;'onclick=\"window.location.href='admin.jsp'\">Home</button><center><form method=get action=gp_allot?session="+session+" onsubmit='myfunction();'><h2 style='color:white;background-color:#008CBA'>"
                     + "Selected Student List For Group Allotment</h2>"
                     +"<span style='color:red'>*You have select minimum 2 and maximum 4 Students in a group.*</span><br>"
                     + "<br><table border=2 style='width:1000px;border-collapse:collapse'><tr style='background-color:skyblue'><th>SR NO.</th><th>NAME</th><th>ROLL NO.</th><th>YEAR</th><th>EMAIL</th><th>SELECT</th></tr>");
            int i=1;
             while(db.rst.next())
            {
                
                        out.println("<tr><th>"+db.rst.getString(1)+"</th><th>"+db.rst.getString(2)+"</th><th>"+db.rst.getString(4)+"</th><th>"+db.rst.getString(6)+"</th><th>"+db.rst.getString(9)+"</th><th><input type=checkbox value="+db.rst.getString(1)+" name=t"+i+"></th></tr>");
                        i++;
            }
            out.println("</table><br><br><span style='margin-left:800px' ><th><button class=\"button button2\" onclick=\"window.location.href='gp_allot?id\" value='"+course+"'type=\"submit\" name=\"submit\">SUBMIT</button></th></span></form></center></body></html>");
            
        
        } catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
