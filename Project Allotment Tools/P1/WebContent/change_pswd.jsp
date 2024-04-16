<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Admin</title>
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
<button class="button button2" onclick="window.location.href='admin.jsp'">Back</button>

<form action="chng_pswd" method="get">
    <fieldset style="margin-left:3% ;width:30%;position:relative;margin-left: 550px" >
    <legend style="font-size:20px"><b>Change Password</b></legend>
  <label for="fname" >Old Password</label>
   <input type="password" name="opswd" >
  <label for="fname" >New Password</label>&nbsp;&nbsp;
  <input type="password" name="npswd"><label for="fname" >Confirm Password</label>&nbsp;&nbsp;
  <input type="password" name="cpswd">
  <br>
  		<input style="margin-left:32%;padding-right:5px; " type="submit" name="Submitt"  >
                <br><span style="color:red;"><% String error=request.getParameter("msg");
                if(error!=null)
                {
                 out.println(error);
                }
                %>
                </span>
               
  </fieldset>
  </form>
</body>
</html>
