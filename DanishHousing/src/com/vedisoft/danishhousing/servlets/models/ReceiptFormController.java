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
import com.vedisoft.danishhousing.daos.AccountMasterDao;
import com.vedisoft.danishhousing.daos.MembersDao;
import com.vedisoft.danishhousing.daos.ProjectsDao;
import com.vedisoft.danishhousing.daos.ReceiptDao;
import com.vedisoft.danishhousing.daos.UtilityDao;
import com.vedisoft.danishhousing.pojos.AccountMaster;
import com.vedisoft.danishhousing.pojos.Members;
import com.vedisoft.danishhousing.pojos.Projects;
import com.vedisoft.danishhousing.pojos.ReceiptRecord;
import com.vedisoft.danishhousing.pojos.TransactionRecords;
import com.vedisoft.danishhousing.pojos.Users;

/**
 * Servlet implementation class ReceiptFormController
 */
@WebServlet("/admin/pages/ReceiptFormController")
public class ReceiptFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceiptFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int id =0;
		
		
		int memberNo = 0;
		if (request.getParameter("memberID") != null && request.getParameter("memberID").trim().length() > 0) {
			memberNo = Integer.parseInt(request.getParameter("memberID"));
		}
		
		Members mem = new MembersDao().find(memberNo);
		
		int receiptNo = 0;
		if (request.getParameter("receiptNumber") != null && request.getParameter("receiptNumber").trim().length() > 0) {
			receiptNo = Integer.parseInt(request.getParameter("receiptNumber"));
		}
		
		
		Date receiptDate = new Date();
		if (request.getParameter("date") != null && request.getParameter("date").trim().length() > 0) {
			receiptDate = DateUtils.convertDate(request.getParameter("date"));
		}
		
		int totalAccounts = 0;
		if (request.getParameter("totalAccounts") != null && request.getParameter("totalAccounts").trim().length() > 0) {
			totalAccounts = Integer.parseInt(request.getParameter("totalAccounts"));
		}
		
		String bankCode = new String();			//transaction
		if (request.getParameter("bankCode") != null && request.getParameter("bankCode").trim().length() > 0) {
			bankCode = request.getParameter("bankCode");
		}
		
		String bankName  = new String();;
		if(request.getParameter("bankName")!= null && request.getParameter("bankName").trim().length() > 0) {
			bankName = request.getParameter("bankName");
		}
		
		String paymentMode  = new String();				//d_c
		if(request.getParameter("paymentMode")!= null && request.getParameter("paymentMode").trim().length() > 0) {
			paymentMode = request.getParameter("paymentMode");
		}
		
		int flag = 2;
		if(paymentMode.trim().equals("Cash"))
			{
			flag = 1;
			}
		
		String transctionID  = new String();			//cheque id		cdd
		if(request.getParameter("transactionID")!= null && request.getParameter("transactionID").trim().length() > 0) {
			transctionID = request.getParameter("transactionID");
		}
		
		double totalAmount = 0.0;
		if (request.getParameter("totalAmount") != null && request.getParameter("totalAmount").trim().length() > 0) {
			totalAmount = Double.parseDouble(request.getParameter("totalAmount"));	
		}
		
		String branch  = new String();
		if(request.getParameter("paymentBank")!= null && request.getParameter("paymentBank").trim().length() > 0) {
			branch = request.getParameter("paymentBank");
		}
		
		
		String city  = new String();
		if(request.getParameter("city")!= null && request.getParameter("city").trim().length() > 0) {
			city = request.getParameter("city");
		}	
		
		Date trDate = null;
		if (request.getParameter("trDate") != null && request.getParameter("trDate").trim().length() > 0) {
			trDate = DateUtils.convertDate(request.getParameter("trDate"));
		}
		
		String op  = new String();
		if(request.getParameter("operation")!= null && request.getParameter("operation").trim().length() > 0) {
			op = request.getParameter("operation");
		}
		
		String page = "/pages/admin/ReceiptsForm.jsp";
		int k = 0;
		System.out.println(totalAccounts);
		if (op.equals("create")) {
			
			ReceiptRecord[] rec = new ReceiptRecord[totalAccounts];
			TransactionRecords[] tra = new TransactionRecords[totalAccounts];
			
			int d = 1;
			for(int i = 0; i < totalAccounts; i++)
			{
				int j = i+1;
				String accountCode  = new String();
				if(request.getParameter("accountCode" + j)!= null && request.getParameter("accountCode"+ j).trim().length() > 0) {
					accountCode= request.getParameter("accountCode"+ j);
				}
				
				AccountMaster acc = new AccountMasterDao().findByCode(accountCode);
				
				String accountName  = new String();
				if(request.getParameter("accountName"+ j)!= null && request.getParameter("accountName"+ j).trim().length() > 0) {
					accountName= request.getParameter("accountName"+ j);
				}
				
				Double Amount = 0.0,cashA = 0.0, chqA = 0.0;
				if (request.getParameter("amount"+ j) != null && request.getParameter("amount"+ j).trim().length() > 0) {
					Amount = Double.parseDouble(request.getParameter("amount"+ j));
				}
				if(paymentMode.trim().equals("Cash")){
					cashA = Amount;
				}
				else
					chqA = Amount;
				
					
				String remarks  = new String();
				if(request.getParameter("remarks"+ j)!= null && request.getParameter("remarks"+ j).trim().length() > 0) {
					remarks= request.getParameter("remarks"+ j);
				}
				HttpSession se = request.getSession();
				Users u = (Users) se.getAttribute("userLogin");
				Date d1 = null;
				
				
				TransactionRecords t = new TransactionRecords(
						 receiptNo,d,receiptDate,"D",accountCode,bankCode,transctionID,trDate,branch,memberNo,Amount,remarks,flag,0,mem.getProjectCd(),u.getUserId(),new Date());
				ReceiptRecord r = new
						 ReceiptRecord('R',d,receiptDate,receiptNo, mem.getPrefix(), mem.getMemName(),
								 mem.getMemberNo(),mem.getfHRelation() + " " + mem.getfHRelName(), mem.getAddress1(),mem.getAddress2(), mem.getAddress3(), Amount,
									0.0, transctionID,trDate,mem.getFullPay(), mem.getInst1(), mem.getInst2(), mem.getInst3(),0,
									d1, mem.getPlotSize(), mem.getPlotNo(), mem.getProjectCd()," ", " ", 'R',
									remarks, mem.getrC(), acc.getFlag(), accountCode, branch, paymentMode, d1,u.getUserId(), new Date(), city);
				
				if(r.getAccode() != null && r.getAccode().trim().length() > 0){
					System.out.println(r.getSlno());
					k = new ReceiptDao().create(t,r);
					d++;
					if(k <= 0){
						request.setAttribute("msg", 2);
						break;
					}
				}
					
				
			}
			if(k > 0){
				request.setAttribute("msg", 1);
				request.setAttribute("docNo", receiptNo);
			}
				
			else
				request.setAttribute("msg", 2);
			System.out.println("k :" + k);
			request.setAttribute("recNo", UtilityDao.maxReceiptNo());
			request.setAttribute("today", new java.util.Date());
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else {
			request.setAttribute("recNo", UtilityDao.maxReceiptNo());
			request.setAttribute("today", new java.util.Date());
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		//Paytype												//cDdte   cheque date
		//balchq												//plSize
		//fullpay												//plNo
		//inst1													//projCd
		//inst2													//rC
		//inst3													//userId
		//chalNo												//lastUpdate
		//chalDte
		//chqDhr
		//flag
		//trCode
		//pD
		//dC
		//wLrDt
		
		//branch
		
		
	}

}
