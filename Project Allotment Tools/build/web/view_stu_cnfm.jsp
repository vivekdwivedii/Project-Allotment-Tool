<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>

<%@page import="DB.DBConnection"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Guide Management</title>
<link href="Adminstyle.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">

</head>

<body><%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>
    <%
    String name=null;
    try{
    name=(String) session.getAttribute("name");
    if(name==null)
    {
        response.sendRedirect("Login.jsp?error=Please Login First.");
    }
    }
    catch(NullPointerException ne)
    {
        response.sendRedirect("Login.jsp?error=Please Login First.");
    }
    %>
<button class="button button2" onclick="window.location.href='view_stu.jsp'">Back</button>
<button class="button button2" onclick="window.location.href='admin.jsp'">Home</button>


	
  <center>
      <table border=1 style='border-collapse:collapse;width: 950px'>
          <h1 style="font-size:40px;color:#008CBA;">View Students Details</h1>
  <br><span style="color:red"><% 
      String course=request.getParameter("course");
      String ssn=request.getParameter("session");
      HttpSession ss=request.getSession();
     // HttpSession crs=request.getSession();
if(ssn!=null && course!=null){
ss.setAttribute("sos", ssn);
ss.setAttribute("course", course);
}
if(ssn==null && course==null)
{
    ssn=""+ss.getAttribute("sos");
    course=""+ss.getAttribute("course");
}
      out.println("<tr style='background-color:skyblue'><th>Name</th><th>Course</th><th>Roll Number</th>"
          + "<th>Session</th><th>Year</th><th>Semester</th><th>Contact</th><th>Email</th>"
          + "<th colspan=2>ACTION</th></tr>");
  DBConnection db=new DBConnection();
  db.stmt=db.con.createStatement();
  db.rst=db.stmt.executeQuery("select * from student where course='"+course+"' and session='"+ssn+"'");
  while(db.rst.next())
  { 
  out.println("<tr><td> "+db.rst.getString(2)+"</td><td> "+(db.rst.getString(3))+"</td>"
          + "<td> "+(db.rst.getString(4))+"</td><td> "+(db.rst.getString(5))+"</td><td> "+db.rst.getString(6)+"</td>"
          + "<td> "+(db.rst.getString(7))+"</td><td> "+(db.rst.getString(8))+"</td><td>"+db.rst.getString(9)+"</td><td><a href=update_stu.jsp?id="+db.rst.getString(9)+">UPDATE</a></td><td><a href=delete_stu?id="+db.rst.getString(9)+">DELETE</a></td></tr>");  

}
%>
      </table>
  </center>

</body>
</html>
