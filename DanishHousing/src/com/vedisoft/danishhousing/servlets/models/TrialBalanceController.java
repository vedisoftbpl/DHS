package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.daos.AccountDao;
import com.vedisoft.danishhousing.daos.TransactionRecordsDao;
import com.vedisoft.danishhousing.pojos.TrialBalanceDto;

/**
 * Servlet implementation class TrialBalanceController
 */
@WebServlet("/admin/pages/TrialBalanceController")
public class TrialBalanceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TrialBalanceController() {
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
		String page = "/pages/admin/TrialBalance.jsp";
		int msg = 2;

		String op = new String();
		if (request.getParameter("operation") != null && request.getParameter("operation").trim().length() > 0) {
			request.setAttribute("msg", msg);
			op = request.getParameter("operation");
		}

		Date opdte = null;
		if (request.getParameter("openingDate") != null && request.getParameter("openingDate").trim().length() > 0) {
			opdte = DateUtils.convertDate(request.getParameter("openingDate"));
		}

		Date clsdte = null;
		if (request.getParameter("closingDate") != null && request.getParameter("closingDate").trim().length() > 0) {
			clsdte = DateUtils.convertDate(request.getParameter("closingDate"));
		}

		if (op.equals("create")) {
			double totalReceiptAmt = 0.0;
			double totalPaymentAmt = 0.0;
			
			request.setAttribute("date1", DateUtils.dateFormat(opdte));
			request.setAttribute("date2", DateUtils.dateFormat(clsdte));
			
			ArrayList<TrialBalanceDto> opBalList = new AccountDao().findAllBankBalanceByDate(DateUtils.getPreviousDate(opdte), "opBal");
			ArrayList<TrialBalanceDto> clsBalList = new AccountDao().findAllBankBalanceByDate(clsdte, "clsBal");
			for (TrialBalanceDto dto : opBalList)
				totalReceiptAmt +=dto.getRecAmount();
			for (TrialBalanceDto dto : clsBalList)
				totalPaymentAmt +=dto.getPayAmount();

			for (TrialBalanceDto dto : opBalList)
				System.out.println(dto);
			for (TrialBalanceDto dto : clsBalList)
				System.out.println(dto);
			
			System.out.println(totalReceiptAmt);
			System.out.println(totalPaymentAmt);
			
			request.setAttribute("opBalList", opBalList);
			request.setAttribute("clsBalList", clsBalList);
			ArrayList<TrialBalanceDto> balList = new ArrayList<TrialBalanceDto>();
			ArrayList<TrialBalanceDto> recBalList = new TransactionRecordsDao().findRecTransactionRecord(opdte, clsdte);
			ArrayList<TrialBalanceDto> payBalList = new TransactionRecordsDao().findPayTransactionRecord(opdte, clsdte);
			for (TrialBalanceDto dto : recBalList) {
				TrialBalanceDto tdto = new TrialBalanceDto();
				int flag = 0;
				for (TrialBalanceDto d : payBalList) {
					if (dto.getAcCode().equals(d.getAcCode())) {
						tdto.setAcCode(dto.getAcCode());
						tdto.setAcName(dto.getAcName());
						tdto.setPayAmount(d.getPayAmount());
						tdto.setRecAmount(dto.getRecAmount());
						flag = 1;
					}
				}
				if (flag == 0) {
					tdto.setAcCode(dto.getAcCode());
					tdto.setAcName(dto.getAcName());
					tdto.setPayAmount(dto.getPayAmount());
					tdto.setRecAmount(dto.getRecAmount());
				}
				balList.add(tdto);
			}
			for (TrialBalanceDto dto : payBalList) {
				int flag = 0;
				//System.out.println("DTO :" + dto);
				TrialBalanceDto tdto = new TrialBalanceDto();
				for (TrialBalanceDto d : balList) {
					if (dto.getAcCode().equals(d.getAcCode())) {
					//	System.out.println("record found");
						flag=1;
						break;
					}
				}
				if (flag == 0) {
					tdto.setAcCode(dto.getAcCode());
					tdto.setAcName(dto.getAcName());
					tdto.setPayAmount(dto.getPayAmount());
					tdto.setRecAmount(dto.getRecAmount());
					//System.out.println("tdto :" + tdto);
					balList.add(tdto);
				}
			}
			for (TrialBalanceDto dto : balList) {
				totalReceiptAmt +=dto.getRecAmount();
				totalPaymentAmt += dto.getPayAmount();
				//System.out.println(dto);
			}

			
	
			System.out.println(totalReceiptAmt);
			System.out.println(totalPaymentAmt);

			
			 Collections.sort(balList, TrialBalanceDto.AcCodeComparator);
			 
			request.setAttribute("balList", balList);

			request.setAttribute("totalReceiptAmt", totalReceiptAmt);
			request.setAttribute("totalPaymentAmt", totalPaymentAmt);

			request.setAttribute("msg", 1);

			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

}
