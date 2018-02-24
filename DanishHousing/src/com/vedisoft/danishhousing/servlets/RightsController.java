package com.vedisoft.danishhousing.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.daos.RightsDao;
import com.vedisoft.danishhousing.pojos.Rights;

/**
 * Servlet implementation class RightsController
 */
@WebServlet("/admin/pages/RightsController")
public class RightsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RightsController() {
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
		//String accounts=
		List<String> accounts = new ArrayList<String>();
		List<String> dataEntry = new ArrayList<String>();
		List<String> reception = new ArrayList<String>();
		String operation = new String();
		String page = "/pages/admin/Rights.jsp";
		if (request.getParameter("operation") != null && request.getParameter("operation").trim().length() > 0) {
			operation = request.getParameter("operation");
		}
		if (request.getParameterValues("accounts") != null ) {
			accounts = Arrays.asList(request.getParameterValues("accounts"));
		}
		if (request.getParameterValues("dataEntry") != null ) {
			dataEntry = Arrays.asList(request.getParameterValues("dataEntry"));
		}
		if (request.getParameterValues("reception") != null ) {
			reception = Arrays.asList(request.getParameterValues("reception"));
		}
		System.out.println("Finding All Rights");
		ArrayList<Rights> rightsList = RightsDao.findAllRights();
		for(Rights rt:rightsList)
			System.out.println(rt);
		request.setAttribute("rightsList", rightsList);
		if (operation.equals("create")) {
			System.out.println("Saving rights");
			RightsDao rdao = new RightsDao();
			boolean status = false;
			for(String id:accounts){
				status= rdao.setRights("Accounts", Integer.parseInt(id));
				System.out.println(id);
			}
			for(String id:dataEntry){
				status=rdao.setRights("Data Entry", Integer.parseInt(id));
				System.out.println(id);
			}
			for(String id:reception){
				status=rdao.setRights("Reception", Integer.parseInt(id));
				System.out.println(id);
			}
			RequestDispatcher rd = request.getRequestDispatcher(page);
			if(status==true){
			request.setAttribute("msg", "1");
			rd.forward(request, response);
			}else{
				request.setAttribute("msg", "2");
				rd.forward(request, response);
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

}
