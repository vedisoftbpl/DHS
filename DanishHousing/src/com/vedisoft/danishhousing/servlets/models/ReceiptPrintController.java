package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.daos.ProjectsDao;
import com.vedisoft.danishhousing.daos.ReceiptDao;

import com.vedisoft.danishhousing.pojos.ReceiptRecord;

/**
 * Servlet implementation class ReceiptPrintController
 */
@WebServlet("/admin/pages/ReceiptPrintController")
public class ReceiptPrintController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReceiptPrintController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int docNo = 0;

		ReceiptDao receiptDao = new ReceiptDao();
		ArrayList<ReceiptRecord> list = new ArrayList<ReceiptRecord>();
		for (ReceiptRecord r : list)
			System.out.println(r);
		if (request.getParameter("docNo") != null && ((String) request.getParameter("docNo")).trim().length() > 0) {
			System.out.println(request.getParameter("docNo"));
			docNo = Integer.parseInt((String) request.getParameter("docNo"));
		}

		if (docNo > 0) {
			System.out.println("Receipt printed of receipt no : " + docNo);
			list = receiptDao.findReceiptRecords(docNo);
			ReceiptRecord r = list.get(0);
			int recno = r.getReceno();
			Date recDt = r.getRecDte();
			String[] rDetails = new String[7];
			rDetails[0] = r.getPrefix();
			rDetails[1] = r.getMembNme();
			rDetails[2] = r.getfHNme();
			rDetails[3] = r.getMad1();
			rDetails[4] = r.getMad2();
			rDetails[5] = r.getMad3();

			double totalAmt = 0.0;
			if (r.getBalChq() != 0) {
				for (ReceiptRecord rc : list)
					totalAmt = totalAmt + rc.getBalChq();
			} else {
				for (ReceiptRecord rc : list)
					totalAmt = totalAmt + rc.getAmount();
			}

			System.out.println("totalAmt " + totalAmt);
			String dC = new String();
			String chqNo = new String();
			String branch = new String();
			String bCity = new String();
			if (r.getdC() != null)
				dC = r.getdC();
			if (r.getcDd() != null)
				chqNo = r.getcDd();
			if (r.getBranch() != null)
				branch = r.getBranch();
			if (r.getCity() != null)
				bCity = r.getCity();
			if (r.getdC().equals("Transfer"))
				rDetails[6] = dC;
			else if (r.getdC().equals("Cash"))
				rDetails[6] = dC;
			else
				rDetails[6] = dC + " " + chqNo + " " + " Dated : " + DateUtils.dateFormat(r.getcDdte()) + " " + branch
						+ " " + bCity;

			String projectName = new String();
			ProjectsDao projectDao = new ProjectsDao();
			if (projectDao.find(list.get(0).getProjCd()).getProjectName() != null
					&& projectDao.find(list.get(0).getProjCd()).getProjectName().trim().length() > 0) {
				projectName = projectDao.find(list.get(0).getProjCd()).getProjectName();
			}

			request.setAttribute("totalAmt", totalAmt);
			request.setAttribute("projectName", projectName);
			request.setAttribute("receiptNo", recno);
			request.setAttribute("receiptDt", recDt);
			request.setAttribute("rdetails", rDetails);
			request.setAttribute("receiptList", list);
		}

		String page = "/pages/admin/ReceiptPrint.jsp";
		String page1 = "/pages/admin/DuplicateReceiptForm.jsp";
		if (docNo > 0) {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher(page1);
			rd.forward(request, response);
		}

	}

}
