package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.daos.AccountDao;
import com.vedisoft.danishhousing.daos.AccountMasterDao;
import com.vedisoft.danishhousing.daos.MemberDocumentDao;
import com.vedisoft.danishhousing.daos.MembersDao;
import com.vedisoft.danishhousing.daos.ProjectsDao;
import com.vedisoft.danishhousing.daos.SupplierDao;
import com.vedisoft.danishhousing.daos.UtilityDao;
import com.vedisoft.danishhousing.pojos.Account;
import com.vedisoft.danishhousing.pojos.AccountMaster;
import com.vedisoft.danishhousing.pojos.Members;
import com.vedisoft.danishhousing.pojos.MemberDocument;
import com.vedisoft.danishhousing.pojos.Projects;
import com.vedisoft.danishhousing.pojos.Supplier;

/**
 * Servlet implementation class ReceiptAutoFill
 */
@WebServlet("/ReceiptAutoFill")
public class ReceiptAutoFill extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReceiptAutoFill() {
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
		int memberId = 0,recNo,vrNo,pageNo;
		String accCode = new String();
		String bankCode = new String();
		int partyCode=0;
		Gson gson = new Gson();
		if (request.getParameter("id") != null && request.getParameter("id").trim().length() > 0) {
			memberId = Integer.parseInt(request.getParameter("id"));
			int mId=new MembersDao().findMember(memberId);
			Members m = new MembersDao().find(memberId);
			m.setMemberId(mId);
			String json1 = gson.toJson(m);
			String json2 = new String();
			if (m.getProjectCd() != 0) {
				Projects p = new ProjectsDao().find(m.getProjectCd());
				json2 = gson.toJson(p);
			} else {
				json2 = "{\"projectId\":\"NA\",\"projectName\":\"NA\",\"bungProj\":\"NA\"}";
			}
			ArrayList<MemberDocument>  docList= new MemberDocumentDao().findDocOfMember(memberId);
			String json3 = gson.toJson(docList);
			response.setContentType("application/json");
			response.getWriter().write("{\"data\": [" + json1 + "," + json2 + "," + json3 + "]}");
		}
		if(request.getParameter("accode") != null && request.getParameter("accode").trim().length() > 0) {
			accCode = request.getParameter("accode");
			AccountMaster acc =  AccountMasterDao.findByCode(accCode);
			String json = gson.toJson(acc);
			response.setContentType("application/json");
			response.getWriter().write(json);
			
		}
		if(request.getParameter("partycode") != null && request.getParameter("partycode").trim().length() > 0) {
			partyCode = Integer.parseInt(request.getParameter("partycode"));
			Supplier acc = new SupplierDao().find(partyCode);
			String json = gson.toJson(acc);
			System.out.println(json);
			response.setContentType("application/json");
			response.getWriter().write(json);
			
		}
		if (request.getParameter("code") != null && request.getParameter("code").trim().length() > 0) {
			bankCode = request.getParameter("code");
			
			Account a = new AccountDao().findByBankCode(bankCode);
			
			String json = new String();
			if(a.getAccountId() == 0)
				json = "{\"accountId\":0,\"coCode\":\"NA\",\"bkCode\":\"NA\",\"bkName\":\"NA\",\"opDate\":\"NA\",\"opBal\":0.0,\"receipt\":0.0,\"payment\":0.0,\"clBal\":0.0,\"ifsc\":\"NA\",\"branch\":\"NA\"}";
			else
				json = gson.toJson(a);
			response.setContentType("application/json");
			response.getWriter().write(json);
		}
		if (request.getParameter("recNo") != null && request.getParameter("recNo").trim().length() > 0) {
			recNo = Integer.parseInt(request.getParameter("recNo"));
			boolean bool = UtilityDao.checkReceiptNo(recNo);
			String json = "{\"avail\":"+bool+",\"next\":\""+UtilityDao.maxReceiptNo()+"\"}";
			response.setContentType("application/json");
			response.getWriter().write("{\"data\": [" + json + "]}");
		}
		if (request.getParameter("vrNo") != null && request.getParameter("vrNo").trim().length() > 0) {
			vrNo = Integer.parseInt(request.getParameter("vrNo"));
			Date d = DateUtils.convertDate(request.getParameter("date"));
			System.out.println(d);
			boolean bool = UtilityDao.checkVoucherNo(vrNo, d);
			String json = "{\"avail\":"+bool+",\"next\":\""+UtilityDao.maxVoucherNo(d)+"\"}";
			response.setContentType("application/json");
			response.getWriter().write("{\"data\": [" + json + "]}");
		}
		if (request.getParameter("pageNo") != null && request.getParameter("pageNo").trim().length() > 0) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
			System.out.println(pageNo);
			UtilityDao.savePageNo(pageNo);
		}
	
	}

}
