package com.vedisoft.danishhousing.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vedisoft.danishhousing.daos.RightsDao;
import com.vedisoft.danishhousing.daos.UsersDao;
import com.vedisoft.danishhousing.pojos.Rights;
import com.vedisoft.danishhousing.pojos.Users;

/**
 * Servlet implementation class UserVerification
 */
@WebServlet("/admin/pages/UserVerification")
public class UserVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserVerification() {
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
		String email = request.getParameter("logEmail");
		String password = request.getParameter("logPass");
		String userType = request.getParameter("logType");
		int userId = UsersDao.verify(email, password, userType);
		String page = new String();
		if (userId != -1) {
			UsersDao usersDao = new UsersDao();
			Users user = usersDao.find(userId);
			HttpSession session = request.getSession();
			session.setAttribute("userLogin", user);
			session.setAttribute("userType", userType);
			System.out.println(userType);
			
			if (userType.equals("Administrator")){
				System.out.println("admin");
				ArrayList<Integer> rights=RightsDao.findAllRightsId();
				for(int rt:rights)
					System.out.println(rt);
				session.setAttribute("rights1", rights);
			}else{
				System.out.println("Not admin");
				ArrayList<Integer> rights= RightsDao.findRights(userType);
				for(int rt:rights)
					System.out.println(rt);
				session.setAttribute("rights2", RightsDao.findRights(userType));
			}
			// if (userType.equals("Administrator")) {
			page = "/pages/admin/blank.jsp";
			// }
		} else {
			page = "../../index.jsp?error=1";
		}
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
}
