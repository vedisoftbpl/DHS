package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.daos.AccountDao;
import com.vedisoft.danishhousing.daos.AccountMasterDao;
import com.vedisoft.danishhousing.daos.MembersDao;
import com.vedisoft.danishhousing.daos.TransactionRecordsDao;
import com.vedisoft.danishhousing.pojos.Account;
import com.vedisoft.danishhousing.pojos.AccountMaster;
import com.vedisoft.danishhousing.pojos.CashBankBookDto;
import com.vedisoft.danishhousing.pojos.Members;
import com.vedisoft.danishhousing.pojos.TransactionRecords;
import com.vedisoft.danishhousing.pojos.TransactionReportDto;

/**
 * Servlet implementation class BankCashReportController
 */
@WebServlet("admin/pages/BankCashReportController")
public class BankCashReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BankCashReportController() {
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

		String op = new String();
		int msg = 2;
		String page = "/pages/admin/CashBankBookReport.jsp";

		if (request.getParameter("operation") != null && request.getParameter("operation").trim().length() > 0) {
			request.setAttribute("msg", msg);
			op = request.getParameter("operation");
		}

		Date date1 = null;
		if (request.getParameter("openingDate") != null && request.getParameter("openingDate").trim().length() > 0) {
			date1 = DateUtils.convertDate(request.getParameter("openingDate"));
		}

		Date date2 = null;
		if (request.getParameter("closingDate") != null && request.getParameter("closingDate").trim().length() > 0) {
			date2 = DateUtils.convertDate(request.getParameter("closingDate"));
		}

		String bkCode = new String();
		if (request.getParameter("bkCode") != null && request.getParameter("bkCode").trim().length() > 0) {
			bkCode = request.getParameter("bkCode");
		}

		Account a = new AccountDao().findByBankCode(bkCode);
		double opBal = TransactionRecordsDao.bankOpeningBalance(DateUtils.getPreviousDate(date1), bkCode);
		
		HashMap<String, String> accounts = new AccountDao().findAllInMap();
		request.setAttribute("accounts", accounts);

		if (op.equals("create")) {
			double totalCredit = 0;
			double totalDebit = 0;
			request.setAttribute("date1", DateUtils.dateFormat(date1));
			request.setAttribute("date2", DateUtils.dateFormat(date2));
			request.setAttribute("bkCode", bkCode);
			request.setAttribute("bkName", a.getBkName());
			ArrayList<CashBankBookDto> creditlist = new TransactionRecordsDao().findCashBankBookDtoReceipt(date1, date2, bkCode);
			ArrayList<CashBankBookDto> debitlist = new TransactionRecordsDao().findCashBankBookDtoPayment(date1, date2, bkCode);
			for (CashBankBookDto t : creditlist) {
				totalCredit += t.getAmount();
			}
			for (CashBankBookDto t : debitlist) {
				totalCredit += t.getAmount();
			}
			if (creditlist.size() > 0 || debitlist.size() > 0) {
				request.setAttribute("creditList", creditlist);
				request.setAttribute("debitList", debitlist);
				request.setAttribute("totalCreditAmount", totalCredit);
				request.setAttribute("totalDebitAmount", totalDebit);
				request.setAttribute("openongBalance", opBal);
				request.setAttribute("closingBalance", opBal + totalCredit - totalDebit);
				request.setAttribute("msg", 1);
				
			} else
				request.setAttribute("msg", 2);

			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}

	}

}
