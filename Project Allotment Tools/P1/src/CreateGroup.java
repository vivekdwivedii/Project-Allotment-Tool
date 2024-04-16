

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Model;
import model.StuRN;



public class CreateGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String ind[]=request.getParameterValues("c1");
		HttpSession hs=request.getSession();
		ArrayList<StuRN>  al=(ArrayList<StuRN>)hs.getAttribute("list");
		int j=0;
		if(ind.length<=3 && ind.length!=1)
		{
			ArrayList<StuRN> arr=new ArrayList<StuRN>();
		for(String i:ind)
		{
			
			j=Integer.parseInt(i);
			StuRN st=(StuRN)al.get(j);
			arr.add(st);
			//System.out.println(i+" "+st.getRno()+" "+st.getName()+" "+hs.getAttribute("course")+" "+hs.getAttribute("sess"));
			j++; 
		}
		
		Model m=new Model();

	int allot=m.allotement(arr, (String)hs.getAttribute("course") ,(Integer)hs.getAttribute("sess"), "null", "null");
		if(allot==1)
			{
				
				hs.removeAttribute("list");
				hs.removeAttribute("course");
				hs.removeAttribute("sess");
				response.sendRedirect("./allotmentsuccess.jsp");
			}
		else
		{
			hs.removeAttribute("list");
			hs.removeAttribute("course");
			hs.removeAttribute("sess");
			response.sendRedirect("./allotmentfail.jsp");
		}
		
		
		}
		else
		{
			
			response.sendRedirect("./GroupAllotmentFail.jsp");
		}
	}

}
