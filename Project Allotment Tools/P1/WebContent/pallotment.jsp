<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Group Allotment</title>
<link href="PAll.css" rel="stylesheet" type="text/css">
</head>

<body>
<button class="button button2" onclick="window.location.href='Login.jsp'">SignOut</button>
<center>

<form action="./projectAllot">
<fieldset style="">
<legend style="color:#FFFFFF;font-size:20px"><b>Project Allotment</b></legend>

<label for="fname" style="margin-left:-70px;margin-right:220px">Course</label>&nbsp;&nbsp;
   <br> <select name="course">
 	<option value="BCA">B.C.A</option>
 	<option value="MCA">M.C.A</option>
  </select>
  <br>
  <br>

   <label for="fname" style="margin-left:-70px;margin-right:220px">Session:</label>&nbsp;
  	<select name="session">
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

<input type="submit" name="Submitt" value="Submitt">
</fieldset>
</form>
</center>
</body>
</html>
