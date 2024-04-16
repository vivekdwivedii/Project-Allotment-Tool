
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
public class update_cnfm extends HttpServlet {

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
            String id=request.getParameter("submit");
            String name=request.getParameter("t1");
            String spec=request.getParameter("t2");
            String gen=request.getParameter("t3");
            String cont=request.getParameter("t4");
            String mail=request.getParameter("t5");
            String exp=request.getParameter("t6");
            String fac=request.getParameter("f");
            String age=request.getParameter("a");
            
            DBConnection db=new DBConnection();
            db.pstmt=db.con.prepareStatement("update guide set name=?,spec=?,gen=?,cont=?,email=?,exp=?,g_id=?,doj=? where g_id='"+id+"'");
            db.pstmt.setString(1,name);
            db.pstmt.setString(2, spec);
            db.pstmt.setString(3, gen);
            db.pstmt.setString(4, cont);
            db.pstmt.setString(5, mail);
            db.pstmt.setString(6,exp);
            db.pstmt.setString(7, fac);
            db.pstmt.setString(8,age);
            
            int i=db.pstmt.executeUpdate();
            if(i>0)
            {
                response.sendRedirect("search_guide.jsp?msg=updated successfully.");
            }
            else
            {
                response.sendRedirect("update.jsp?msg=ERROR!!!!!!");
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
