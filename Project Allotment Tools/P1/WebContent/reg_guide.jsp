<html>
<head>
<meta charset="utf-8">
<title>Form_1</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="Adminstyle.css" rel="stylesheet" type="text/css">
<script>
    
    function allLetter(inputtxt)  
      {   
          var name=document.getElementById('t1').value;
      var letters = /^[A-Za-z ]+$/;  
      if(name.match(letters))  
      {  
      //alert('Your name have accepted : you can try another');  
      return true;  
      }  
      else  
      {  
      alert('Please input alphabet characters only in Name.');  
      return false;  
      }  
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
    <button class="button button2" onclick="window.location.href='guide_manage.jsp'">Back</button> <button class="button button2" onclick="window.location.href='admin.jsp'">Home</button>
<h1 style="font-size:50px;color:#008CBA;margin-left:600px ;">Register Guide</h1>
<br>
<form  action="registration1" method="post" name="form1" onsubmit="return allLetter();"> 
 <fieldset style="width:35%  ;position:absolutr;bottom:400px;margin-left: 500px">
 <legend style="font-size:25px;"><b>Guide Registration</b></legend>
 <table style="margin-left: 20px"><tr><td>Faculty ID</td><td><input type="text" name="f"></td><td>Date of Joining:</td><td><input type="date" name="a"></td></tr></tr><tr style="margin-left: 20px"><td>Name:</td><td><input type="text" name="t1" required="required" id="t1"></td><td>Specialization:</td><td><select name="t2" required=""><option></option><option>Windows Based</option>
                 <option>Web Based</option><option>Mobile Application</option><option>Hardware Based</option></select></td></tr>
 <tr style="margin-left: 20px"><td>Gender:</td><td><select name="t3" required="required"><option></option><option>Select Gender</option><option>Male</option><option>Female</option></select></td><td>Contact:</td><td><input type="number" name="t4" required="required"></td></tr>
 <tr style="margin-left: 20px"><td>E-mail:</td><td><input type="email" name="t5" required="required"></td></td></tr></table>

        <input type="submit" name="Submit"  ><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <span style="color:red">  <%
    String msg=request.getParameter("msg");
    if(msg!=null)
    {
        out.println(msg);
    }
   
    %> </span>
 	       </fieldset>
   
</form>

</body>
</html>