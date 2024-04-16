/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
public class registration1 extends HttpServlet {

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
        try {
            String name=request.getParameter("t1");
            String spec=request.getParameter("t2");
            String gen=request.getParameter("t3");
            String cont=request.getParameter("t4");
            String email=request.getParameter("t5");
           // String exp=request.getParameter("t6");
            String fac=request.getParameter("f");
            String doj=request.getParameter("a");
       // out.println("<h1>Hello1");    
            DBConnection db=new DBConnection();
            db.pstmt=db.con.prepareStatement("insert into guide(name,spec,gen,cont,email,g_id,doj)values(?,?,?,?,?,?,?)");
            db.pstmt.setString(1, name);
            db.pstmt.setString(2, spec);
            db.pstmt.setString(3, gen);
            db.pstmt.setString(4,cont);
            db.pstmt.setString(5, email);
           // db.pstmt.setString(6, exp);
            db.pstmt.setString(6, fac);
            db.pstmt.setString(7, doj);
            //out.println("<h1>Hello3");
     
            int i=db.pstmt.executeUpdate();
            
            if(i>0)
            {
                response.sendRedirect("reg_guide.jsp?msg=Registered Successfully.");
            }
            else
            {
                response.sendRedirect("reg_guide.jsp?msg=ERROR!!!!!!!!!!!");
            }
        } catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
