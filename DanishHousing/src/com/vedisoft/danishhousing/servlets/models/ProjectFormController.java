package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.daos.ProjectsDao;
import com.vedisoft.danishhousing.pojos.Projects;

/**
 * Servlet implementation class ProjectFormController
 */
@WebServlet("/admin/pages/ProjectFormController")
public class ProjectFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String projectName = new String();
		if(request.getParameter("ProjectName") != null && request.getParameter("ProjectName").trim().length() > 0) {
			projectName = request.getParameter("ProjectName");
		}
		
		String operation = new String();
		if(request.getParameter("operation") != null && request.getParameter("operation").trim().length() > 0) {
			operation = request.getParameter("operation");
		}
		
		char projType = ' ';
		if(request.getParameter("ProjectType") != null && request.getParameter("ProjectType").trim().length() > 0)
			projType =  request.getParameter("ProjectType").charAt(0);
		
		System.out.println(projectName + " " + projType);
		
		String page = "/pages/admin/ProjectForm.jsp";
		
		if(operation.equals("create")){
			ProjectsDao dao = new ProjectsDao();
			Projects p = new Projects(projectName, projType);
			System.out.println(p);
			int a = 0;
			a = dao.create(p);
			if(a > 0)
				response.sendRedirect("/DanishHousing" + page + "?msg=1");
			else
				response.sendRedirect("/DanishHousing" + page + "?msg=2");
			//RequestDispatcher rd = request.getRequestDispatcher(page);
			//rd.forward(request, response);
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		
		
	}

}
