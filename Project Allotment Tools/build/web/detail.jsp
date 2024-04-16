<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DBConnection"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">

<link href="Adminstyle.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<style>
    
    th{
        height: 40px;
    }
</style>
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
   String msg=request.getParameter("id");
   DBConnection db=new DBConnection();
   db.stmt=db.con.createStatement();
   db.rst=db.stmt.executeQuery("select * from project where title='"+msg+"'");
   if(db.rst.next())
   {
     String name1=db.rst.getString(1);
  String cat=db.rst.getString(2);
String fend=db.rst.getString(3);
String bend=db.rst.getString(4);
String gid=db.rst.getString(5);
String ssn=db.rst.getString(6);
String mby=db.rst.getString(7);
String course=db.rst.getString(8);
String des=db.rst.getString(9);

%>
    
<button class="button button2" onclick="window.location.href='search_project.jsp'">Back</button><button class="button button2" onclick="window.location.href='admin.jsp'">Home</button>


	
  <center> <button class="button button2"type="submit" name="button" onclick="window.print()">PRINT</button>
      <div style="background-color:white;width: 700px">
      <table  border=1 style='border-collapse:collapse;width:700px'>
         
          <tr style="background-color:skyblue"><th style="font-family: verdana ;font-size: 20px"colspan='4' ><b>Details of the Project</b></th></tr>
          <tr><td style="color:red">Project Title:</td><th><%=name1%></th><td style="color:red">Project Category:</th><th><%=cat%></th></tr>
          <tr><td style="color:red">Front End Used:</td><th><%=fend%></th><td style="color:red">Back END USED</th><th><%=bend%></th></tr>
          <tr><td style="color:red">Made By:</td><th><%=mby%></th><td style="color:red">Session:</th><th><%=ssn%></th></tr>
          <tr><td style="color:red">Course:</td><th><%=course%></th><td style="color:red">Group ID:</th><th><%=gid%></th></tr>
          <tr><td style="color:red" colspan="3">Description:</td><td colspan="3" ><%out.println(des);}%></td></tr>
          <tr></tr>
      </table>
           
      </div>
  </center>

</body>
</html>
