<%@page import="model.StuRN"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="./GroupAllotment.jsp"></jsp:include>
<center>
<h1>List of <%=(String)session.getAttribute("course") %> --- <%=session.getAttribute("sess") %>Students</h1><br>

<form action="./cg" method="post">
<table border=2>
<tr><th>SERIAL NUMBER</th><th>ROLL_NUMBER</th><th>NAME OF STUDENT</th><th>Select FIELD</th></tr>
<%
	ArrayList<StuRN>  al=(ArrayList<StuRN>)session.getAttribute("list");
    
			for(int i=0;i<al.size();i++)
			{
				
				StuRN st=al.get(i);
				%>
				

<tr><td><%=(i+1)%></td><td><%=st.getRno() %></td><td><%=st.getName() %></td><td><input type="checkbox"  name="c1" value="<%=(i)%>"/></td></tr>
<%
			}
%>
</table>
<input type="submit"  value="submit">
</form>
</center>