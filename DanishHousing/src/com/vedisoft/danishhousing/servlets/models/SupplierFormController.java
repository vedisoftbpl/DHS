package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.daos.AccountMasterDao;
import com.vedisoft.danishhousing.daos.SupplierDao;
import com.vedisoft.danishhousing.pojos.AccountMaster;
import com.vedisoft.danishhousing.pojos.Supplier;

/**
 * Servlet implementation class SupplierFormController
 */
@WebServlet("/admin/pages/SupplierFormController")
public class SupplierFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SupplierFormController() {
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

		int id = 0;

		if (request.getParameter("showId") != null && request.getParameter("showId").trim().length() > 0) {
			id = Integer.parseInt(request.getParameter("showId"));
		}
		System.out.println(id);
		String supplName = new String();
		if (request.getParameter("supplierName") != null && request.getParameter("supplierName").trim().length() > 0) {
			supplName = request.getParameter("supplierName");
		}

		String supplierAddress1 = new String();
		if (request.getParameter("supplierAddress1") != null
				&& request.getParameter("supplierAddress1").trim().length() > 0) {
			supplierAddress1 = request.getParameter("supplierAddress1");
		}

		String supplierAddress2 = new String();
		if (request.getParameter("supplierAddress2") != null
				&& request.getParameter("supplierAddress2").trim().length() > 0) {
			supplierAddress2 = request.getParameter("supplierAddress2");
		}

		String supplierCity = new String();
		if (request.getParameter("supplierCity") != null && request.getParameter("supplierCity").trim().length() > 0) {
			supplierCity = request.getParameter("supplierCity");
		}

		String pan = new String();
		if (request.getParameter("supplierPAN") != null && request.getParameter("supplierPAN").trim().length() > 0) {
			pan = request.getParameter("supplierPAN");
		}

		String gst = new String();
		if (request.getParameter("supplierGST") != null && request.getParameter("supplierGST").trim().length() > 0) {
			gst = request.getParameter("supplierGST");
		}

		Date baldte = new Date();
		if (request.getParameter("balDt") != null && request.getParameter("balDt").trim().length() > 0) {
			baldte = DateUtils.convertDate(request.getParameter("balDt"));
		}

		double bal = 0;
		if (request.getParameter("balance") != null && request.getParameter("balance").trim().length() > 0) {
			bal = Double.parseDouble(request.getParameter("balance"));
		}

		String page1 = "/pages/admin/SupplierForm.jsp";
		String page2 = "/pages/admin/SupplierViewForm.jsp";
		String page3 = "SupplierTableController";

		String operation = new String();
		if (request.getParameter("operation") != null && request.getParameter("operation").trim().length() > 0) {
			operation = request.getParameter("operation");
		}

		if (operation.equals("create")) {
			System.out.println("Create form");
			SupplierDao dao = new SupplierDao();
			Supplier a = new Supplier(supplName, supplierAddress1, supplierAddress2, supplierCity, bal, baldte, gst,
					pan);
			System.out.println(a);
			int k = 0;
			k = dao.create(a);
			if (k > 0) {
				response.sendRedirect(page3 + "?msg=1");
			} else {
				response.sendRedirect(page3 + "?msg=2");
			}

		} else if (operation.equals("show")) {
			SupplierDao dao = new SupplierDao();
			Supplier a = new Supplier();
			a = dao.find(id);
			System.out.println(a);
			// System.out.println("Heloooooo");
			request.setAttribute("supplier", a);
			RequestDispatcher rd = request.getRequestDispatcher(page2);
			rd.forward(request, response);

		} else if (operation.equals("edit")) {
			SupplierDao dao = new SupplierDao();
			System.out.println(id);
			Supplier a = new Supplier(id, supplName, supplierAddress1, supplierAddress2, supplierCity, bal, baldte, gst,
					pan);
			System.out.println(a);
			System.out.println("Editform");
			boolean status = false;
			status = dao.edit(a);
			System.out.println(status);
			if (status == true)
				response.sendRedirect(page3 + "?msg=1");
			else
				response.sendRedirect(page3 + "?msg=2");
		} else {
			System.out.println("Pass directly");
			RequestDispatcher rd = request.getRequestDispatcher(page1);
			rd.forward(request, response);
		}
	}

}
