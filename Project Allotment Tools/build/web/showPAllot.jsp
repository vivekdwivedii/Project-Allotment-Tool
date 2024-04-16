<%@page import="model.StuRN1"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="./pallotment.jsp"></jsp:include>
<center>
   <h1>Project Group Allotment List of <%=(String)session.getAttribute("course")%>---<%=(Integer)session.getAttribute("session")%></h1>
	<form action="">
	<table border="3">
	<tr>
		<th>GID</th>
		<th>RNO</th>
		<th>NAMES</th>
		<th>Project Title</th>
		</tr>
		
		
<%
	ArrayList<StuRN1> al=(ArrayList<StuRN1>)session.getAttribute("list");   
			for(int i=0;i<al.size();i++)
			{
				
				StuRN1 st=al.get(i);
				%>
				

<tr><td><%=st.getGid()%></td><td><%=st.getRno() %></td><td><%=st.getNames()%></td><td><input type="text"  name="n1"/></td></tr>
<%
			}
%>
</table>
<input type="submit"  value="submit">
</form>
</center>