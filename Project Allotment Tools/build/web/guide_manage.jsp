<%@page import="DB.DBConnection"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Guide Management</title>
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
  <h1 style="font-size:40px;color:#008CBA;">Guide Management</h1>
  <label></label>
  <input type="button" name="b1" value="Register Guide" onclick="window.location.href='reg_guide.jsp'"><br>
  <input type="button" name="b2" value="Delete Guide/Update Info" onclick="window.location.href='search_guide.jsp'"><b>  
  </center>
</form>
</body>
</html>
