<%@page import="DB.DBConnection"%>
<html>
<head>
<meta charset="utf-8">
<title>Form_1</title>
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
    <%
        String name1=null;
        String tech=null;
        String sub_by=null;
        String branch=null;
        
    String id=request.getParameter("id");
    
    
    DBConnection db=new DBConnection();
    db.stmt=db.con.createStatement();
    db.rst=db.stmt.executeQuery("select * from project where p_id='"+id+"'");
    if(db.rst.next())
    {
        name1=db.rst.getString(2);
        tech=db.rst.getString(3);
        sub_by=db.rst.getString(4);
        branch=db.rst.getString(5);
       
    %>
    <button class="button button2" onclick="window.location.href='admin.jsp'">Back</button>
<h1 style="font-size:50px;color:#008CBA;margin-left:600px ;">Update Project</h1>
<form  action="update_pro_cnfm" method="get">  
 <fieldset style="width:35%;position:absolutr;bottom:400px;margin-left: 500px">
 <legend style="font-size:25px;"><b>Update Project</b></legend>
 <table style="margin-left: 20px"><tr style="margin-left: 20px"><td>Project Name:</td><td><input type="text" name="t1" required="required" value="<%=name1%>"></td><td>Technology:</td><td><input type="text" name="t2" required="required" value="<%=tech%>"></td></tr>
     <tr style="margin-left: 20px"><td>Submitted By:</td><td><input type="text" name="t3" required="required" value="<%=sub_by%>"></td><td>Branch:</td><td><input type="text" name="t4" required="required" value="<%out.println(branch);}%>"></td></tr>
 </table>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="button button2" onclick="window.location.href='update_pro_cnfm'" value="<%=id%>" type="submit" name="submit">SUBMIT</button>
 <span style="color:red"><%
String msg=request.getParameter("msg");
if(msg!=null)
{
    out.println(msg);
}
 %></span>
 </fieldset>
</form>
</body>
</html>