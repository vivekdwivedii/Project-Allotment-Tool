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
        String spec=null;
        String gen=null;
        String cont=null;
        String mail=null;
        String exp=null;
        String id1=null;
        String age=null;
    String id=request.getParameter("id");
    HttpSession sess=request.getSession();
    
    DBConnection db=new DBConnection();
    db.stmt=db.con.createStatement();
    db.rst=db.stmt.executeQuery("select * from guide where g_id='"+id+"'");
    if(db.rst.next())
    {
        name1=db.rst.getString(3);
        spec=db.rst.getString(4);
        gen=db.rst.getString(5);
        cont=db.rst.getString(6);
        mail=db.rst.getString(7);
        //exp=db.rst.getString(8);
        id1=db.rst.getString(1);
        age=db.rst.getString(2); 
    %>
    
    <button class="button button2" onclick="window.location.href='search_guide.jsp'">Back</button><button class="button button2" onclick="window.location.href='admin.jsp'">Home</button>
<h1 style="font-size:50px;color:#008CBA;margin-left:600px ;">Update Guide</h1>
<br>
<form  action="update_cnfm" method="get">   
 <fieldset style="width:35%  ;position:absolutr;bottom:400px;margin-left: 500px">
 <legend style="font-size:25px;"><b>Update Guide</b></legend>
 <table style="margin-left: 20px"><tr><td>Faculty ID</td><td><input type="text" name="f" value="<%out.println(id1);%>"></td><td>Date of Joining:</td><td><input type="text" name="a"  value="<%out.println(age);%>"></td></tr></tr><tr style="margin-left: 20px"><td>Name:</td><td><input type="text" name="t1" required="required" value="<%out.println(name1);%>"></td><td>Specialization:</td><td><input type="text" name="t2" required="required" value="<%out.println(spec);%>"></td></tr>
 <tr style="margin-left: 20px"><td>Gender:</td><td><input type="text" name='t3' value="<%out.println(gen);%>"</td><td>Contact:</td><td><input type="text" name="t4" required="required" value="<%out.println(cont);%>"></td></tr>
 <tr style="margin-left: 20px"><td>E-mail:</td><td><input type="email" name="t5" required="required" value="<%out.println(mail);%>"></td><td>Experience:</td><td><input type="text" name="t6" required="required" value="<%out.println("ok");}%>"></td></tr></table>
     <button class="button button2" onclick="window.location.href='update_cnfm?id" value="<%=id%>"type="submit" name="submit">SUBMIT</button><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
 	       </fieldset>
   
</form>

</body>
</html>