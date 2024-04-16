<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>

<%@page import="DB.DBConnection"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Guide Management</title>
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
<button class="button button2" onclick="window.location.href='guide_manage.jsp'">Back</button>
<button class="button button2" onclick="window.location.href='admin.jsp'">Home</button>


	
  <center>
      <table border=1 style='border-collapse:collapse;width: 950px'>
  <h1 style="font-size:40px;color:#008CBA;">Search Guide</h1>
  <form action="search_id.jsp"><label>Serach by Guide ID</label>&nbsp;<input type="text" name="id1" style="width: 200px" placeholder="Enter ID" ><input type="submit" name="submit1" value='SUBMIT' style="margin-left:10px;height:40px " ></form>
  <br><form action="search_name.jsp"><label>Serach by G. Name</label>&nbsp;<input type="text" name="id2" style="width: 200px" placeholder="Enter Name" ><input type="submit" name="submit2" value="SUBMIT" style="margin-left:10px;height:40px"></form>
  <br><span style="color:red"><% 
      Date doj;
      Date cdate;
      String msg=request.getParameter("msg");
      if(msg!=null)
      {
          out.println(msg);
      }
      out.println("<tr style='background-color:skyblue'><th>Guide ID</th><th>Date of Joining</th><th>NAME</th>"
          + "<th>SPECIALIZATION</th><th>Gender</th><th>CONTACT</th><th>E-MAIL</th><th>EXPERIENCE</th>"
          + "<th colspan=2>ACTION</th></tr>");
  DBConnection db=new DBConnection();
  db.stmt=db.con.createStatement();
  db.rst=db.stmt.executeQuery("select * from guide");
  while(db.rst.next())
  { long year=0;
      doj=db.rst.getDate(2);
      cdate= new java.util.Date();
     // out.println(doj);
      //out.println(cdate);
      Calendar c=Calendar.getInstance();
                    c.setTime(doj);
                    //c.add(Calendar.DATE,7);
                    doj=c.getTime();
                    if(cdate.after(doj))
                    {
                        long diff=Math.abs(cdate.getTime()-doj.getTime());
                        long diffdays=diff/(24*60*60*1000);
                        year=diffdays/365;
                       // out.println(year);
                    }
  out.println("<tr><td> "+db.rst.getString(1)+"</td><td> "+(db.rst.getString(2))+"</td>"
          + "<td> "+(db.rst.getString(3))+"</td><td> "+(db.rst.getString(4))+"</td><td> "+db.rst.getString(5)+"</td>"
          + "<td> "+(db.rst.getString(6))+"</td><td> "+(db.rst.getString(7))+"</td><td>"+year+"</td><td><a href=update.jsp?id="+db.rst.getString(1)+">UPDATE</a></td><td><a href=delete?id="+db.rst.getString(1)+">DELETE</a></td></tr>");  

}
%>
      </table>
  </center>

</body>
</html>
