

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Model;


@WebServlet("/AdminP")
public class AdminP extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Model obj=new Model();
		String name,pass;
		name=request.getParameter("UserName");
		pass=request.getParameter("Password");
		
		boolean c=obj.login(name, pass);
		
		if(c==true)
		response.sendRedirect("./admin.jsp");
		else
		response.sendRedirect("./fail.jsp");
		
		
	}

}
