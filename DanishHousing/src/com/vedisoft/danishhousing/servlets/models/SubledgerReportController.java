package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.daos.MembersDao;
import com.vedisoft.danishhousing.daos.SupplierDao;
import com.vedisoft.danishhousing.daos.TransactionRecordsDao;
import com.vedisoft.danishhousing.pojos.Members;
import com.vedisoft.danishhousing.pojos.MonthlyTransactionReportDto;
import com.vedisoft.danishhousing.pojos.Supplier;
import com.vedisoft.danishhousing.pojos.TransactionRecords;
import com.vedisoft.danishhousing.pojos.TransactionReportDto;

/**
 * Servlet implementation class SubledgerReportController
 */
@WebServlet("/admin/pages/SubledgerReportController")
public class SubledgerReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SubledgerReportController() {
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

		String op = new String();
		int msg = 2;
		String page = "/pages/admin/SubledgerReport.jsp";

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

		int partyCode = 0;
		if (request.getParameter("partyCode") != null && request.getParameter("partyCode").trim().length() > 0) {
			partyCode = Integer.parseInt(request.getParameter("partyCode"));
		}
		Supplier s = new SupplierDao().find(partyCode);
		if (op.equals("create")) {
			double totalCredit = 0;
			double totalDebit = 0;
			request.setAttribute("date1", DateUtils.dateFormat(date1));
			request.setAttribute("date2", DateUtils.dateFormat(date2));
			request.setAttribute("partyCode", partyCode);
			request.setAttribute("partyName", s.getSupplName());
			ArrayList<TransactionRecords> list = new TransactionRecordsDao().findDateTransactionRecord(date1, date2,
					partyCode);
			ArrayList<TransactionReportDto> dto = new ArrayList<TransactionReportDto>();
			for (TransactionRecords t : list) {
				System.out.println(t);
			}
			for (TransactionRecords t : list) {
				double credit = 0;
				double debit = 0;
				String mode = new String();
				String particular = new String();
				Members m=new Members();
				if(t.getMembNo() != 0)
					 m = new MembersDao().find(t.getMembNo());
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
				 System.out.println("Trep");
				 System.out.println(report);
				totalCredit += credit;
				totalDebit += debit;
				dto.add(report);

			}
			for(TransactionReportDto tdto:dto)
				System.out.println(tdto);
			double balance = totalCredit - totalDebit;
			if (list.size() > 0) {
				request.setAttribute("transactionList", dto);
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
