<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Group Allotment</title>
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
<button class="button button2" onclick="window.location.href='project.jsp'">Back</button>&nbsp;&nbsp;<button class="button button2" onclick="window.location.href='admin.jsp'">Home</button>
<center>
<form action="search_list.jsp">
<fieldset style="width:30%">
<legend style="color:#FFFFFF;font-size:30px"><b>Search Project</b></legend>

<label for="fname" style="margin-left:-70px;margin-right:220px">Project Name</label>&nbsp;&nbsp;
<br> <input type="text" name="t1" required="required" placeholder="Enter Project Name">
  <br>
  <br>

   <label for="fname" style="margin-left:-70px;margin-right:220px">Session:</label>&nbsp;
   <select name="t2" required="required" >
       <option ></option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
<option value="2021">2021</option>
<option value="2022">2022</option>
<option value="2023">2023</option>
<option value="2024">2024</option>
<option value="2025">2025</option>
<option value="2026">2026</option>
<option value="2027">2027</option>
     </select>

   <input type="submit" name="Submitt" value="Submit"><br>
<span style="color:red"><%
    String msg=request.getParameter("msg");
    if(msg!=null)
    {
        out.println(msg);
    }
%></span>
</fieldset>
</form>
</center>
</body>
</html>
