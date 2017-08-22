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
import com.vedisoft.danishhousing.daos.AccountMasterDao;
import com.vedisoft.danishhousing.daos.ChequePaymentDao;
import com.vedisoft.danishhousing.daos.RefundPaymentDao;
import com.vedisoft.danishhousing.daos.UtilityDao;
import com.vedisoft.danishhousing.pojos.AccountMaster;
import com.vedisoft.danishhousing.pojos.ChequePayment;
import com.vedisoft.danishhousing.pojos.RefundPayment;
import com.vedisoft.danishhousing.pojos.TransactionRecords;
import com.vedisoft.danishhousing.pojos.Users;

/**
 * Servlet implementation class PaymentController
 */
@WebServlet("/admin/pages/PaymentController")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentController() {
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
		int voucherNo = 0;
		if (request.getParameter("voucherNumber") != null
				&& request.getParameter("voucherNumber").trim().length() > 0) {
			voucherNo = Integer.parseInt(request.getParameter("voucherNumber"));
		}

		Date voucherDate = new Date();
		if (request.getParameter("date") != null && request.getParameter("date").trim().length() > 0) {
			voucherDate = DateUtils.convertDate(request.getParameter("date"));
		}

		int totalAccounts = 0;
		if (request.getParameter("totalAccounts") != null
				&& request.getParameter("totalAccounts").trim().length() > 0) {
			totalAccounts = Integer.parseInt(request.getParameter("totalAccounts"));
		}

		String bankCode = new String(); // transaction
		if (request.getParameter("bankCode") != null && request.getParameter("bankCode").trim().length() > 0) {
			bankCode = request.getParameter("bankCode");
		}

		String bankName = new String();
		;
		if (request.getParameter("bankName") != null && request.getParameter("bankName").trim().length() > 0) {
			bankName = request.getParameter("bankName");
		}

		String paymentMode = new String(); // d_c
		if (request.getParameter("paymentMode") != null && request.getParameter("paymentMode").trim().length() > 0) {
			paymentMode = request.getParameter("paymentMode");
		}

		int flag = 2;
		if (paymentMode.trim().equals("Cash")) {
			flag = 1;
		}

		String transctionID = new String(); // cheque id cdd
		if (request.getParameter("transactionID") != null
				&& request.getParameter("transactionID").trim().length() > 0) {
			transctionID = request.getParameter("transactionID");
		}

		double totalAmount = 0.0;
		if (request.getParameter("totalAmount") != null && request.getParameter("totalAmount").trim().length() > 0) {
			totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
		}

		Date trDate = null;
		if (request.getParameter("trDate") != null && request.getParameter("trDate").trim().length() > 0) {
			trDate = DateUtils.convertDate(request.getParameter("trDate"));
		}

		String op = new String();
		if (request.getParameter("operation") != null && request.getParameter("operation").trim().length() > 0) {
			op = request.getParameter("operation");
		}

		String page = "/pages/admin/Payment.jsp";
		int k = 0;
		
		if (op.equals("create")) {

			int d = 1;
			for (int i = 0; i < totalAccounts; i++) {
				int j = i + 1;
				String accountCode = new String();
				if (request.getParameter("accountCode" + j) != null
						&& request.getParameter("accountCode" + j).trim().length() > 0) {
					accountCode = request.getParameter("accountCode" + j);
				}

				AccountMaster acc = new AccountMasterDao().findByCode(accountCode);

				String accountName = new String();
				if (request.getParameter("accountName" + j) != null
						&& request.getParameter("accountName" + j).trim().length() > 0) {
					accountName = request.getParameter("accountName" + j);
				}

				Double Amount = 0.0;
				if (request.getParameter("amount" + j) != null
						&& request.getParameter("amount" + j).trim().length() > 0) {
					Amount = Double.parseDouble(request.getParameter("amount" + j));
				}

				String remarks = new String();
				if (request.getParameter("remarks" + j) != null
						&& request.getParameter("remarks" + j).trim().length() > 0) {
					remarks = request.getParameter("remarks" + j);
				}

				HttpSession se = request.getSession();
				Users u = (Users) se.getAttribute("userLogin");
				Date d1 = null;

				if (accountCode != null && accountCode.trim().length() > 0) {
					System.out.println("Payment For Master Account : " + accountCode + " : " + d);

					if (paymentMode.equals("Cash")) {
						TransactionRecords t = new TransactionRecords(voucherNo, d, voucherDate, "W", accountCode,
								bankCode, transctionID, trDate, " ", 0, Amount, remarks, flag, voucherNo,
								0, u.getUserId(), new Date());
						
						k = new ChequePaymentDao().create(t);
						if (k <= 0) {
							request.setAttribute("msg", 2);
							break;
						} else
							d++;
					} else {
						TransactionRecords t = new TransactionRecords(voucherNo, d, voucherDate, "W", accountCode,
								bankCode, transctionID, trDate, " ", 0, Amount, remarks, flag, voucherNo,
								0, u.getUserId(), new Date());
						ChequePayment ch = new ChequePayment(voucherNo, voucherDate, bankCode, paymentMode,
								transctionID, trDate, Amount, d1);
						k = new ChequePaymentDao().create(t, ch);
						if (k <= 0) {
							request.setAttribute("msg", 2);
							break;
						} else
							d++;

					}

				}

			}
			if (k > 0)
				request.setAttribute("msg", 1);
			else
				request.setAttribute("msg", 2);

			request.setAttribute("accList", new AccountDao().findAll());
			request.setAttribute("voucherNo", UtilityDao.maxVoucherNo());
			request.setAttribute("today", new java.util.Date());
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else {
			request.setAttribute("accList", new AccountDao().findAll());
			request.setAttribute("voucherNo", UtilityDao.maxVoucherNo());
			request.setAttribute("today", new java.util.Date());
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

}
