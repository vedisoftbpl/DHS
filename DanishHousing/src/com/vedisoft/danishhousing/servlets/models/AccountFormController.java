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
import com.vedisoft.danishhousing.daos.AccountDao;
import com.vedisoft.danishhousing.daos.ProjectsDao;
import com.vedisoft.danishhousing.pojos.Account;
import com.vedisoft.danishhousing.pojos.Projects;

/**
 * Servlet implementation class AccountFormController
 */
@WebServlet("/admin/pages/AccountFormController")
public class AccountFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AccountFormController() {
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
		
		String bankName = new String();
		if(request.getParameter("bankName")!= null && request.getParameter("bankName").trim().length() > 0) {
			bankName = request.getParameter("bankName");
		}
		
		String bankCode = new String();
		if(request.getParameter("bankCode")!= null && request.getParameter("bankCode").trim().length() > 0) {
			bankCode = request.getParameter("bankCode");
		}
						
		String ifscCode = new String();
		if(request.getParameter("ifscCode")!= null && request.getParameter("ifscCode").trim().length() > 0) {
			ifscCode = request.getParameter("ifscCode");
		}
		
		String branch = new String();
		if(request.getParameter("branch")!= null && request.getParameter("branch").trim().length() > 0) {
			branch = request.getParameter("branch");
		}
		
		double openingBalance = 0;
		if (request.getParameter("openingBalance") != null && request.getParameter("openingBalance").trim().length() > 0) {
			openingBalance = Integer.parseInt(request.getParameter("openingBalance"));
		}
						
		String coCode = new String();
		if(request.getParameter("coCode")!= null && request.getParameter("coCode").trim().length() > 0) {
			coCode = request.getParameter("coCode");
		}

		Date d = new Date();
		if (request.getParameter("datepicker") != null && request.getParameter("datepicker").trim().length() > 0) {
			d = DateUtils.convertDate(request.getParameter("datepicker"));
			//System.out.println(request.getParameter("datepicker"));
		}
		
		String operation = new String();
		if(request.getParameter("operation")!= null && request.getParameter("operation").trim().length() > 0) {
			operation = request.getParameter("operation");
		}
		
		double receipt = 0;
		double payment = 0;
		double clbal = 0;
		
		String page = "/pages/admin/AccountsForm.jsp";

		if (operation.equals("create")) {
			AccountDao dao = new AccountDao();
			Account a = new Account(coCode, bankCode, bankName, d, openingBalance, receipt, payment, clbal, ifscCode, branch);
			System.out.println(a);
			int k = 0;
			k = dao.create(a);
			if(k > 0)
				response.sendRedirect("/DanishHousing" + page + "?msg=1");
			else
				response.sendRedirect("/DanishHousing" + page + "?msg=2");
			
		} else {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}

	}

}
