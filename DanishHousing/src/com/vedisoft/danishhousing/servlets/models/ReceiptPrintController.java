package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.daos.ProjectsDao;
import com.vedisoft.danishhousing.daos.ReceiptDao;

import com.vedisoft.danishhousing.pojos.ReceiptRecord;

/**
 * Servlet implementation class ReceiptPrintController
 */
@WebServlet("/admin/pages/ReceiptPrintController")
public class ReceiptPrintController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReceiptPrintController() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		String receiptNo = new String("44902");
		 System.out.println(receiptNo);
		ReceiptDao 	receiptDao = new ReceiptDao();
		ArrayList<ReceiptRecord> list = new ArrayList<ReceiptRecord>();
		 for(ReceiptRecord r : list)
			 System.out.println(r);
		if( request.getAttribute("receiptNo")!= null &&  ((String)request.getAttribute("receiptNo")).trim().length() > 0) {
		receiptNo =(String) request.getAttribute("receiptNo");
		
		 
		}
		list =receiptDao.findReceiptRecords( receiptNo); 
		 ReceiptRecord r =list.get(0);
		 	int recno=r.getReceno();
			Date recDt = r.getRecDte();
			String[] rDetails=new String[7];
			rDetails[0]=r.getPrefix();
			rDetails[1]=r.getMembNme();
			rDetails[2]=r.getfHNme();
			rDetails[3]=r.getMad1();
			rDetails[4]=r.getMad2();
			rDetails[5]=r.getMad3();
			rDetails[6]=r.getdC();
			
		double totalAmt= 0.0;
		 for(ReceiptRecord rc : list)
			 totalAmt = totalAmt + rc.getAmount();

		System.out.println("totalAmt "+totalAmt);
		
 
		
		String projectName = new String();
		 ProjectsDao projectDao = new ProjectsDao();
		 if (projectDao.find(list.get(0).getProjCd()).getProjectName() != null && 
			 projectDao.find(list.get(0).getProjCd()).getProjectName().trim().length() > 0) {
			 		projectName = projectDao.find(list.get(0).getProjCd()).getProjectName();
		 	}
		
		 request.setAttribute("totalAmt", totalAmt);
		request.setAttribute("projectName", projectName);
		request.setAttribute("receiptNo", recno);
		request.setAttribute("receiptDt", recDt);
		request.setAttribute("rdetails", rDetails);
		request.setAttribute("receiptList", list);
		
		String page ="/pages/admin/ReceiptPrint.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
		
	}

}
