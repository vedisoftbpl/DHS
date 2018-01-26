package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.daos.AccountMasterDao;
import com.vedisoft.danishhousing.daos.ProjectsDao;
import com.vedisoft.danishhousing.pojos.AccountMaster;
import com.vedisoft.danishhousing.pojos.AccountMasterFlagsEnum;
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
		
		int id =0;
		if(request.getParameter("showId") != null && request.getParameter("showId").trim().length() > 0) {
			 id = Integer.parseInt(request.getParameter("showId"));
		}
		
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
		
		Date opdte = null;
		if (request.getParameter("datepicker") != null && request.getParameter("datepicker").trim().length() > 0) {
			opdte = DateUtils.convertDate(request.getParameter("datepicker"));
		}
		
		double opBal = 0;
		if (request.getParameter("openingBalance") != null && request.getParameter("openingBalance").trim().length() > 0) {
			opBal = Double.parseDouble(request.getParameter("openingBalance"));
		}
		

		double mBal = 0;
		if (request.getParameter("minimumBalance") != null && request.getParameter("minimumBalance").trim().length() > 0) {
			mBal = Double.parseDouble(request.getParameter("minimumBalance"));
		}
		
		
		String pexp = new String();
		if(request.getParameter("pexp")!= null && request.getParameter("pexp").trim().length() > 0) {
			pexp = request.getParameter("pexp");
		}
		
		
		String operation = new String();
		if(request.getParameter("operation")!= null && request.getParameter("operation").trim().length() > 0) {
			operation = request.getParameter("operation");
		}
		
		String page = "/pages/admin/AccountMasterForm.jsp";
		String page1 = "/pages/admin/AccountMasterViewForm.jsp";
		String page2 = "MasterAccountTableController";
		
		//ArrayList<AccountMasterFlagsEnum> enumList = new ArrayList<AccountMasterFlagsEnum>(Arrays.asList(AccountMasterFlagsEnum.values()) );
		ProjectsDao pdao = new ProjectsDao();
		request.setAttribute("projectList", pdao.findAll());
		request.setAttribute("enumList", AccountMasterFlagsEnum.values());
		
		if(operation.equals("create")){
			AccountMasterDao dao = new AccountMasterDao();
			AccountMaster a = new AccountMaster(anxCd, accountCode, acName, address, acClass, ixpge, flag, projectCode);
			System.out.println(a);
			int k = 0;
			k = dao.create(a);
			if(k > 0){
				RequestDispatcher rd = request.getRequestDispatcher(page);
				request.setAttribute("msg", 1);
				rd.forward(request, response);
			}else{
				//response.sendRedirect("/DanishHousing" + page + "?msg=2");
				RequestDispatcher rd = request.getRequestDispatcher(page);
				request.setAttribute("msg", 2);
				rd.forward(request, response);
			}
			
		}else if(operation.equals("show")){
			AccountMasterDao dao = new AccountMasterDao();
			AccountMaster a = new AccountMaster();
			a = dao.find(id);
			System.out.println(a);
			//System.out.println("Heloooooo");
			request.setAttribute("accountmaster",a);
			RequestDispatcher rd = request.getRequestDispatcher(page1);
			rd.forward(request, response);
			
		}else if(operation.equals("edit")){
			AccountMasterDao dao = new AccountMasterDao();
			AccountMaster a = new AccountMaster(id,anxCd, accountCode, acName, address, acClass, opdte, opBal, mBal, pexp, ixpge, flag, projectCode);
			System.out.println(a);
			//System.out.println("Editform");
			boolean status =false;
			status = dao.edit(a);
			if (status == true)
				response.sendRedirect( page2 + "?msg=1");
			else
				response.sendRedirect( page2 + "?msg=2");
		}
		else {
			System.out.println("Pass directly");
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
	}

}
