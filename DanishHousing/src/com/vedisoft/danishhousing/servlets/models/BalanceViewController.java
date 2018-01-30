package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.daos.AccountDao;

/**
 * Servlet implementation class BalanceViewController
 */
@WebServlet("/admin/pages/BalanceViewController")
public class BalanceViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BalanceViewController() {
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
		// TODO Auto-generated method stub
		Date date =new Date() ;
		if (request.getParameter("date") != null && request.getParameter("date").trim().length() > 0) {
			date = DateUtils.convertDate(request.getParameter("date"));
		}
		System.out.println(date);
//		//String operation=new String();
//		if (request.getParameter("opeartion") != null && request.getParameter("opeartion").trim().length() > 0) {
//			operation = request.getParameter("opeartion");
//		}
		HttpSession se = request.getSession();
		se.setAttribute("accList", new AccountDao().findAllBalanceByDate(date));
			String page = "/pages/admin/ViewBankBalance.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		
	}

}
