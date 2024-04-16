
<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="GAll.css" rel="stylesheet" type="text/css">
<link href="Adminstyle.css" rel="stylesheet" type="text/css">
<script>
        function my_print(){
      window.print();
      history.go(-1);
    }
    </script>
    </head>
    <body ><%
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
    
    <center>
        <input type="submit" onclick="my_print()" value="Print" style="width: 100px"><h2>Integral University Project Allotment Report</h2>
        <table border="2" style="border-collapse: collapse;width: 1100px"><tr><th>Group ID</th><th>Project Name</th><th>Guide Name</th></tr>
    <%
    
            DBConnection db=new DBConnection();
            String se=request.getParameter("t2");
            String co=request.getParameter("t1");
            
            db.stmt=db.con.createStatement();
            db.rst=db.stmt.executeQuery("SELECT * FROM guide_allot where session='"+se+"' and course='"+co+"'");        
            while(db.rst.next())
            {
                
    %>
            <tr><td style="padding-left: 80px"><%=db.rst.getString(1)%></td><td style="padding-left: 80px"><%=db.rst.getString(2)%></td><td style="padding-left: 80px"><%out.println(db.rst.getString(3));}%></td></tr>
        </table>
    </center></body>
</html>
