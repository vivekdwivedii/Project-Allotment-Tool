<%@page import="DB.DBConnection"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Admin</title>

<link href="style.css" rel="stylesheet" type="text/css">
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
<button class="button button2" onclick="window.location.href='report.jsp'">Back</button>
<button class="button button2" onclick="window.location.href='admin.jsp'">Home</button>
<%
DBConnection db=new DBConnection();
db.stmt=db.con.createStatement();
db.rst=db.stmt.executeQuery("select name from guide");


%>
<form action="g_cmp.jsp" method="post">
  <center>
  <h1 style="font-size:40px;color:#008CBA;"><marquee>Generate Report</marquee></h1>
 
  <table style="font-size: 25px">
     
      <tr><td>Select Guide Name:</td><td><select name="t1" required="" style="width: 200px">
                 
 <option ></option>	
 <%
     while(db.rst.next())
    {
       out.println("<option>"+db.rst.getString(1)+"</option>");
   }
 %>
</select></tr>
      <tr><td>Select Session:</td><td><select name="t2" required="" style="width: 200px">
                 
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
         </select></td></tr>
  </table>
  <button class="button button2" type="submit">View Report</button>
  </center>
</form>
</body>
</html>
