<%@page import="DB.DBConnection"%>
<!doctype html>
<html>

<meta charset="utf-8">
<title>Form_1</title>

<link href="Adminstyle.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">

<head>
   
</head>

<body ><button class="button button2" onclick="window.location.href='view_stu_cnfm.jsp'">Back</button><center>
    <%
        String name=null;
        String course=null;
        String rolno=null;
        String ssn=null;
        String year=null;
        String sem=null;
        String cont=null;
       // String email=null;
        
        
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
String mail=request.getParameter("id");
DBConnection db=new DBConnection();
db.stmt=db.con.createStatement();
db.rst=db.stmt.executeQuery("select * from student where email='"+mail+"'");
if(db.rst.next())
{
  name=db.rst.getString(2);
  course=db.rst.getString(3);
  rolno=db.rst.getString(4);
  ssn=db.rst.getString(5);
  year=db.rst.getString(6);
  sem=db.rst.getString(7);
  cont=db.rst.getString(8);
}
%>
<br>
<form  action="update_stu" method="post" name="form1" onsubmit="return allLetter();">  
 <fieldset style="width:50% ; ;bottom:400px">
 <legend style="font-size:25px;"><b>Update Student</b></legend>
 <label for="fname" style="float: left" >Name:</label>&nbsp;
 <input type="text" name="name" placeholder="Input User Name" required="required" id="t1" value="<%=name%>">
  <span id="namelocation" style="color:red"></span>
  <br><br>
  <label for="fname"style="float: left" >Course:</label>&nbsp;
  <select name="course"required="required" >
 	<option value=""> <%=course%> </option>
    <option value="BCA">B.C.A</option>
 	<option value="MCA">M.C.A</option>
  </select>
  <br><br>
  <label for="fname" style="float: left" >Roll.No:</label>&nbsp;
  <input type="text" name="rno" placeholder="Input 10 digit Roll.No"required="required" value="<%=rolno%>">
         <br><br>
         <label for="fname" style="float: left">Session:</label>&nbsp;
  	<select name="session" required="required">
            
 	<option value="2017"> <%=ssn%> </option>
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
     <label for="fname" style="float: left">Year:</label>&nbsp;
 <br>	<select name="year" required="required">
     <option><%=year%></option>
 	<option value="second">Second</option>
 	<option value="third">Third</option>
    <br> <br>
      </select>
&nbsp;
<br>
<label for="fname"style="float: left">Semester:</label>&nbsp;&nbsp;
	<select name="sem" required="required">
            <option><%=sem%></option>
    <option value="3">3</option>
	<option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>

</select>
<br>
<br>
<label for="fname" style="float: left">Contact Number:</label>
<input type="number" name="number" placeholder="+91#######" required="required" value="<%=cont%>">
        <br>
        

        <button type="submit" name="Submit" onclick="allLetter(document.form1.name)" value="<%=mail%>" >UPDATE</button><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span style="color:red;"><% String msg=request.getParameter("msg");
                if(msg!=null)
                {
                 out.println(msg);
                }
                %>
                </span>
 	       </fieldset>
</form>
</center>
</body>
</html>