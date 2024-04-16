import model.*;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Model;

public class Student_Registraion extends HttpServlet 
{  
  
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String sname,scourse,emal,roll_no,mob_no,sem,year;
    int ses;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		roll_no=request.getParameter("Roll_No");
		sname=request.getParameter("Sname");
		scourse=request.getParameter("Course");
		ses=Integer.parseInt(request.getParameter("Session"));
		year=request.getParameter("year");
		sem=request.getParameter("Semester");
		mob_no=request.getParameter("Mobile_No");
		emal=request.getParameter("Email");
	
		
		
		
		
		Model obj=new Model();
		int i=obj.insert(roll_no,sname,scourse,ses,year,sem,mob_no,emal);
	
		if(i!=0)
			response.sendRedirect("./ssuccess.jsp");
		else
			response.sendRedirect("./sfail.jsp");
		obj.connectionClose();
	}

}
