<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Admin</title>
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
  <h1 style="font-size:40px;color:#008CBA;"><marquee>All About Project</marquee></h1>
    <input type="button" name="b1" value="Search Project" onclick="window.location.href='search_project.jsp'"><br>
  <input type="button" name="b2" value="Allot Project" onclick="window.location.href='pro_allot_search.jsp'"><br>
  </center>
</form>
</body>
</html>
