<%@page import="java.sql.ResultSet"%>
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
<button class="button button2" onclick="window.location.href='guide_load.jsp'">Back</button>
<button class="button button2" onclick="window.location.href='admin.jsp'">Home</button>


	
  <center>
      <table border=1 style='border-collapse:collapse;width: 1000px' >
  <h1 style="font-size:40px;color:#008CBA;">Search Guide</h1>
  <form action="guide_search.jsp"><label>Serach by Guide ID</label>&nbsp;<input type="text" name="id1" style="width: 200px" placeholder="Enter ID" ><input type="submit" name="submit1" value='SUBMIT' style="margin-left:10px;height:40px " ></form>
  <br>
  <br><%
      String id=request.getParameter("id1");
      out.println("<tr style='background-color:skyblue'><th>Guide ID</th><th>NAME</th>"
          + "<th>SPECIALIZATION</th><th>Gender</th><th>CONTACT</th><th>E-MAIL</th><th>EXPERIENCE</th>"
          + "<th>ACTION</th></tr>");
  DBConnection db=new DBConnection();
  db.stmt=db.con.createStatement();
  db.rst=db.stmt.executeQuery("select * from guide where g_id='"+id+"'");
  if(db.rst.next())
  {
      //db.pstmt=db.con.prepareStatement("SELECT COUNT(name) FROM guide_allot WHERE g_name as ");
      //db.pstmt.setString(1, db.rst.getString(1));
     // ResultSet rst4=db.pstmt.executeQuery();
     // rst4.next();
      
  out.println("<tr><td> "+(db.rst.getString(1))+"</td><td> "+(db.rst.getString(2))+"</td>"
          + "<td> "+(db.rst.getString(3))+"</td><td> "+(db.rst.getString(4))+"</td><td> "+(db.rst.getString(5))+"</td>"
          + "<td> "+(db.rst.getString(6))+"</td><td> "+(db.rst.getString(7))+"</td><td><a href=delete?id="+db.rst.getString(1)+">DELETE</a></td></tr>");  

}
  else
{
    response.sendRedirect("guide_load.jsp?msg=Enter a valid ID.");
}
%>
      </table>
  </center>

</body>
</html>
