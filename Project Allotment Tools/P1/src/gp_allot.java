
import DB.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vivek Dwivedi
 */
public class gp_allot extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
            Random rn = new Random();
            int key = rn.nextInt(10000) + 1;
            String s=String.valueOf(key);
            String id[]=new String[5]; 
            String course=request.getParameter("submit");
            //String course1=request.getParameter("course");
            //String sessi=request.getParameter("session");
            //String session=request.getParameter("session");
            String session = (String)request.getAttribute("session");
             HttpSession sess = request.getSession();
           // sess.setAttribute("msg", session);
            //sess.setAttribute("ses", session);
            DBConnection db=new DBConnection();
          int i,j=0,p=0;
            for(i=1;i<=60;i++)
            {
                                
             if(request.getParameter("t"+i)!=null)
             {
                
                 //System.out.println("ok");
                    id[j]=request.getParameter("t"+i); 
                     //System.out.println("m="+id[j]);
                     p++;
                j++;     
                } 
            }
            if(p>=2 && p<=4)
            {   
                
                
                for(int k=0;k<=j-1;k++)
                {
                   // System.out.println(id[k]);              
               //System.out.println("ok2");
               db.stmt=db.con.createStatement();
               db.rst=db.stmt.executeQuery("select * from student where srno='"+id[k]+"'");
               if(db.rst.next())
               {//System.out.println(session);
               String rol=db.rst.getString(4);
               String name=db.rst.getString(2);
               String ssn=db.rst.getString(5);
               
               db.pstmt=db.con.prepareStatement("insert into groups (g_id,name,course,rol,session)values(?,?,?,?,?)");
               db.pstmt.setString(1,s);
               db.pstmt.setString(2,name);
               db.pstmt.setString(3,course);
               db.pstmt.setString(4,rol);
               db.pstmt.setString(5,ssn);
               int m=db.pstmt.executeUpdate();
               if(m>0)
               {
                   db.pstmt1=db.con.prepareStatement("update student set status=? where srno='"+id[k]+"'");
                   db.pstmt1.setString(1, "1");
                   int u=db.pstmt1.executeUpdate();
                   
                  
                  
               }
               
               }
                
               else
               {
                   response.sendRedirect("select_stu?msg=ERROR!!!! to fetch the details.");
               }
                }
                response.sendRedirect("select_stu?course="+course+"");
             
            }
            else
            {
                response.sendRedirect("select_stu?msg=Please select 2 to 4 Member");
                
            }
          
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
