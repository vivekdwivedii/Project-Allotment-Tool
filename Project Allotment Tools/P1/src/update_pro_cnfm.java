
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
public class update_pro_cnfm extends HttpServlet {

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
            String key=request.getParameter("submit");
            String name=request.getParameter("t1");
            String tech=request.getParameter("t2");
            String sub=request.getParameter("t3");
            String branch=request.getParameter("t4");
            DBConnection db=new DBConnection();
            db.pstmt=db.con.prepareStatement("update project set p_name=?,tech=?,sub_by=?,branch=? where p_id='"+key+"'");
            db.pstmt.setString(1, name);
            db.pstmt.setString(2, tech);
            db.pstmt.setString(3, sub);
            db.pstmt.setString(4, branch);
            int i=db.pstmt.executeUpdate();
            if(i>0)
            {
                response.sendRedirect("add_project.jsp?msg=updated Successfully.");
            }
            else
            {
                response.sendRedirect("add_project.jsp?msg=ERROR!!!!!");
            }
        } catch(Exception e)
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
