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
import com.vedisoft.danishhousing.pojos.MenuProcessDto;
import com.vedisoft.danishhousing.pojos.ProcessDto;
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

			if (userType.equals("Administrator")) {
				System.out.println("admin");
				ArrayList<String> rights = RightsDao.findAllPages();
				for (String s : rights)
					System.out.println(s);
				session.setAttribute("userRights", rights);
				ArrayList<ProcessDto> processList = RightsDao.findAllProcess();
				ArrayList<MenuProcessDto> menuList = new ArrayList<MenuProcessDto>();
				ArrayList<ProcessDto> pDto = new ArrayList<ProcessDto>();
				String menu = "Master Data";
				System.out.println(menu);
				for (ProcessDto p : processList) {
					if (!(p.getMenu().equals(menu))) {
							System.out.println("Menu :" + p.getMenu());
							ArrayList<ProcessDto> tempPDto = new ArrayList<ProcessDto>(pDto);
							MenuProcessDto mDto = new MenuProcessDto();
							System.out.println(tempPDto);
							mDto.setSubMenu(tempPDto);
							mDto.setMenu(menu);
							menuList.add(mDto);
							// System.out.println(menuList);
							pDto.clear();
							menu = p.getMenu();
						}
						pDto.add(p);
				}
				System.out.println(menuList);
				session.setAttribute("menuList", menuList);
			} else {
				System.out.println("Not admin");
				ArrayList<String> rights = RightsDao.findPages(userType);
				session.setAttribute("userRights", rights);
				ArrayList<ProcessDto> processList = RightsDao.findAllProcess(userType);
				ArrayList<MenuProcessDto> menuList = new ArrayList<MenuProcessDto>();
				ArrayList<ProcessDto> pDto = new ArrayList<ProcessDto>();
				String menu = "Master Data";
				for (ProcessDto p : processList) {
		
						if (!(p.getMenu().equals(menu))) {
							ArrayList<ProcessDto> tempPDto = new ArrayList<ProcessDto>(pDto);
							MenuProcessDto mDto = new MenuProcessDto();
							mDto.setSubMenu(tempPDto);
							mDto.setMenu(menu);
							menuList.add(mDto);
							pDto.clear();
							menu = p.getMenu();
						}
						pDto.add(p);

				}
				session.setAttribute("menuList", menuList);
			}
			// if (userType.equals("Administrator")) {
			page = "/pages/admin/UserHome.jsp";
			// }
		} else {
			page = "../../index.jsp?error=1";
		}
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
}
