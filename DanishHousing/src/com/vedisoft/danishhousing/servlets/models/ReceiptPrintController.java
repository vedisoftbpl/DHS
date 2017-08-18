package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.ArrayList;

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
		
		
		
		String receiptNo = new String();
		
		ReceiptDao 	receiptDao = new ReceiptDao();
		ArrayList<ReceiptRecord> list = new ArrayList<ReceiptRecord>();
		 for(ReceiptRecord r : list)
			 System.out.println(r);
		if( request.getAttribute("receiptNo")!= null &&  ((String)request.getAttribute("receiptNo")).trim().length() > 0) {
		receiptNo =(String) request.getAttribute("receiptNo");
		list =receiptDao.findReceiptRecords( receiptNo);
		 
		}
		 
		double totalAmt= 0.0;
		 for(ReceiptRecord r : list)
			 totalAmt = totalAmt + r.getAmount();

		System.out.println("totalAmt "+totalAmt);
		
 
		
		String projectName = new String();
		 ProjectsDao projectDao = new ProjectsDao();
		 if (projectDao.find(list.get(0).getProjCd()).getProjectName() != null && 
			 projectDao.find(list.get(0).getProjCd()).getProjectName().trim().length() > 0) {
			 		projectName = projectDao.find(list.get(0).getProjCd()).getProjectName();
		 	}
		
		 request.setAttribute("totalAmt", totalAmt);
		request.setAttribute("projectName", projectName);
		request.setAttribute("receiptList", list);
		
		String page ="/pages/admin/ReceiptPrint.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
		
	}

}
