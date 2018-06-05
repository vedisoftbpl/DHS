package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.daos.AccountDao;
import com.vedisoft.danishhousing.daos.ChequePaymentDao;
import com.vedisoft.danishhousing.daos.TransactionRecordsDao;
import com.vedisoft.danishhousing.daos.UtilityDao;
import com.vedisoft.danishhousing.pojos.ChequePayment;
import com.vedisoft.danishhousing.pojos.TransactionRecords;
import com.vedisoft.danishhousing.pojos.Users;

/**
 * Servlet implementation class CashBankAmountTransferController
 */
@WebServlet("/admin/pages/CashBankAmountTransferController")
public class CashBankAmountTransferController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CashBankAmountTransferController() {
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
		int msg = 2;
		StringBuilder qu = new StringBuilder("?");

		int voucherNo = 0;
		if (request.getParameter("voucherNumber") != null
				&& request.getParameter("voucherNumber").trim().length() > 0) {
			voucherNo = Integer.parseInt(request.getParameter("voucherNumber"));
		}

		Date voucherDate = new Date();
		if (request.getParameter("date") != null && request.getParameter("date").trim().length() > 0) {
			voucherDate = DateUtils.convertDate(request.getParameter("date"));
		}

		String bankCodeFrom = new String(); // transaction
		if (request.getParameter("bankCodeFrom") != null && request.getParameter("bankCodeFrom").trim().length() > 0) {
			bankCodeFrom = request.getParameter("bankCodeFrom");
		}

		String bankCodeTo = new String(); // transaction
		if (request.getParameter("bankCodeTo") != null && request.getParameter("bankCodeTo").trim().length() > 0) {
			bankCodeTo = request.getParameter("bankCodeTo");
		}

		String bankName = new String();

		if (request.getParameter("bankName") != null && request.getParameter("bankName").trim().length() > 0) {
			bankName = request.getParameter("bankName");
		}

		int flag = 2;

		String transctionID = new String(); // cheque id cdd
		if (request.getParameter("transactionID") != null
				&& request.getParameter("transactionID").trim().length() > 0) {
			transctionID = request.getParameter("transactionID");
		}

		Date trDate = null;
		if (request.getParameter("trDate") != null && request.getParameter("trDate").trim().length() > 0) {
			trDate = DateUtils.convertDate(request.getParameter("trDate"));
		}

		String op = new String();
		if (request.getParameter("operation") != null && request.getParameter("operation").trim().length() > 0) {
			op = request.getParameter("operation");
		}

		String page = "/pages/admin/CashBankAmountTransfer.jsp";
		boolean k = false;
		HttpSession se = request.getSession();
		se.setAttribute("accList", new AccountDao().findAllBalance());
		if (op.equals("create")) {

			String accountCode = new String();
			if (request.getParameter("accountCode") != null
					&& request.getParameter("accountCode").trim().length() > 0) {
				accountCode = request.getParameter("accountCode");
			}

			String accountName = new String();
			if (request.getParameter("accountName") != null
					&& request.getParameter("accountName").trim().length() > 0) {
				accountName = request.getParameter("accountName");
			}

			Double Amount = 0.0;
			if (request.getParameter("amount") != null && request.getParameter("amount").trim().length() > 0) {
				Amount = Double.parseDouble(request.getParameter("amount"));
			}

			String remarks = new String();
			if (request.getParameter("remarks") != null && request.getParameter("remarks").trim().length() > 0) {
				remarks = request.getParameter("remarks");
			}

			Users u = (Users) se.getAttribute("userLogin");

			if (accountCode != null && accountCode.trim().length() > 0) {
				System.out.println("Payment For Master Account : " + accountCode + " : " + 1);
				if (accountCode.equalsIgnoreCase("B0006") || accountCode.equalsIgnoreCase("I0005")) {

					TransactionRecords t1 = new TransactionRecords(voucherNo, 1, voucherDate, "W", accountCode,
							bankCodeFrom, transctionID, trDate, " ", 0, Amount, remarks, 0, flag, voucherNo, 0,
							u.getUserId(), new Date());
					TransactionRecords t2 = new TransactionRecords(voucherNo, 1, voucherDate, "D", accountCode,
							bankCodeTo, transctionID, trDate, " ", 0, Amount, remarks, 0, flag, voucherNo, 0,
							u.getUserId(), new Date());
					k = new TransactionRecordsDao().create(t1, t2);

				}
				if (k == true) {
					msg = 1;
					qu.append("docNo=" + voucherNo + "&");
				}
				qu.append("voucherNo=" + UtilityDao.maxVoucherNo(new Date()) + "&");

				qu.append("today=" + DateUtils.dateFormat(new java.util.Date()) + "&");
				qu.append("msg=" + msg);
				response.sendRedirect("/DanishHousing" + page + qu);
			}
		} else {
			qu.append("voucherNo=" + UtilityDao.maxVoucherNo(new Date()) + "&");

			qu.append("today=" + DateUtils.dateFormat(new java.util.Date()));
			response.sendRedirect("/DanishHousing" + page + qu);
		}
	}

}
