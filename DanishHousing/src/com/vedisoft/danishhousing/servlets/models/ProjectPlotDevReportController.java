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

/**
 * Servlet implementation class ProjectPlotDevReportController
 */
@WebServlet("/admin/pages/ProjectPlotDevReportController")
public class ProjectPlotDevReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectPlotDevReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = "/pages/admin/ProjectPlotDevReport.jsp";
		int msg = 2;

		String op = new String();
		if (request.getParameter("operation") != null && request.getParameter("operation").trim().length() > 0) {
			request.setAttribute("msg", msg);
			op = request.getParameter("operation");
		}
		int projCd = 0;
		if (request.getParameter("projectCode") != null && request.getParameter("projectCode").trim().length() > 0) {
			projCd = Integer.parseInt(request.getParameter("projectCode"));
		}
		
		Date clsdte = new Date();
		if (request.getParameter("closingDate") != null && request.getParameter("closingDate").trim().length() > 0) {
			clsdte = DateUtils.convertDate(request.getParameter("closingDate"));
		}

		if (op.equals("create")) {
			request.setAttribute("date1", DateUtils.dateFormat(clsdte));
			request.setAttribute("projectName",new ProjectsDao().find(projCd).getProjectName());
			request.setAttribute("projectPlotDevReportList",new ProjectsDao().projectPlotDevReport(projCd, clsdte));
			RequestDispatcher rd = request.getRequestDispatcher(page);
			request.setAttribute("msg", 1);
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

}
