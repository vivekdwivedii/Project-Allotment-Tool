<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Admin</title>
<link href="GAll.css" rel="stylesheet" type="text/css">
<link href="Adminstyle.css" rel="stylesheet" type="text/css">
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
<button class="button button2" onclick="window.location.href='admin.jsp'">Back</button>
<form action="">
  <center>
  <h1 style="font-size:40px;color:#008CBA;">Report Generation</h1>
 
<input type="button" name="b6"  onclick="window.location.href='pro_report.jsp'" value="Session wise Project Report"><br>
<input type="button" name="b6"  onclick="window.location.href='pro_gui_report.jsp'" value="Session Wise Guide Report"><br>
<input type="button" name="b6"  onclick="window.location.href='allor_gp_report.jsp'" value="Project Name & their Guides Report"><br>
<input type="button" name="b6"  onclick="window.location.href='search_project.jsp'" value="Search/Print Project Details"><br>
<input type="button" name="b6"  onclick="window.location.href='gd_wise_srch.jsp'" value="Guide Wise Report"><br>

  </center>
</form>
</body>
</html>
