

import DB.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vivek Dwivedi
 */
public class pro_allot extends HttpServlet {

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
            
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);

            String course=request.getParameter("course");
            String session=request.getParameter("session");
            //HttpSession session = request.getSession();
            DBConnection db=new DBConnection();
            db.stmt=db.con.createStatement();
            db.rst=db.stmt.executeQuery("SELECT DISTINCT g_id FROM groups where status='0'");
             out.println("<html><head></head><body style='background-image:url(city_scape5b.jpg);background-repeat: no-repeat;background-position: right top;background-attachment: fixed;'>"
                     + "<button style='background-color: white;color: black;border: 2px solid #008CBA;'onclick=\"window.location.href='pro_allot_search.jsp'\">Back</button>&nbsp;&nbsp;<button style='background-color: white;color: black;border: 2px solid #008CBA;'onclick=\"window.location.href='admin.jsp'\">Home</button><center><h2 style='color:white;background-color:#008CBA'>"
                     + "Selected Group List For Project Allotment</h2>"
                     
                     + "<br><table border=2 style='width:1000px;border-collapse:collapse'><tr style='background-color:skyblue'><th>Group ID</th><th>Name</th><th>Roll No.</th><th>Project Category</th><th>Project Name</th><th>Submit</th></tr>");
            //int i=1;
             while(db.rst.next())
                 
                 
            {           
                
                      Statement st=db.con.createStatement();
                      ResultSet rs=st.executeQuery("select name,rol from groups where g_id='"+db.rst.getString(1)+"'");
                      String name="",rno=""; 
                      while(rs.next())
                       {
                           name=name+rs.getString(1)+", ";
                           rno=rno+rs.getString(2)+", ";
                           //course=rs.getString(3);
                          // session=rs.getString(4);
                       
                       }
                           out.println("<form method=get action='project_allot' ><tr><th>"+db.rst.getString(1)+"</th><th>"+name+"</th><th>"+rno+"</th><th><select  name=cat><option></option><option>Windows Based</option><option>Web Based</option><option>Mobile Application</option><option>Hardware Based</option></select></th><th><input type=text placeholder='Enter Project Name' style='width:200px' name=z></th><th><button type=submit name=t1 value="+db.rst.getString(1)+">SUBMIT</button></th></tr></form>");
                       
            }
        } catch(Exception e)
      
        {
            //response.sendRedirect();
            e.printStackTrace();
        }
    }

}
