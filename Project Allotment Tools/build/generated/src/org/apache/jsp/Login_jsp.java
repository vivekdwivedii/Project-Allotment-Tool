package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!doctype html>\r\n");
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<title>Form_1</title>\r\n");
      out.write("<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script>\r\n");
      out.write("    \r\n");
      out.write("    function allLetter(inputtxt)  \r\n");
      out.write("      {   \r\n");
      out.write("          var name=document.getElementById('t1').value;\r\n");
      out.write("      var letters = /^[A-Z a-z]+$/;  \r\n");
      out.write("      if(name.match(letters))  \r\n");
      out.write("      {  \r\n");
      out.write("      //alert('Your name have accepted : you can try another');  \r\n");
      out.write("      return true;  \r\n");
      out.write("      }  \r\n");
      out.write("      else  \r\n");
      out.write("      {  \r\n");
      out.write("      alert('Please input alphabet characters only in Name.');  \r\n");
      out.write("      return false;  \r\n");
      out.write("      }  \r\n");
      out.write("      }  \r\n");
      out.write("</script>\r\n");
      out.write("<head>\r\n");
      out.write("   \r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body >\r\n");
      out.write("    ");

response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);

      out.write("\r\n");
      out.write("<h1 style=\"font-size:50px;color:#008CBA;margin-left:3% ;\">Project Management Tool</h1>\r\n");
      out.write("\t\r\n");
      out.write("    <form action=\"login\" method=\"post\">\r\n");
      out.write("    <fieldset style=\"margin-left:3% ;width:30%;position:relative;\" >\r\n");
      out.write("    <legend style=\"font-size:20px\"><b>Admin Login</b></legend>\r\n");
      out.write("  <label for=\"fname\" >User Name</label>\r\n");
      out.write("   <input type=\"text\" name=\"uname\" >\r\n");
      out.write("  <label for=\"fname\" >Password</label>&nbsp;&nbsp;\r\n");
      out.write("  <input type=\"password\" name=\"pswd\">\r\n");
      out.write("  <br>\r\n");
      out.write("  \t\t<input style=\"margin-left:32%;padding-right:5px; \" type=\"submit\" name=\"Submitt\"  >\r\n");
      out.write("                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:red;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
 String error=request.getParameter("error");
                
                if(error!=null)
                {
                    
                 out.println(error);
                }
                
                
      out.write("\r\n");
      out.write("                </span>\r\n");
      out.write("               \r\n");
      out.write("  </fieldset>\r\n");
      out.write("  </form>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("<form  action=\"stu_reg\" method=\"post\" name=\"form1\" onsubmit=\"return allLetter();\">  \r\n");
      out.write(" <fieldset style=\"width:35% ;margin-left:60% ;position:relative;bottom:400px\">\r\n");
      out.write(" <legend style=\"font-size:25px;\"><b>Student Registration</b></legend>\r\n");
      out.write(" <label for=\"fname\" >Name:</label>&nbsp;\r\n");
      out.write("  <input type=\"text\" name=\"name\" placeholder=\"Input User Name\" required=\"required\" id=\"t1\">\r\n");
      out.write("  <span id=\"namelocation\" style=\"color:red\"></span>\r\n");
      out.write("  <br><br>\r\n");
      out.write("  <label for=\"fname\" >Course:</label>&nbsp;\r\n");
      out.write("  <select name=\"course\"required=\"required\">\r\n");
      out.write(" \t<option value=\"\">  </option>\r\n");
      out.write("    <option value=\"BCA\">B.C.A</option>\r\n");
      out.write(" \t<option value=\"MCA\">M.C.A</option>\r\n");
      out.write("  </select>\r\n");
      out.write("  <br><br>\r\n");
      out.write("  <label for=\"fname\" >Roll.No:</label>&nbsp;\r\n");
      out.write("         <input type=\"number\" name=\"rno\" placeholder=\"Input 10 digit Roll.No\"required=\"required\">\r\n");
      out.write("         <br><br>\r\n");
      out.write("         <label for=\"fname\">Session:</label>&nbsp;\r\n");
      out.write("  \t<select name=\"session\" required=\"required\">\r\n");
      out.write(" \t<option value=\"2017\">  </option>\r\n");
      out.write("<option value=\"2017\">2017</option>\r\n");
      out.write("<option value=\"2018\">2018</option>\r\n");
      out.write("<option value=\"2019\">2019</option>\r\n");
      out.write("<option value=\"2020\">2020</option>\r\n");
      out.write("<option value=\"2021\">2021</option>\r\n");
      out.write("<option value=\"2022\">2022</option>\r\n");
      out.write("<option value=\"2023\">2023</option>\r\n");
      out.write("<option value=\"2024\">2024</option>\r\n");
      out.write("<option value=\"2025\">2025</option>\r\n");
      out.write("<option value=\"2026\">2026</option>\r\n");
      out.write("<option value=\"2027\">2027</option>\r\n");
      out.write("     </select>\r\n");
      out.write("     <br><br>\r\n");
      out.write("     <label for=\"fname\" >Year:</label>&nbsp;\r\n");
      out.write(" <br>\t<select name=\"year\" required=\"required\">\r\n");
      out.write(" \t<option value=\"second\">Second</option>\r\n");
      out.write(" \t<option value=\"third\">Third</option>\r\n");
      out.write("    <br> <br>\r\n");
      out.write("      </select>\r\n");
      out.write("&nbsp;\r\n");
      out.write("<br>\r\n");
      out.write("<label for=\"fname\">Semester:</label>&nbsp;&nbsp;\r\n");
      out.write("\t<select name=\"sem\" required=\"required\">\r\n");
      out.write("    <option value=\"3\">3</option>\r\n");
      out.write("\t<option value=\"4\">4</option>\r\n");
      out.write("    <option value=\"5\">5</option>\r\n");
      out.write("    <option value=\"6\">6</option>\r\n");
      out.write("\r\n");
      out.write("</select>\r\n");
      out.write("<br>\r\n");
      out.write("<br>\r\n");
      out.write("<label for=\"fname\" >Contact Number:</label>&nbsp;\r\n");
      out.write("     \t<input type=\"number\" name=\"number\" placeholder=\"+91#######\" required=\"required\">\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <label for=\"fname\" >E-Mail:</label>&nbsp;\r\n");
      out.write("      \t<input type=\"email\" name=\"email\" placeholder=\"Eg.abc@gmail.com\"required=\"required\">\r\n");
      out.write("        <br><br>\r\n");
      out.write("\r\n");
      out.write("        <input type=\"submit\" name=\"Submit\" onclick=\"allLetter(document.form1.name)\"  ><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("<span style=\"color:green;\">");
 String msg=request.getParameter("msg");
                if(msg!=null)
                {
                 out.println(msg);
                }
                
      out.write("\r\n");
      out.write("                </span>\r\n");
      out.write(" \t       </fieldset>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
