<!doctype html>
<html>

<meta charset="utf-8">
<title>Home Page</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
    
    function allLetter(inputtxt)  
      {   
      var name=document.getElementById('t1').value;
      var letters = /^[A-Z a-z]+$/;  
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


<body >
    <%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>
<h1 style="font-size:50px;color:#008CBA;margin-left:3% ;">Project Management Tool</h1>
	
    <form action="login" method="post">
    <fieldset style="margin-left:3% ;width:30%;position:relative;" >
    <legend style="font-size:20px"><b>Admin Login</b></legend>
  <label for="fname" >User Name</label>
   <input type="text" name="uname" >
  <label for="fname" >Password</label>&nbsp;&nbsp;
  <input type="password" name="pswd">
  <br>
  <input style="margin-left:32%;padding-right:5px; " type="submit" name="Submitt"  >
  <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% String error=request.getParameter("error");
                
                if(error!=null)
                {
                    
                 out.println(error);
                }
                
                %>
                </span>
               
  </fieldset>
  </form>


<br>
<form  action="stu_reg" method="post" name="form1" onsubmit="return allLetter();">  
 <fieldset style="width:35% ;margin-left:60% ;position:relative;bottom:400px">
 <legend style="font-size:25px;"><b>Student Registration</b></legend>
 <label for="fname" >Name:</label>&nbsp;
  <input type="text" name="name" placeholder="Input User Name" required="required" id="t1">
  <span id="namelocation" style="color:red"></span>
  <br><br>
  <label for="fname" >Course:</label>&nbsp;
  <select name="course" required="required">
 	<option value="">  </option>
    <option value="BCA">B.C.A</option>
 	<option value="MCA">M.C.A</option>
  </select>
  <br><br>
  <label for="fname" >Roll.No:</label>&nbsp;
         <input type="number" name="rno" placeholder="Input 10 digit Roll.No"required="required">
         <br><br>
         <label for="fname">Session:</label>&nbsp;
  	<select name="session" required="required">
 	<option value="2017">  </option>
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
     </select>
     <br><br>
     <label for="fname" >Year:</label>&nbsp;
 <br>	<select name="year" required="required">
 	<option value="second">Second</option>
 	<option value="third">Third</option>
<br><br>
      </select>
&nbsp;
<br>
<label for="fname">Semester:</label>&nbsp;&nbsp;
	<select name="sem" required="required">
    <option value="3">3</option>
	<option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>

</select>
<br>
<br>
<label for="fname" >Contact Number:</label>&nbsp;
     	<input type="number" name="number" placeholder="+91#######" required="required">
        <br><br>
        <label for="fname" >E-Mail:</label>&nbsp;
      	<input type="email" name="email" placeholder="Eg.abc@gmail.com"required="required">
        <br><br>

        <input type="submit" name="Submit" onclick="allLetter(document.form1.name)"  ><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span style="color:green;"><% String msg=request.getParameter("msg");
                if(msg!=null)
                {
                 out.println(msg);
                }
                %>
                </span>
 	       </fieldset>
</form>

</body>
</html>