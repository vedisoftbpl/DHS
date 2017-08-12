package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.vedisoft.danishhousing.daos.AccountDao;
import com.vedisoft.danishhousing.daos.MembersDao;
import com.vedisoft.danishhousing.daos.ProjectsDao;
import com.vedisoft.danishhousing.pojos.Account;
import com.vedisoft.danishhousing.pojos.Members;
import com.vedisoft.danishhousing.pojos.Projects;

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
		int memberId = 0;
		String bankCode = new String();
		Gson gson = new Gson();
		if (request.getParameter("id") != null && request.getParameter("id").trim().length() > 0) {
			memberId = Integer.parseInt(request.getParameter("id"));
			Members m = new MembersDao().find(memberId);
			String json1 = gson.toJson(m);
			String json2 = new String();
			if (m.getProjectCd() != 0) {
				Projects p = new ProjectsDao().find(m.getProjectCd());
				json2 = gson.toJson(p);
			} else {
				json2 = "{\"projectId\":\"NA\",\"projectName\":\"NA\",\"bungProj\":\"NA\"}";
			}
			response.setContentType("application/json");
			response.getWriter().write("{\"data\": [" + json1 + "," + json2 + "]}");
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
	}

}
