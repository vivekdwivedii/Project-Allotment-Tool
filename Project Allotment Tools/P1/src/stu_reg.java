
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
public class stu_reg extends HttpServlet {

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
            String name=request.getParameter("name");
            String course=request.getParameter("course");
            String rno=request.getParameter("rno");
            String session=request.getParameter("session");
            String year=request.getParameter("year");
            String sem=request.getParameter("sem");
            String cont=request.getParameter("number");
            String email=request.getParameter("email");
            DBConnection db=new DBConnection();
            db.stmt=db.con.createStatement();
            db.rst=db.stmt.executeQuery("select * from student where rolno='"+rno+"'");
            if(db.rst.next())
            {
                response.sendRedirect("Login.jsp?msg=This Roll No already exist.");
            }
            else
            {
            db.pstmt=db.con.prepareStatement("insert into student(name,course,rolno,session,year,semester,cont,email)values(?,?,?,?,?,?,?,?)");
            db.pstmt.setString(1, name);
            db.pstmt.setString(2, course);
            db.pstmt.setString(3, rno);
            db.pstmt.setString(4, session);
            db.pstmt.setString(5, year);
            db.pstmt.setString(6, sem);
            db.pstmt.setString(7, cont);
            db.pstmt.setString(8, email);
            int i=db.pstmt.executeUpdate();
            if(i>0)
            {
                response.sendRedirect("Login.jsp?msg=Registered Successfully.");
            }
            else
            {
                response.sendRedirect("Login.jsp?msg=ERROR!!!!!!!!!!!");
            }
            }
        } catch(Exception e)
        {
            response.sendRedirect("Login.jsp?msg="+e.getMessage()+"");
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
