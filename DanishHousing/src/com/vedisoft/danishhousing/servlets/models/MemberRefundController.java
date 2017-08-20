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

import com.vedisoft.danishhousing.daos.AccountDao;
import com.vedisoft.danishhousing.daos.AccountMasterDao;
import com.vedisoft.danishhousing.daos.ReceiptDao;
import com.vedisoft.danishhousing.daos.UtilityDao;
import com.vedisoft.danishhousing.pojos.AccountMaster;
import com.vedisoft.danishhousing.pojos.ReceiptRecord;
import com.vedisoft.danishhousing.pojos.TransactionRecords;
import com.vedisoft.danishhousing.pojos.Users;

/**
 * Servlet implementation class MemberRefundController
 */
@WebServlet("/admin/pages/MemberRefundController")
public class MemberRefundController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberRefundController() {
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
		if (request.getParameter("operation") != null && request.getParameter("operation").trim().length() > 0) {
			op = request.getParameter("operation");
		}

		String page = "/pages/admin/MemberRefund.jsp";
		int k = 0;

		if (op.equals("create")) {

			// ReceiptRecord[] rec = new ReceiptRecord[totalAccounts];
			// TransactionRecords[] tra = new TransactionRecords[totalAccounts];
			//
			// int d = 1;
			// for(int i = 0; i < totalAccounts; i++)
			// {
			// int j = i+1;
			// String accountCode = new String();
			// if(request.getParameter("accountCode" + j)!= null &&
			// request.getParameter("accountCode"+ j).trim().length() > 0) {
			// accountCode= request.getParameter("accountCode"+ j);
			// }
			//
			// AccountMaster acc = new
			// AccountMasterDao().findByCode(accountCode);
			//
			// String accountName = new String();
			// if(request.getParameter("accountName"+ j)!= null &&
			// request.getParameter("accountName"+ j).trim().length() > 0) {
			// accountName= request.getParameter("accountName"+ j);
			// }
			//
			// Double Amount = 0.0,cashA = 0.0, chqA = 0.0;
			// if (request.getParameter("amount"+ j) != null &&
			// request.getParameter("amount"+ j).trim().length() > 0) {
			// Amount = Double.parseDouble(request.getParameter("amount"+ j));
			// }
			// if(paymentMode.trim().equals("Cash")){
			// cashA = Amount;
			// }
			// else
			// chqA = Amount;
			//
			//
			// String remarks = new String();
			// if(request.getParameter("remarks"+ j)!= null &&
			// request.getParameter("remarks"+ j).trim().length() > 0) {
			// remarks= request.getParameter("remarks"+ j);
			// }
			// HttpSession se = request.getSession();
			// Users u = (Users) se.getAttribute("userLogin");
			// Date d1 = null;
			//
			//
			// TransactionRecords t = new TransactionRecords(
			// receiptNo,d,receiptDate,"D",accountCode,bankCode,transctionID,trDate,branch,memberNo,Amount,remarks,flag,"
			// ",mem.getProjectCd(),u.getUserId(),new Date());
			// ReceiptRecord r = new
			// ReceiptRecord('R',d,receiptDate,receiptNo, mem.getPrefix(),
			// mem.getMemName(),
			// mem.getMemberNo(),mem.getfHRelation() + " " + mem.getfHRelName(),
			// mem.getAddress1(),mem.getAddress2(), mem.getAddress3(), Amount,
			// 0.0, transctionID,trDate,mem.getFullPay(), mem.getInst1(),
			// mem.getInst2(), mem.getInst3(),0,
			// d1, mem.getPlotSize(), mem.getPlotNo(), mem.getProjectCd()," ", "
			// ", 'R',
			// remarks, mem.getrC(), acc.getFlag(), accountCode, branch,
			// paymentMode, d1,u.getUserId(), new Date(), city);
			//
			// if(r.getAccode() != null && r.getAccode().trim().length() > 0){
			// System.out.println(r.getSlno());
			// k = new ReceiptDao().create(t,r);
			// d++;
			// if(k <= 0){
			// request.setAttribute("msg", 2);
			// break;
			// }
			// }
			//
			//
			// }
			 if(k > 0)
			 request.setAttribute("msg", 1);
			 else
			 request.setAttribute("msg", 2);
			
			 request.setAttribute("accList", new AccountDao().findAll());
			 request.setAttribute("voucherNo", UtilityDao.maxReceiptNo());
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
