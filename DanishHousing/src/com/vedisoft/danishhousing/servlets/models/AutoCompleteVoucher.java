package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.vedisoft.danishhousing.daos.AccountMasterDao;

/**
 * Servlet implementation class AutoCompleteVoucher
 */
@WebServlet("/AutoCompleteVoucher")
public class AutoCompleteVoucher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AutoCompleteVoucher() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountMasterDao dao = new AccountMasterDao();
		String s = new String();
		if (request.getParameter("val") != null && request.getParameter("val").trim().length() > 0)
			s = request.getParameter("val");
		System.out.println("AutoFill: " + s);
		ArrayList<String> ar = dao.findAll(s);
		JSONArray json = new JSONArray(ar);
		response.setContentType("application/json");
		response.getWriter().print(json);
		
	}

}
