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
import com.vedisoft.danishhousing.daos.RenumberingDao;

/**
 * Servlet implementation class RenumberingVoucherController
 */
@WebServlet("/admin/pages/RenumberingVoucherController")
public class RenumberingVoucherController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RenumberingVoucherController() {
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
		String page = "/pages/admin/RenumberingVoucher.jsp";
		int msg = 2;

		String op = new String();
		if (request.getParameter("operation") != null && request.getParameter("operation").trim().length() > 0) {
			request.setAttribute("msg", msg);
			op = request.getParameter("operation");
		}
		int startingVoucher = 1;
		if (request.getParameter("voucherNumber") != null && request.getParameter("voucherNumber").trim().length() > 0) {
			startingVoucher = Integer.parseInt(request.getParameter("voucherNumber"));
		}
		
		Date startDate = new Date();
		if (request.getParameter("startDate") != null && request.getParameter("startDate").trim().length() > 0) {
			startDate = DateUtils.convertDate(request.getParameter("startDate"));
		}
		
		Date clsDate = new Date();
		if (request.getParameter("closingDate") != null && request.getParameter("closingDate").trim().length() > 0) {
			clsDate = DateUtils.convertDate(request.getParameter("closingDate"));
		}
		if (op.equals("create")) {
			boolean b=RenumberingDao.renumbering(startingVoucher, startDate, clsDate);
			System.out.println(b);
			if(b)
				msg=1;
			request.setAttribute("msg", msg);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

}
