package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vedisoft.danishhousing.daos.AccountDao;
import com.vedisoft.danishhousing.daos.MembersDao;
import com.vedisoft.danishhousing.pojos.Account;
import com.vedisoft.danishhousing.pojos.Members;

/**
 * Servlet implementation class MemberTableController
 */
@WebServlet("/admin/pages/MemberTableController")
public class MemberTableController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberTableController() {
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
		MembersDao dao = new MembersDao();
		ArrayList<Members> members = dao.findAll();
		System.out.println(members);
		request.setAttribute("membersList", members);
		String page = "/pages/admin/MembershipTable.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
