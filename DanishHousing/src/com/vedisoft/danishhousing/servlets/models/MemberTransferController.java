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
import com.vedisoft.danishhousing.daos.MembersDao;
import com.vedisoft.danishhousing.daos.RefundPaymentDao;
import com.vedisoft.danishhousing.daos.UtilityDao;
import com.vedisoft.danishhousing.pojos.AccountMaster;
import com.vedisoft.danishhousing.pojos.ChequePayment;
import com.vedisoft.danishhousing.pojos.Members;
import com.vedisoft.danishhousing.pojos.RefundPayment;
import com.vedisoft.danishhousing.pojos.TransactionRecords;
import com.vedisoft.danishhousing.pojos.Users;

/**
 * Servlet implementation class MemberTransferController
 */
@WebServlet("/admin/pages/MemberTransferController")
public class MemberTransferController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberTransferController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = 0,msg = 2;
		StringBuilder qu = new StringBuilder("?");

		int memberNo = 0;
		if (request.getParameter("memberID") != null && request.getParameter("memberID").trim().length() > 0) {
			memberNo = Integer.parseInt(request.getParameter("memberID"));
		}

		Members mem = new MembersDao().find(memberNo);

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
		
		String bankCode = new String();
		String bankName = new String();
		String transctionID = new String();
		double totalAmount = 0.0;
		Date trDate = null;
		int flag = 3;
		
		String paymentMode = new String(); // d_c
		if (request.getParameter("paymentMode") != null && request.getParameter("paymentMode").trim().length() > 0) {
			paymentMode = request.getParameter("paymentMode");
		}
		
		String op = new String();
		if (request.getParameter("operation") != null && request.getParameter("operation").trim().length() > 0) {
			op = request.getParameter("operation");
		}

		String page = "/pages/admin/MemberTransfer.jsp";
		int k = 0;
		HttpSession se = request.getSession();
		se.setAttribute("accList", new AccountDao().findAll());
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

				
				Users u = (Users) se.getAttribute("userLogin");
				Date d1 = null;

				if (accountCode != null && accountCode.trim().length() > 0) {
					System.out.println("Payment For Master Account : " + accountCode + " : " + d);

						TransactionRecords t = new TransactionRecords(voucherNo, d, voucherDate, "W", accountCode,
								bankCode, transctionID, trDate, " ", memberNo, Amount, remarks, flag, voucherNo,
								mem.getProjectCd(), u.getUserId(), new Date());
						k = new ChequePaymentDao().create(t);
						if (k <= 0) {
							break;
						} else
							d++;

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
