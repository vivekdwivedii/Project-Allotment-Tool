

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Model1;
import model.StuRN1;


public class ProjectAllotment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String c=request.getParameter("course");
		int s=Integer.parseInt(request.getParameter("session"));
		HttpSession hs=request.getSession();
		hs.setAttribute("course",c);
		hs.setAttribute("session",s);
		Model1 m=new Model1();
	ArrayList<StuRN1> al=m.getPGData(c, s);
	if(al!=null && al.size()>0)
	{
	
				hs.setAttribute("list", al);
				response.sendRedirect("./showPAllot.jsp");
	}
	else
	{
		response.sendRedirect("./failPAllot.jsp");
	}
}

}
