<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DBConnection"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">

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
    <%
    DBConnection db=new DBConnection();
    String name1=request.getParameter("t1");
    String sos=request.getParameter("t2");
    
    
    %>
    
    
<button class="button button2" onclick="window.location.href='search_project.jsp'">Back</button><button class="button button2" onclick="window.location.href='admin.jsp'">Home</button>


	
  <center>
      <table border=1 style='border-collapse:collapse;width:900px'>
          <h1 style="font-size:40px;color:#008CBA;">Existing Project</h1>
 <%
      out.println("<tr style='background-color:skyblue'><th>Project Title</th><th>Category</th>"
          + "<th>Front End</th><th>Back End</th><th>Session</th><th>Made By</th><th>Course</th></tr>");
  //DBConnection db=new DBConnection();
  
  db.stmt=db.con.createStatement();
  String sql="select * from project where title like '%"+name1+"%' and session='"+sos+"'";
  db.rst=db.stmt.executeQuery(sql);
 
  while(db.rst.next())
  {
      
      //rst4.next();
  out.println("<tr><td> <a href='detail.jsp?id="+db.rst.getString(1)+"'>"+(db.rst.getString(1))+"</a></td><td> "+(db.rst.getString(2))+"</td>"
          + "<td> "+(db.rst.getString(3))+"</td><td> "+(db.rst.getString(4))+"</td><td> "+(db.rst.getString(6))+"</td>"
          + "<td> "+(db.rst.getString(7))+"</td><td> "+(db.rst.getString(8))+"</td></tr>");  

}
 
%>
      </table>
  </center>

</body>
</html>
