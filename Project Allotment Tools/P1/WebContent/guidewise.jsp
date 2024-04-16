<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DBConnection"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Guide Management</title>
<link href="Adminstyle.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<script>
        function my_print(){
      window.print();
      
    }
    </script>
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
    
    db.stmt2=db.con.createStatement();
    db.rst2=db.stmt2.executeQuery("select count(name) from guide");
            if(db.rst2.next())
            { String cnt=db.rst2.getString(1);
    %>
    
    <h2 style='float:right;color:red;margin-right: 100px'><%}%></h2>
<button class="button button2" onclick="window.location.href='pro_gui_report.jsp'">Back</button>


	
  <center>
      <button type="submit" onclick="my_print()" value="Print" style="width: 100px" style="margin-right: :100px">Print</button>
      <table border=1 style='border-collapse:collapse'>
         
          <h1 style="font-size:40px;color:#008CBA;">Guide wise Report</h1>
  <br><span style="color:red"><%
      String msg=request.getParameter("msg");
      if(msg!=null)
      {
          out.println(msg);
      }
      String course=request.getParameter("course");
            //String session=request.getParameter("session");
            //HttpSession session = request.getSession();
            //DBConnection db=new DBConnection();
            db.stmt=db.con.createStatement();
            db.rst=db.stmt.executeQuery("SELECT DISTINCT g_name FROM guide_allot");
             out.println("<html><head></head><body style='background-image:url(city_scape5b.jpg);background-repeat: no-repeat;background-position: right top;background-attachment: fixed;'>"
                     + "<center><form method=get action='project_allot' onsubmit='myfunction();'>"
                    
                     
                     + "<br><table border=2 style='width:1000px;border-collapse:collapse'><tr style='background-color:skyblue'><th>Guide ID</th><th>Guide Name</th><th>Number Of Groups</th><th>Names of the Student(Group ID-NAME)</th><th>Roll Numbers</th><th>Pro. Name</th></tr>");
            //int i=1;
             while(db.rst.next())
                 
                 
            {String ses=null;
            String id6=null;
                        Statement st1=db.con.createStatement();
                        ResultSet rs6=st1.executeQuery("select g_id from guide where name='"+db.rst.getString(1)+"' ");
                        if(rs6.next())
                        {
                            id6=rs6.getString(1);
                        }
                      Statement st=db.con.createStatement();
                      ResultSet rs=st.executeQuery("select group_id,pro_name,session,course from guide_allot where g_name='"+db.rst.getString(1)+"'");
                      String name1="",rno="",name2="",rol="",crs="";
                      int i=0;
                      while(rs.next())
                       {
                           name1=name1+rs.getString(1)+", ";
                           rno=rno+rs.getString(2)+", ";
                           course=rs.getString(2);
                           ses=rs.getString(3);
                           crs=rs.getString(4);
                           Statement st2=db.con.createStatement();
                      ResultSet rt2=st2.executeQuery("SELECT * from groups where g_id='"+rs.getString(1)+"'");
                    
                      while(rt2.next())
                      {// out.println(rs.getString(1));
                          name2=name2+rs.getString(1)+"-"+rt2.getString(2)+", ";
                          rol=rol+rt2.getString(4)+", ";
                          
                      }
                           
                       i++;
                       }
                      
                           out.println("<tr><th>"+id6+"</th><th>"+db.rst.getString(1)+"</th><th>"+i+"</th><th>"+name2+"</th><th>"+rol+"</th><th>"+rno+"</th></tr>");
                      // System.out.println(rol);
                       //System.out.println(name2);
            }
%>
      </table>
  </center>

</body>
</html>
