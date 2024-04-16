<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Admin</title>
<link href="Adminstyle.css" rel="stylesheet" type="text/css">
</head>

<body>
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
    %><%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>
<button class="button button2" onclick="window.location.href='logout'">SignOut</button>
<button class="button button3" onclick="window.location.href='change_pswd.jsp'">Change Password</button>
<form action="">
  <center>
  <h1 style="font-size:40px;color:#008CBA;">Management Tools</h1>
    <input type="button" name="b1" value="Group Allotmnet" onclick="window.location.href='GroupAllotment.jsp'"><br>
  <input type="button" name="b2" value="Project Allotment" onclick="window.location.href='project.jsp'"><br>
  <input type="button" name="b3" value="Guide Allotment" onclick="window.location.href='guide_allot_search.jsp'"><br>
  <input type="button" name="b4" value="Guide Load" onclick="window.location.href='guide_load.jsp'"><br>
<input type="button" name="b5"  onclick="window.location.href='guide_manage.jsp'"  value="Guide Management"><br>
<input type="button" name="b6"  onclick="window.location.href='add_project.jsp'" value="Add Project"><br>
<input type="button" name="b7" onclick="window.location.href='report.jsp'"value="Report Generation"><br>
<input type="button" name="b7" onclick="window.location.href='view_stu.jsp'"value="View/Edit Student Details"><br>
  </center>
</form>
</body>
</html>
