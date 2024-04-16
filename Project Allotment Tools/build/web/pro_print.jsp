
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
%><center>
        <input type="submit" onclick="my_print()" value="Print" style="width: 100px"><h2>SRM Existing Projet List</h2>
        <table border="2" style="border-collapse: collapse;width: 900px"><tr style="background-color:skyblue"><th>Group ID</th><th>Project Name</th><th>Made By</th><th>Front End</th><th>Back End</th><th>Category</th></tr>
    <%
    String cou=request.getParameter("cou");
    String sos=request.getParameter("sos");
    System.out.println(cou);
    System.out.println(sos);
    
    DBConnection db=new DBConnection();
    db.stmt=db.con.createStatement();
    db.rst=db.stmt.executeQuery("select * from project where session='"+sos+"' and course='"+cou+"'");
    while(db.rst.next())
    {
        
    
    %>
            <tr><th style="background-color: skyblue"><%=db.rst.getString(5)%></th><td><%=db.rst.getString(1)%></td><td><%=db.rst.getString(7)%></td><td><%=db.rst.getString(3)%></td><td><%=db.rst.getString(4)%></td><td><%out.println(db.rst.getString(2));}%></td></tr>
        </table>
    </center></body>
</html>
