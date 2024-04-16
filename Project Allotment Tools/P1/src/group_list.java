

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
public class group_list extends HttpServlet {

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
        try {response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
            String course=request.getParameter("t1");
            String session=request.getParameter("t2");
            //HttpSession session = request.getSession();
            DBConnection db=new DBConnection();
            db.stmt=db.con.createStatement();
            db.rst=db.stmt.executeQuery("SELECT distinct g_id  FROM groups where course='"+course+"' and session='"+session+"'");
             out.println("<html><head><script>\n" +
"        function my_print(){\n" +
"      window.print();\n" +
"      history.go(-1);\n" +
"    }\n" +
"    </script></head><body style='background-image:url(city_scape5b.jpg);background-repeat: no-repeat;background-position: right top;background-attachment: fixed;'>"
                     +"<center><form method=get action='project_allot' onsubmit='myfunction();'><br><br><h2>"
                      + "<button style='background-color: white;color: black;border: 2px solid #008CBA;'onclick='my_print()'>Print</button><br>"
                     + "SRM <br><h2> DEPARTMENT OF COMPUTER APPLICATION</h2>"
                     + "<table border=2 style='width:1000px;border-collapse:collapse'><tr style='background-color:skyblue'><th>Group ID</th><th>Name</th><th>Roll No</th><th>Project Name</th><th>Guide Name</th></tr>");
            //int i=1;
             while(db.rst.next())
                 
                 
            {String pro=null;
            String name5=null;
                      Statement st=db.con.createStatement();
                      ResultSet rs=st.executeQuery("select name,rol,course,session from groups where g_id='"+db.rst.getString(1)+"'");
                      String name="",rno="";
                      int i=0;
                      while(rs.next())
                       {
                           name=name+rs.getString(1)+", ";
                           rno=rno+rs.getString(2)+", ";
                           course=rs.getString(3);
                           session=rs.getString(4);
                       i++;
                       }
                      db.stmt1=db.con.createStatement();
                      db.rst1=db.stmt1.executeQuery("select pro_name,g_name from guide_allot where group_id='"+db.rst.getString(1)+"'");
                      if(db.rst1.next())
                      {
                         pro=db.rst1.getString(1);
                         name5=db.rst1.getString(2);
                      }
                           out.println("<tr><th>"+db.rst.getString(1)+"</th><th>"+name+"</th><th>"+rno+"</th><th>"+pro+"</th><th>"+name5+"</th></tr>");
                       System.out.println(i);
            }
        } catch(Exception e)
      
        {
            //response.sendRedirect();
            e.printStackTrace();
        }
    }

}
