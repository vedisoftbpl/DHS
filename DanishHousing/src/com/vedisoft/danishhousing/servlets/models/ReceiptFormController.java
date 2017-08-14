package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.daos.MembersDao;
import com.vedisoft.danishhousing.pojos.Members;

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
		
		String accountCode  = new String();
		if(request.getParameter("accountCode")!= null && request.getParameter("accountCode").trim().length() > 0) {
			accountCode= request.getParameter("accountCode");
		}
		
//		String accountName  = new String();
//		if(request.getParameter("accountName")!= null && request.getParameter("accountName").trim().length() > 0) {
//			accountName= request.getParameter("accountName");
//		}
		
//		Double Amount;
//		if (request.getParameter("amount") != null && request.getParameter("amount").trim().length() > 0) {
//			Amount = Double.parseDouble(request.getParameter("amount"));
//		}
			
		String remarks  = new String();;
		if(request.getParameter("remarks")!= null && request.getParameter("remarks").trim().length() > 0) {
			remarks= request.getParameter("remarks");
		}
	
		int bankCode = 0;			//transaction
		if (request.getParameter("bankCode") != null && request.getParameter("bankCode").trim().length() > 0) {
			bankCode = Integer.parseInt(request.getParameter("bankCode"));
		}
		
//		String bankName  = new String();;
//		if(request.getParameter("bankName")!= null && request.getParameter("bankName").trim().length() > 0) {
//			bankName = request.getParameter("bankName");
//		}
		
		String paymentMode  = new String();				//column??
		if(request.getParameter("paymentMode")!= null && request.getParameter("paymentMode").trim().length() > 0) {
			paymentMode = request.getParameter("paymentMode");
		}
		
		String transctionID  = new String();			//cheque id		cdd
		if(request.getParameter("transctionID")!= null && request.getParameter("transctionID").trim().length() > 0) {
			transctionID = request.getParameter("transctionID");
		}
		
		double totalAmount = 0.0;
		if (request.getParameter("totalAmount") != null && request.getParameter("totalAmount").trim().length() > 0) {
			totalAmount = Double.parseDouble(request.getParameter("totalAmount"));	
		}
		
		String branch  = new String();;
		if(request.getParameter("paymentBank")!= null && request.getParameter("paymentBank").trim().length() > 0) {
			branch = request.getParameter("paymentBank");
		}
		
		
		String city  = new String();;
		if(request.getParameter("city")!= null && request.getParameter("city").trim().length() > 0) {
			city = request.getParameter("city");
		}	
		
		int slNo = 0;
		if (request.getParameter("totalAccounts") != null && request.getParameter("totalAccounts").trim().length() > 0) {
			slNo = Integer.parseInt(request.getParameter("totalAccounts"));
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
