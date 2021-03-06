package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.daos.ProjectsDao;
import com.vedisoft.danishhousing.pojos.ProjectTypeEnum;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = 0;
		if (request.getParameter("showId") != null && request.getParameter("showId").trim().length() > 0) {
			id = Integer.parseInt(request.getParameter("showId"));
		}

		String projectName = new String();
		if (request.getParameter("ProjectName") != null && request.getParameter("ProjectName").trim().length() > 0) {
			projectName = request.getParameter("ProjectName");
		}

		String operation = new String();
		if (request.getParameter("operation") != null && request.getParameter("operation").trim().length() > 0) {
			operation = request.getParameter("operation");
		}

		String projType = new String();
		if (request.getParameter("ProjectType") != null && request.getParameter("ProjectType").trim().length() > 0)
			projType = request.getParameter("ProjectType");
		
		String pad1 = new String();
		if (request.getParameter("projectAddress3") != null && request.getParameter("projectAddress3").trim().length() > 0)
			pad1 = request.getParameter("projectAddress3");
		
		String pad2 = new String();
		if (request.getParameter("projectAddress3") != null && request.getParameter("projectAddress3").trim().length() > 0)
			pad2 = request.getParameter("projectAddress3");
		
		String pad3 = new String();
		if (request.getParameter("projectAddress3") != null && request.getParameter("projectAddress3").trim().length() > 0)
			pad3 = request.getParameter("projectAddress3");
		
		Date opdte = null;
		if (request.getParameter("opDte") != null && request.getParameter("opDte").trim().length() > 0) {
			opdte = DateUtils.convertDate(request.getParameter("opDte"));
		}

		System.out.println(projectName + " " + projType);

		String page = "/pages/admin/ProjectForm.jsp";
		String page1 = "/pages/admin/ProjectViewForm.jsp";
		String page2 ="ProjectTableController";

		request.setAttribute("enumList", ProjectTypeEnum.values());

		if (operation.equals("create")) {
			ProjectsDao dao = new ProjectsDao();
			Projects p = new Projects(projectName, projType,opdte,pad1,pad2,pad3);
			System.out.println(p);
			int a = 0;
			a = dao.create(p);
			if (a > 0) {
				RequestDispatcher rd = request.getRequestDispatcher(page);
				request.setAttribute("msg", 1);
				rd.forward(request, response);

			} else {
				RequestDispatcher rd = request.getRequestDispatcher(page);
				request.setAttribute("msg", 2);
				rd.forward(request, response);
			}
		} else if (operation.equals("show")) {
			ProjectsDao dao = new ProjectsDao();
			Projects p = new Projects();
			p = dao.find(id);
			request.setAttribute("project", p);
			RequestDispatcher rd = request.getRequestDispatcher(page1);
			rd.forward(request, response);
		} else if (operation.equals("edit")) {
			ProjectsDao dao = new ProjectsDao();
			Projects p = new Projects(id, projectName, projType,opdte,pad1,pad2,pad3);
			System.out.println(p);
			Boolean b = dao.edit(p);
			if (b) {
				RequestDispatcher rd = request.getRequestDispatcher(page2);
				request.setAttribute("msg", "1");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher(page2);
				request.setAttribute("msg", "2");
				rd.forward(request, response);
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}

	}

}
