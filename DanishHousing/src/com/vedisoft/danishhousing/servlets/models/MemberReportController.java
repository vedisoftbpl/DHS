package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.daos.AccountDao;
import com.vedisoft.danishhousing.daos.MembersDao;
import com.vedisoft.danishhousing.daos.ProjectsDao;
import com.vedisoft.danishhousing.daos.ReceiptDao;
import com.vedisoft.danishhousing.daos.RefundPaymentDao;
import com.vedisoft.danishhousing.daos.TransactionRecordsDao;
import com.vedisoft.danishhousing.pojos.Members;
import com.vedisoft.danishhousing.pojos.ReceiptBankDto;
import com.vedisoft.danishhousing.pojos.ReceiptRecord;
import com.vedisoft.danishhousing.pojos.RefundPayment;
import com.vedisoft.danishhousing.pojos.TransactionRecords;

/**
 * Servlet implementation class MemberReportController
 */
@WebServlet("/admin/pages/MemberReportController")
public class MemberReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 * 
	 *      public MemberReportController() { super(); // TODO Auto-generated
	 *      constructor stub }
	 * 
	 *      /**
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
		// TODO Auto-generated method stub

		int memberNo = 0;
		int msg = 2;

		if (request.getParameter("memberID") != null && request.getParameter("memberID").trim().length() > 0) {
			request.setAttribute("msg", msg);
			System.out.println("form : " + request.getParameter("memberID"));
			memberNo = Integer.parseInt(request.getParameter("memberID"));
		}

		System.out.println("memberNo : " + memberNo);

		Members member = new Members();
		ArrayList<RefundPayment> refPayList = new ArrayList<RefundPayment>();
		ArrayList<ReceiptBankDto> receiptList = new ArrayList<ReceiptBankDto>();
		ArrayList<TransactionRecords> transferList = new ArrayList<TransactionRecords>();
		double receiptTotalAmount = 0;
		double refundTotalAmount = 0;
		String projectName = new String();

		String page = "/pages/admin/MemberReport.jsp";

		if (memberNo > 0) {
			member = new MembersDao().find(memberNo);
		}

		if (member.getMemberNo() > 0) {

			receiptList = new ReceiptDao().findMemRecRecordList(memberNo);
			refPayList = new RefundPaymentDao().findMemRefundPay(memberNo);
			transferList = new TransactionRecordsDao().findMemTransactionRecord(memberNo);
			projectName = (new ProjectsDao().find(member.getProjectCd())).getProjectName();
			request.setAttribute("member", member);
			request.setAttribute("projectName", projectName);
			if (refPayList.size() > 0){
				request.setAttribute("refPayList", refPayList);
				request.setAttribute("flagr",2);
			}	
			
				

			if (transferList.size() > 0){
				request.setAttribute("transferList", transferList);
				request.setAttribute("flagt", 2);
			}	
			
				
			request.setAttribute("receiptList", receiptList);
			

			System.out.println("member : " + member);
			for (RefundPayment rf : refPayList) {
				System.out.println(rf);
				refundTotalAmount = refundTotalAmount + rf.getAmount();
			}
			for (ReceiptBankDto r : receiptList) {
				System.out.println(r);
				receiptTotalAmount = receiptTotalAmount + r.getReceipt().getAmount();
			}

			for (TransactionRecords t : transferList)
				System.out.println(t);

			request.setAttribute("receiptTotalAmount", receiptTotalAmount);
			request.setAttribute("refundTotalAmount", refundTotalAmount);

			request.setAttribute("balanceAmount", receiptTotalAmount - refundTotalAmount);
			msg = 1;
			request.setAttribute("msg", msg);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else {

			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}

	}

}
