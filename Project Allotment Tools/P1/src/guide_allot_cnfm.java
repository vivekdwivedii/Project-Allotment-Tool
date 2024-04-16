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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Arun Kumar
 */
public class guide_allot_cnfm extends HttpServlet {

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
            
            response.setHeader("Pragma","no-cache");
            response.setHeader("Cache-Control","no-store");
            response.setHeader("Expires","0");
            response.setDateHeader("Expires",-1);

            //System.out.println("ok");
            String course=request.getParameter("course");
            String session=request.getParameter("session");
            HttpSession ss=request.getSession();
if(session!=null)
ss.setAttribute("session", session);
if(session==null)
{
    session=""+ss.getAttribute("session");
}
            DBConnection db=new DBConnection();
            db.stmt=db.con.createStatement();
            db.rst=db.stmt.executeQuery("SELECT * FROM project_allot where course='"+course+"' and session='"+session+"' and status='0'");
             out.println("<html><head></head><body style='background-image:url(city_scape5b.jpg);background-repeat: no-repeat;background-position: right top;background-attachment: fixed;'>"
                     + "<button style='background-color: white;color: black;border: 2px solid #008CBA;'onclick=\"window.location.href='guide_allot_search.jsp'\">Back</button>&nbsp;&nbsp;<button style='background-color: white;color: black;border: 2px solid #008CBA;'onclick=\"window.location.href='admin.jsp'\">Home</button><center><h2 style='color:white;background-color:#008CBA'>"
                     + "Selected Group List For Guide Allotment</h2>"
                     
                     + "<br><table border=2 style='width:1000px;border-collapse:collapse'><tr style='background-color:skyblue'><th>Group ID</th><th>Project Name</th><th>Project Category</th><th>Enter Guide Name</th><th>Action</th></tr>");
             while(db.rst.next())
             {
                 db.stmt1=db.con.createStatement();
                 db.rst1=db.stmt1.executeQuery("select * from guide where spec='"+db.rst.getString(3)+"'");
                 
                 out.println("<form method=get action='guide_allot_final'><tr><td>"+db.rst.getString(1)+"</td><td>"+db.rst.getString(2)+"</td><td>"+db.rst.getString(3)+"</td><th><select name=t1 required='required' style='width:150px'><option></option>");
                 while(db.rst1.next())
                 {
                     out.println("<option >"+db.rst1.getString(3)+"</option>");
                 }
                         out.println("</select></th><td><button type=submit name=sub value="+db.rst.getString(1)+">SUBMIT</button></td></tr></form>");
             
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
