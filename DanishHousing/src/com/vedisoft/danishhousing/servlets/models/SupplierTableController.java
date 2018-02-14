package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.daos.MembersDao;
import com.vedisoft.danishhousing.pojos.Members;
import com.vedisoft.danishhousing.daos.SupplierDao;
import com.vedisoft.danishhousing.pojos.Supplier;

/**
 * Servlet implementation class SupplierTableController
 */
@WebServlet("/admin/pages/SupplierTableController")
public class SupplierTableController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	private String GLOBAL_SEARCH_TERM;
	private String COLUMN_NAME;
	private String DIRECTION;
	private int INITIAL;
	private int SECHO;
	private int RECORD_SIZE;

	public SupplierTableController() {
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

		String[] columnNames = { "suppl_id", "suppl_name", "suppl_add1", "pan_no", "gst_no" };

		JSONObject jsonResult = new JSONObject();

		int pageNo = 0;
		if (request.getParameter("iDisplayStart") != null && request.getParameter("iDisplayStart").trim().length() > 0)
			pageNo = Integer.parseInt(request.getParameter("iDisplayStart"));

		int sEcho = 0;
		if (request.getParameter("sEcho") != null && request.getParameter("sEcho").trim().length() > 0)
			sEcho = Integer.parseInt(request.getParameter("sEcho"));

		int pageSize = 20;
		if (request.getParameter("iDisplayLength") != null
				&& request.getParameter("iDisplayLength").trim().length() > 0)
			if (Integer.parseInt(request.getParameter("iDisplayLength")) > 10
					|| Integer.parseInt(request.getParameter("iDisplayLength")) < 50)
				pageSize = Integer.parseInt(request.getParameter("iDisplayLength"));

		int colIndex = 0;
		if (request.getParameter("iSortCol_0") != null && request.getParameter("iSortCol_0").trim().length() > 0)
			if (Integer.parseInt(request.getParameter("iSortCol_0")) > 0
					|| Integer.parseInt(request.getParameter("iSortCol_0")) < 5)
				colIndex = Integer.parseInt(request.getParameter("iSortCol_0"));

		String sortDirection = new String();
		if (request.getParameter("sSortDir_0") != null && request.getParameter("sSortDir_0").trim().length() > 0)
			sortDirection = request.getParameter("sSortDir_0");

		String colName = columnNames[colIndex];
		int totalRecords = -1;
		totalRecords = SupplierDao.totalRows();

		String globalSearch = "null";
		if (request.getParameter("sSearch") != null && request.getParameter("sSearch").trim().length() > 0)
			globalSearch = request.getParameter("sSearch");
System.out.println(globalSearch);
		GLOBAL_SEARCH_TERM = globalSearch;
		RECORD_SIZE = pageSize;
		COLUMN_NAME = colName;
		DIRECTION = sortDirection;
		INITIAL = pageNo;
		SECHO = sEcho;
		System.out.println("Supplier Table:  " + DIRECTION + INITIAL + " " + RECORD_SIZE);
		if (request.getParameter("sSortDir_0") == null) {
			System.out.println("Pass");
			String page = "/pages/admin/SupplierTable.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else {
			try {
				System.out.println("Not Pass");
				jsonResult = getSupplierDetails(totalRecords, request);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			response.setContentType("application/json");
			response.setHeader("Cache-Control", "no-store");
			PrintWriter out = response.getWriter();
			out.print(jsonResult);

		}

	}

	private JSONObject getSupplierDetails(int totalRecords, HttpServletRequest request)
			throws SQLException, ClassNotFoundException {
		int totalAfterSearch = 5;
		JSONObject result = new JSONObject();
		JSONArray array = new JSONArray();
		ArrayList<Supplier> a = new ArrayList<Supplier>();

		if (GLOBAL_SEARCH_TERM != "null") {
			System.out.println(GLOBAL_SEARCH_TERM);
			a = SupplierDao.findAll(INITIAL, RECORD_SIZE, GLOBAL_SEARCH_TERM, COLUMN_NAME, DIRECTION);

		} else
			a = SupplierDao.findAll(INITIAL, RECORD_SIZE, null, COLUMN_NAME, DIRECTION);
		for (Supplier u : a) {
			JSONArray ja = new JSONArray();
			System.out.println(u);
			ja.put(u.getSupplId());
			ja.put(u.getSupplName());
			
		if (u.getSupplAdd1() == null && u.getSupplAdd2() != null && u.getSupplAdd3() != null)
				ja.put(u.getSupplAdd2() + " " + u.getSupplAdd3());
			else if (u.getSupplAdd1() != null && u.getSupplAdd2() == null && u.getSupplAdd3() != null)
				ja.put(u.getSupplAdd1() + " " + u.getSupplAdd3());
			else if (u.getSupplAdd1() != null && u.getSupplAdd2() != null && u.getSupplAdd3() == null)
				ja.put(u.getSupplAdd1() + " " + u.getSupplAdd2());
			else if (u.getSupplAdd1() == null && u.getSupplAdd2() == null && u.getSupplAdd3() != null)
				ja.put(u.getSupplAdd3());
			else if (u.getSupplAdd1() == null && u.getSupplAdd2() == null && u.getSupplAdd3() == null)
				ja.put("N/A");
			else
				ja.put(u.getSupplAdd1() + " " + u.getSupplAdd2() + " " + u.getSupplAdd3());

			if (u.getPanNo() != null)
				ja.put(u.getPanNo());
			else
				ja.put("N/A");
			if (u.getGstNo() != null)
				ja.put(u.getGstNo());
			else
				ja.put("N/A");

			ja.put("<a href=\"SupplierFormController?operation=show&showId=" + u.getSupplId()
					+ "\"> <i class=\"fa fa-edit\"></i>View</a>");
			array.put(ja);
		}

		try {
			System.out.println(totalRecords);
			result.put("sEcho", SECHO);
			result.put("iTotalRecords", totalRecords);
			result.put("iTotalDisplayRecords", totalRecords);
			result.put("aaData", array);
		} catch (Exception e) {
			System.out.println("N-O-N-E");
		}
		return result;
	}

}
