package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.daos.AccountMasterDao;
import com.vedisoft.danishhousing.daos.ProjectsDao;
import com.vedisoft.danishhousing.pojos.AccountMaster;
import com.vedisoft.danishhousing.pojos.Projects;


/**
 * Servlet implementation class MasterAccountFormController
 */
@WebServlet("/admin/pages/MasterAccountFormController")
public class MasterAccountFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MasterAccountFormController() {
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
		
		String accountCode = new String();
		if(request.getParameter("accountCode") != null && request.getParameter("accountCode").trim().length() > 0)
			accountCode =  request.getParameter("accountCode");
		
		String acName = new String();
		if(request.getParameter("accountName")!= null && request.getParameter("accountName").trim().length() > 0) {
			acName = request.getParameter("accountName");
		}
		
		int anxCd = 0;
		if(request.getParameter("anxCode")!= null && request.getParameter("anxCode").trim().length() > 0) {
			anxCd = Integer.parseInt(request.getParameter("anxCode"));
		}
		
		String acClass = new String();
		if(request.getParameter("accountClass")!= null && request.getParameter("accountClass").trim().length() > 0) {
			acClass = request.getParameter("accountClass");
		}
		
		String flag = new String();
		if(request.getParameter("flag")!= null && request.getParameter("flag").trim().length() > 0) {
			flag = request.getParameter("flag");
		}
		
		int projectCode = 0;
		if(request.getParameter("ProjectCode") != null && request.getParameter("ProjectCode").trim().length() > 0)
			projectCode =  Integer.parseInt(request.getParameter("ProjectCode"));
		
		String ixpge = new String();
		if(request.getParameter("ixpge")!= null && request.getParameter("ixpge").trim().length() > 0) {
			ixpge = request.getParameter("ixpge");
		}
		
		String address = new String();
		if(request.getParameter("address")!= null && request.getParameter("address").trim().length() > 0) {
			address = request.getParameter("address");
		}
		
		String operation = new String();
		if(request.getParameter("operation")!= null && request.getParameter("operation").trim().length() > 0) {
			operation = request.getParameter("operation");
		}
		
		String page = "/pages/admin/AccountMasterForm.jsp";
		
		String pexp = new String();
		Date opdte = new Date();
		double opBal = 0;
		double mbal = 0;
		
		
		if(operation.equals("create")){
			AccountMasterDao dao = new AccountMasterDao();
			AccountMaster a = new AccountMaster(anxCd, accountCode, acName, address, acClass, opdte, opBal, mbal, pexp, ixpge, flag, projectCode);
			System.out.println(a);
			int k = 0;
			k = dao.create(a);
			if(k > 0)
				response.sendRedirect("/DanishHousing" + page + "?msg=1");
			else
				response.sendRedirect("/DanishHousing" + page + "?msg=2");
			
		}
		else {
			System.out.println("Pass directly");
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		
	}

}
