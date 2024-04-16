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
    %><button class="button button2" onclick="window.location.href='admin.jsp'">Back</button>
<h1 style="font-size:40px;color:#008CBA;margin-left:600px ;">Add Project</h1>
<form  action="add_project" method="get">  
 <fieldset style="auto">
 <legend style="font-size:25px;"><b>Add Project</b></legend>
 <table style="margin-left: 20px"><tr style="margin-left: 20px"><td>Project Title:</td><td><input type="text" name="t1" required="required"></td><td>Category:</td>
         <td><select name="t2" required=""><option></option><option>Windows Based</option>
                 <option>Web Based</option><option>Mobile Application</option><option>Hardware Based</option></select></td><td style="padding-left: 0px">Technology:</td><td style="padding-left: 30px"><span style="color:red">(1):</span>Front End:</td>
                 <td><input type="text" name="t3" required=""></td><td style="padding-left: 70px"><span style="color:red">(2):</span>Back End</td><td><input type="text" name="t4" required=""></td></tr>
     <tr style="margin-left: 10px"><td>Group ID:</td><td><input type="text" name="t5" required="required"></td><td>Session:</td>
         <td><select name="t6" required="">
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
         </select></td><td style="padding-left: 0px"></td><td>Gp Member Names:</td>
         <td><input type="text" name="t7" required=""></td><td style="padding-left: 100px">Course:</td><td><select name="t8"><option></option>
 	<option value="BCA">B.C.A</option>
 	<option value="MCA">M.C.A</option>
  </select></td></tr>
     <td></tr><table>
         <tr><td style="">Brief Description:</td><td><textarea style="max-width:800px;min-width: 1120px;max-height: 100px;font-family: Courier New;font-size: 20px" rows="10" cols="20" name="t9"></textarea></td></tr>
 </table>

 </table><input type="submit" name="Submit" style="width:100px;margin-left: 1150Px" ><br>
 <center><span style="color:red"><%
 String msg=request.getParameter("msg");
 {
     if(msg!=null)
     {
         out.println(msg);
     }
 }
 
 %></span></center>
</fieldset>
</form>
<center> <table border=1 style='border-collapse:collapse'>

  </table>
</center>
</body>
</html>