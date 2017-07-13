package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.daos.ProjectsDao;
import com.vedisoft.danishhousing.pojos.ProjectTypeEnum;
import com.vedisoft.danishhousing.pojos.Projects;

/**
 * Servlet implementation class ProjectTableController
 */
@WebServlet("/admin/pages/ProjectTableController")
public class ProjectTableController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectTableController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProjectsDao dao = new ProjectsDao();
		ArrayList<Projects> projects = dao.findAll();
		System.out.println("Size : " + projects.size());
		request.setAttribute("projectList", projects);
		String page = "/pages/admin/ProjectTable.jsp";
		request.setAttribute("enumList", ProjectTypeEnum.values());
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
