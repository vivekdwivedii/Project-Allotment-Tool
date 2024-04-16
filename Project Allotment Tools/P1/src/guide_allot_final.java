
import DB.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vivek Dwivedi
 */
public class guide_allot_final extends HttpServlet {

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
            String session = (String)request.getAttribute("session");
             HttpSession sess = request.getSession();
            String pro=null,course=null,sos=null;
            String name=request.getParameter("t1");
            String gid=request.getParameter("sub");
            DBConnection db=new DBConnection();
            db.stmt=db.con.createStatement();
            db.rst=db.stmt.executeQuery("select * from project_allot where g_id='"+gid+"'");
            if(db.rst.next())
            {
                pro=db.rst.getString(2);
                 course=db.rst.getString(4);
                 sos=db.rst.getString(5);
            }
            db.pstmt=db.con.prepareStatement("insert into guide_allot(group_id,pro_name,g_name,course,session)values(?,?,?,?,?)");
            db.pstmt.setString(1, gid);
            db.pstmt.setString(2, pro);
            db.pstmt.setString(3, name);
            db.pstmt.setString(4, course);
            db.pstmt.setString(5, sos);
            int i=db.pstmt.executeUpdate();
            if(i>0)
            {
                db.pstmt1=db.con.prepareStatement("update project_allot set status=? where g_id='"+gid+"'");
                db.pstmt1.setString(1, "1");
                db.pstmt1.executeUpdate();
                response.sendRedirect("guide_allot_cnfm?course="+course+"");
            }
        
        } 
        catch(Exception e)
        {
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
