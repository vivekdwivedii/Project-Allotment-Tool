
import DB.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vivek dwivedi
 */
public class add_project extends HttpServlet {

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
           String name=request.getParameter("t1");
           String cat=request.getParameter("t2");
           String fend=request.getParameter("t3");
           String bend=request.getParameter("t4");
           String alg=request.getParameter("t5");
           String session=request.getParameter("t6");
           String mby=request.getParameter("t7");
           String sdate=request.getParameter("t8");
           String des=request.getParameter("t9");
           DBConnection db=new DBConnection();
           db.pstmt=db.con.prepareStatement("insert into project (title,cat,fend,bend,g_id,session,mby,course,des) values(?,?,?,?,?,?,?,?,?)");
           db.pstmt.setString(1, name);
           db.pstmt.setString(2, cat);
           db.pstmt.setString(3, fend);
           db.pstmt.setString(4, bend);
           db.pstmt.setString(5, alg);
           db.pstmt.setString(6, session);
           db.pstmt.setString(7, mby);
           db.pstmt.setString(8, sdate);
           db.pstmt.setString(9, des);
           
           int i=db.pstmt.executeUpdate();
           if(i>0)
           {
               response.sendRedirect("add_project.jsp?msg=Project Submitted.");
           }
           else
           {
               response.sendRedirect("add_project.jsp?msg=ERROR!!!!!!!");
           }
        } catch(Exception e){
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
