package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.daos.AccountMasterDao;
import com.vedisoft.danishhousing.daos.MembersDao;
import com.vedisoft.danishhousing.daos.ReceiptDao;
import com.vedisoft.danishhousing.daos.TransactionRecordsDao;
import com.vedisoft.danishhousing.pojos.AccountMaster;
import com.vedisoft.danishhousing.pojos.Members;
import com.vedisoft.danishhousing.pojos.MonthlyTransactionReportDto;
import com.vedisoft.danishhousing.pojos.ReceiptRecord;
import com.vedisoft.danishhousing.pojos.TransactionRecords;
import com.vedisoft.danishhousing.pojos.TransactionReportDto;

/**
 * Servlet implementation class TransactionReportController
 */
@WebServlet("/admin/pages/TransactionReportController")
public class TransactionReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TransactionReportController() {
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
		String page = "/pages/admin/TransactionReport.jsp";

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

		String accCode = new String();
		if (request.getParameter("accountCode") != null && request.getParameter("accountCode").trim().length() > 0) {
			accCode = request.getParameter("accountCode");
		}

		AccountMaster a = AccountMasterDao.findByCode(accCode);

		if (op.equals("create")) {
			double totalCredit = 0;
			double totalDebit = 0;
			double monthlyCredit = 0;
			double monthlyDebit = 0;
			request.setAttribute("date1", DateUtils.dateFormat(date1));
			request.setAttribute("date2", DateUtils.dateFormat(date2));
			request.setAttribute("accCode", accCode);
			request.setAttribute("accName", a.getAcName());
			ArrayList<TransactionRecords> list = new TransactionRecordsDao().findDateTransactionRecord(date1, date2,
					accCode);
			ArrayList<TransactionReportDto> dto = new ArrayList<TransactionReportDto>();
			ArrayList<MonthlyTransactionReportDto> mdto = new ArrayList<MonthlyTransactionReportDto>();
			Date date=new Date();
			if (!list.isEmpty())
				date = list.get(0).getDocDte();
			LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			int month = localDate.getMonthValue();
			int counter = 0;
			// System.out.println("Month : "+month);
			for (TransactionRecords t : list) {
				Date d1 = t.getDocDte();
				LocalDate ld1 = d1.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
				int tempMonth1 = ld1.getMonthValue();
				if (tempMonth1 != month) {
					counter++;
					month = tempMonth1;
				}
			}
			month = localDate.getMonthValue();
			int i = 0;
			for (TransactionRecords t : list) {
				double credit = 0;
				double debit = 0;
				String mode = new String();
				String particular = new String();
				Members m = new MembersDao().find(t.getMembNo());
				Date d = t.getDocDte();
				LocalDate ld = d.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
				int tempMonth = ld.getMonthValue();
				// System.out.println("Temp Month : "+tempMonth);
				if (tempMonth != month) {
					ArrayList<TransactionReportDto> tempdto = new ArrayList<TransactionReportDto>();
					for (TransactionReportDto rep : dto) {
						// System.out.println(rep);
						tempdto.add(rep);
					}
					MonthlyTransactionReportDto mReport = new MonthlyTransactionReportDto(tempdto, monthlyDebit,
							monthlyCredit, monthlyCredit - monthlyDebit);
					// System.out.println("Mrep");
					// System.out.println(mReport);
					mdto.add(mReport);
					// for(MonthlyTransactionReportDto rep:mdto){
					// System.out.println(rep);
					// }
					dto.clear();
					// for(MonthlyTransactionReportDto rep:mdto){
					// System.out.println(rep);
					// }
					// for(TransactionReportDto rep:dto){
					// System.out.println(rep);
					// }
					month = tempMonth;
					// System.out.println("Month : "+month);
					i++;
				}
				if (t.getDocType().equals("D")) {

					if (t.getFlag() == 2) {
						if (t.getMembNo() != 0)
							particular = t.getParti() + " - " + m.getPrefix() + " " + m.getMemName() + ", Memb. No. : "
									+ t.getMembNo() + " Chq. No. :" + t.getChqNo();
						else
							particular = t.getParti() + " Chq. No. :" + t.getChqNo();
					} else {
						if (t.getMembNo() != 0)
							particular = t.getParti() + " - " + m.getPrefix() + " " + m.getMemName() + ", Memb. No. : "
									+ t.getMembNo();
						else
							particular = t.getParti();
					}
					credit = t.getAmt();
				} else if (t.getDocType().equals("W")) {
					if (t.getFlag() == 2) {
						if (t.getMembNo() != 0)
							particular = t.getParti() + " - " + m.getPrefix() + " " + m.getMemName() + ", Memb. No. : "
									+ t.getMembNo() + " Chq. No. :" + t.getChqNo();
						else
							particular = t.getParti() + " Chq. No. :" + t.getChqNo();
					} else {
						if (t.getMembNo() != 0)
							particular = t.getParti() + " - " + m.getPrefix() + " " + m.getMemName() + ", Memb. No. : "
									+ t.getMembNo();
						else
							particular = t.getParti();
					}
					debit = t.getAmt();
				}
				if (t.getFlag() == 1)
					mode = "Cash";
				else if (t.getFlag() == 2)
					mode = "Bank";
				else if (t.getFlag() == 3)
					mode = "Transfer";

				TransactionReportDto report = new TransactionReportDto(t.getDocNo(), t.getDocDte(), particular, mode,
						credit, debit);
				// System.out.println("Trep");
				// System.out.println(report);
				totalCredit += credit;
				monthlyCredit += credit;
				totalDebit += debit;
				monthlyDebit += debit;
				dto.add(report);

			}
			if (i == counter) {
				ArrayList<TransactionReportDto> tempdto = new ArrayList<TransactionReportDto>();
				for (TransactionReportDto rep : dto) {
					// System.out.println(rep);
					tempdto.add(rep);
				}
				MonthlyTransactionReportDto mReport = new MonthlyTransactionReportDto(tempdto, monthlyDebit,
						monthlyCredit, monthlyCredit - monthlyDebit);
				// System.out.println("Mrep");
				// System.out.println(mReport);
				mdto.add(mReport);
			}
			// for(MonthlyTransactionReportDto rep:mdto){
			// System.out.println(rep);
			// }

			double balance = totalCredit - totalDebit;
			if (list.size() > 0) {
				request.setAttribute("transactionList", mdto);
				request.setAttribute("totalCreditAmount", totalCredit);
				request.setAttribute("totalDebitAmount", totalDebit);
				request.setAttribute("balanceAmount", balance);
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
