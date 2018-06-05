package com.vedisoft.danishhousing.servlets.models;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.config.GeneratePdf;
import com.vedisoft.danishhousing.daos.AccountDao;
import com.vedisoft.danishhousing.daos.TransactionRecordsDao;
import com.vedisoft.danishhousing.daos.UtilityDao;
import com.vedisoft.danishhousing.pojos.Account;
import com.vedisoft.danishhousing.pojos.CashBankBookDto;
import com.vedisoft.danishhousing.pojos.DailyTransactionDto;
import com.vedisoft.danishhousing.pojos.TransactionRecords;
import com.vedisoft.danishhousing.pojos.TrialBalanceDto;



/**
 * Servlet implementation class CashBankBookReport
 */
@WebServlet("/admin/pages/CashBankBookReportController")
public class CashBankBookReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CashBankBookReportController() {
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
		String op = new String();
		int msg = 2;
		String page = "/pages/admin/CashBankBookReport.jsp";
		String page1 = "/pages/admin/PrintCashBankBookReport.jsp";
		if (request.getParameter("operation") != null && request.getParameter("operation").trim().length

		() > 0) {
			request.setAttribute("msg", msg);
			op = request.getParameter("operation");
		}
		int pageNo =UtilityDao.startingPageNo();
		if (request.getParameter("pageNo") != null && request.getParameter("pageNo").trim

				().length() > 0) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
				}
		Date date1 = null;
		if (request.getParameter("openingDate") != null && request.getParameter("openingDate").trim

		().length() > 0) {
			date1 = DateUtils.convertDate(request.getParameter("openingDate"));
		}

		Date date2 = null;
		if (request.getParameter("closingDate") != null && request.getParameter("closingDate").trim

		().length() > 0) {
			date2 = DateUtils.convertDate(request.getParameter("closingDate"));
		}


//		//Account a = new AccountDao().findByBankCode(bkCode);

		HashMap<String, String> accounts = new AccountDao().findAllBankNameInitialInMap();
		request.setAttribute("accounts", accounts);

		if (op.equals("create")) {

			
			request.setAttribute("pageNo", pageNo);
			double totalCredit = 0;
			double totalDebit = 0;
			request.setAttribute("date1", DateUtils.dateFormat(date1));
			request.setAttribute("date2", DateUtils.dateFormat(date2));
			ArrayList<CashBankBookDto> transactionList = new TransactionRecordsDao().findCashBankBookRecord(date1,
					date2);
			for (CashBankBookDto t : transactionList)
				System.out.println(t);
			ArrayList<DailyTransactionDto> dailyTranList = new ArrayList<DailyTransactionDto>();
			ArrayList<CashBankBookDto> tranList = new ArrayList<CashBankBookDto>();
			Date curDate = date1;
			for (CashBankBookDto t : transactionList) {
				if (t.getDocDate().after(curDate)) {
					DailyTransactionDto dailyRecord = new DailyTransactionDto();
					ArrayList<CashBankBookDto> tempTranList = new ArrayList<CashBankBookDto>(tranList);
					dailyRecord.setDailyTransaction(tempTranList);
					dailyRecord.setOpeningBalance(
							new AccountDao().findAllBankBalanceByDateWithShortName(DateUtils.getPreviousDate(curDate), "opBal"));
					dailyRecord.setClosingBalance(new AccountDao().findAllBankBalanceByDateWithShortName(curDate, "clsBal"));
					dailyRecord.setCurrDate(curDate);
					dailyTranList.add(dailyRecord);
					tranList.clear();
					curDate = t.getDocDate();
					System.out.println(tempTranList);
				}
				tranList.add(t);
				if(t.getDocType()!=null){
				if (t.getDocType().equals("D"))
					totalCredit += t.getAdjustment();
				if (t.getDocType().equals("W"))
					totalDebit += t.getAdjustment();
				}
				if (transactionList.indexOf(t) == (transactionList.size() - 1)) {
					DailyTransactionDto dailyRecord = new DailyTransactionDto();
					ArrayList<CashBankBookDto> tempTranList = new ArrayList<CashBankBookDto>(tranList);
					dailyRecord.setDailyTransaction(tempTranList);
					dailyRecord.setOpeningBalance(new AccountDao()
							.findAllBankBalanceByDateWithShortName(DateUtils.getPreviousDate(curDate), "opBal"));
					dailyRecord.setClosingBalance(
							new AccountDao().findAllBankBalanceByDateWithShortName(curDate, "clsBal"));
					dailyRecord.setCurrDate(curDate);
					dailyRecord.setTotalPay(totalDebit);
					dailyRecord.setTotalRec(totalCredit);
					dailyTranList.add(dailyRecord);
				}
			}


			RequestDispatcher rd;
			if (transactionList.size() > 0) {
				request.setAttribute("dailyTranList", dailyTranList);
				request.setAttribute("msg", 1);
				 rd = request.getRequestDispatcher(page1);
			} else{
				request.setAttribute("msg", 2);
			 rd = request.getRequestDispatcher(page);
			}
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}

	}

}
