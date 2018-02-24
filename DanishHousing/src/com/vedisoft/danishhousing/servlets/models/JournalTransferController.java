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
import com.vedisoft.danishhousing.daos.AccountMasterDao;
import com.vedisoft.danishhousing.daos.ChequePaymentDao;
import com.vedisoft.danishhousing.daos.UtilityDao;
import com.vedisoft.danishhousing.pojos.AccountMaster;
import com.vedisoft.danishhousing.pojos.TransactionRecords;
import com.vedisoft.danishhousing.pojos.Users;

/**
 * Servlet implementation class JournalTransferController
 */
@WebServlet("/admin/pages/JournalTransferController")
public class JournalTransferController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JournalTransferController() {
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
		
		int msg = 2, flag = 3;
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

		int totalAccounts = 0;
		if (request.getParameter("totalAccounts") != null
				&& request.getParameter("totalAccounts").trim().length() > 0) {
			totalAccounts = Integer.parseInt(request.getParameter("totalAccounts"));
		}

		String remark = new String();
		if (request.getParameter("remark") != null && request.getParameter("remark").trim().length() > 0) {
			remark = request.getParameter("remark");
		}
		
		String op = new String();
		if (request.getParameter("operation") != null && request.getParameter("operation").trim().length() > 0) {
			op = request.getParameter("operation");
		}
		
		String page = "/pages/admin/JournalTransfer.jsp";
		int k = 0;
		HttpSession se = request.getSession();
		se.setAttribute("accList", new AccountDao().findAllBalance());
		
		if (op.equals("create")) {

			int d = 1;
			for (int i = 0; i < totalAccounts; i++) {
				int j = i + 1;
				String accountCode = new String();
				if (request.getParameter("accountCode" + j) != null
						&& request.getParameter("accountCode" + j).trim().length() > 0) {
					accountCode = request.getParameter("accountCode" + j);
				}

				int  partyCode = 0;
				if (request.getParameter("partyCode" + j) != null
						&& request.getParameter("partyCode" + j).trim().length() > 0) {
					partyCode = Integer.parseInt(request.getParameter("partyCode" + j));
				}
				
				AccountMaster acc = new AccountMasterDao().findByCode(accountCode);

				Double credit = 0.0;
				if (request.getParameter("credit" + j) != null
						&& request.getParameter("credit" + j).trim().length() > 0) {
					credit = Double.parseDouble(request.getParameter("credit" + j));
				}

				Double debit = 0.0;
				if (request.getParameter("debit" + j) != null
						&& request.getParameter("debit" + j).trim().length() > 0) {
					debit = Double.parseDouble(request.getParameter("debit" + j));
				}

				
				Users u = (Users) se.getAttribute("userLogin");
				Date d1 = null;

				if (accountCode != null && accountCode.trim().length() > 0) {
					System.out.println("Payment For Master Account : " + accountCode + " : " + d);
					if(credit > 0){
						TransactionRecords t = new TransactionRecords(voucherNo, d, voucherDate, "D", accountCode,
								" ", " ", null, " ", 0, credit, remark,partyCode, flag, voucherNo,
								0, u.getUserId(), new Date());
						k = new ChequePaymentDao().create(t);
						if (k <= 0) {
							break;
						} else
							d++;
						
					}
					if(debit > 0){
						TransactionRecords t = new TransactionRecords(voucherNo, d, voucherDate, "W", accountCode,
								" ", " ", null, " ", 0, credit, remark,partyCode, flag, voucherNo,
								0, u.getUserId(), new Date());
						k = new ChequePaymentDao().create(t);
						if (k <= 0) {
							break;
						} else
							d++;

					}
					
						
				}

			}
			if (k > 0){
				msg = 1;
				qu.append("docNo="+voucherNo+"&");
			}
			qu.append("voucherNo="+UtilityDao.maxVoucherNo(new Date())+"&");
			
			qu.append("today="+DateUtils.dateFormat(new java.util.Date())+"&");
			qu.append("msg="+msg);
			response.sendRedirect("/DanishHousing"+page+qu);	
		} else {
			qu.append("voucherNo="+UtilityDao.maxVoucherNo(new Date())+"&");
			
			qu.append("today="+DateUtils.dateFormat(new java.util.Date()));
			response.sendRedirect("/DanishHousing"+page+qu);
		}

		
		
	}

}
