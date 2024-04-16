
import DB.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vivek Dwivedi
 */
public class guide_allot extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            String gid=request.getParameter("t1");
            String name=request.getParameter("t2");
            DBConnection db=new DBConnection();
            db.stmt=db.con.createStatement();
            db.rst=db.stmt.executeQuery("select g_id from guide where name='"+name+"'");
            if(db.rst.next())
            {
                String id=db.rst.getString(1);
                System.out.println(id);
                db.pstmt=db.con.prepareStatement("insert into guide_allot (group_id,g_name,guide_id)values(?,?,?)");
            db.pstmt.setString(1, gid);
            db.pstmt.setString(2, name);
            db.pstmt.setString(3, id);
            int i=db.pstmt.executeUpdate();
            if(i>0)
            {
                response.sendRedirect("gallotment.jsp?msg=Guide Alloted Successfully.");
            }
            else
            {
                response.sendRedirect("gallotment.jsp?msg=ERROR!!!!");
            }
            }
            
        } catch(Exception e)
        {
            response.sendRedirect("gallotment.jsp?msg=Guide already Allocated.");
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
