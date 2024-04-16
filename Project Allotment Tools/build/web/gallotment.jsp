<%@page import="DB.DBConnection"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Group Allotment</title>
<link href="PAll.css" rel="stylesheet" type="text/css">
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
    db.stmt=db.con.createStatement();
    db.rst=db.stmt.executeQuery("select distinct g_id from groups");
    db.stmt1=db.con.createStatement();
    db.rst1=db.stmt1.executeQuery("select * from guide");
   
    %>
<button class="button button2" onclick="window.location.href='admin.jsp'">Back</button>
<center>

<form action="guide_allot" >
<fieldset style="">
<legend style="color:#FFFFFF;font-size:20px"><b>Guide Allotment</b></legend>

<label for="fname" style="margin-left:-70px;margin-right:220px">Group ID</label>&nbsp;&nbsp;
   <br> <select name="t1">
       <option >Select Group</option><%while(db.rst.next()){%>
       <option ><%out.println(db.rst.getString(1));}%></option>
  </select>
  <br>
  <br>

   <label for="fname" style="margin-left:-70px;margin-right:220px">Guide name:</label>&nbsp;
  	<select name="t2"> 
            <option>Select Guide Name</option><%while(db.rst1.next()){%><option><% out.println(db.rst1.getString(2));}%></option>
        
        </select>

            <button type=submit name=Submit value= fghj>SUBMIT</button>
<br><span style="color:red">
    <%
    String msg=request.getParameter("msg");
    if(msg!=null)
    {
        out.println(msg);
    }
    
    
    %>
</span>
</fieldset>
</form>
</center>
</body>
</html>
