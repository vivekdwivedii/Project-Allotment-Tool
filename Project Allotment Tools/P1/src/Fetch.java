

import java.io.IOException;
import java.util.ArrayList;




import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Model;
import model.StuRN;



public class Fetch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	@SuppressWarnings("unused")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		int s=Integer.parseInt(req.getParameter("Session"));
		String c=req.getParameter("Course");
			
		Model m=new Model();
		ArrayList<StuRN> arl=m.getSelectedData(c, s);
		
		int size=arl.size();
		
		if(size!=0)
		{
		
		
		
			HttpSession hs=req.getSession();
			hs.setAttribute("list",arl);
			hs.setAttribute("course", c);
			hs.setAttribute("sess",s);
			resp.sendRedirect("./dispS.jsp");
			
		}
		else
			resp.sendRedirect("./fetchfail.jsp");
	}

}
