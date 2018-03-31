package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.vedisoft.danishhousing.daos.UtilityDao;

/**
 * Servlet implementation class AutoCompletePageNo
 */
@WebServlet("/AutoCompletePageNo")
public class AutoCompletePageNo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AutoCompletePageNo() {
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
		int pageNo = UtilityDao.startingPageNo();
		System.out.println(pageNo);
		String data =String.valueOf(pageNo);
		response.setContentType("application/text");
		response.getWriter().write(data);
		
	}

}
