package com.vedisoft.danishhousing.servlets.models;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.daos.AccountDao;
import com.vedisoft.danishhousing.daos.MembersDao;
import com.vedisoft.danishhousing.daos.UsersDao;
import com.vedisoft.danishhousing.pojos.Account;
import com.vedisoft.danishhousing.pojos.Users;

/**
 * Servlet implementation class UserFormController
 */
@SuppressWarnings("serial")
@WebServlet("/admin/pages/UserFormController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
		maxFileSize = 1024 * 1024 * 25, // 25 MB
		maxRequestSize = 1024 * 1024 * 50) // 50 MB

public class UserFormController extends HttpServlet {
	private static final String SAVE_DIR = "photos";
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserFormController() {
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
		int id = 0;
		if (request.getParameter("showId") != null && request.getParameter("showId").trim().length() > 0) {
			id = Integer.parseInt(request.getParameter("showId"));
		}

		String userName = new String();
		if (request.getParameter("userFullName") != null && request.getParameter("userFullName").trim().length() > 0) {
			userName = request.getParameter("userFullName");
		}

		String userEmail = new String();
		if (request.getParameter("userEmail") != null && request.getParameter("userEmail").trim().length() > 0) {
			userEmail = request.getParameter("userEmail");
		}

		String userPassword = new String();
		if (request.getParameter("userPassword") != null && request.getParameter("userPassword").trim().length() > 0) {
			userPassword = request.getParameter("userPassword");
		}

		String userMobile = new String();
		if (request.getParameter("userMobile") != null && request.getParameter("userMobile").trim().length() > 0) {
			userMobile = request.getParameter("userMobile");
		}

		Date dob = new Date();
		// System.out.println(request.getParameter("datepicker1"));
		if (request.getParameter("datepicker1") != null && request.getParameter("datepicker1").trim().length() > 0) {
			dob = DateUtils.convertDate(request.getParameter("datepicker1"));
		}
		Date doj = new Date();
		if (request.getParameter("datepicker2") != null && request.getParameter("datepicker2").trim().length() > 0) {
			doj = DateUtils.convertDate(request.getParameter("datepicker2"));
		}

		String userDesignation = new String();
		if (request.getParameter("userDesignation") != null
				&& request.getParameter("userDesignation").trim().length() > 0) {
			userDesignation = request.getParameter("userDesignation");
		}

		String userCreatedBy = new String();
		if (request.getParameter("userCreatedBy") != null
				&& request.getParameter("userCreatedBy").trim().length() > 0) {
			userCreatedBy = request.getParameter("userCreatedBy");
		}

		// System.out.println(userCreatedBy + "1111");
		String userFormAddress = new String();
		if (request.getParameter("userFormAddress") != null
				&& request.getParameter("userFormAddress").trim().length() > 0) {
			userFormAddress = request.getParameter("userFormAddress");
		}

		String userType = new String();
		if (request.getParameter("userType") != null && request.getParameter("userType").trim().length() > 0) {
			userType = request.getParameter("userType");
		}

		String userStatus = new String();
		if (request.getParameter("userStatus") != null && request.getParameter("userStatus").trim().length() > 0) {
			userStatus = request.getParameter("userStatus");
		}

		String userPhoto = new String();
		if (request.getParameter("userPhoto") != null && request.getParameter("userPhoto").trim().length() > 0) {
			userPhoto = request.getParameter("userPhoto");
		}

		String operation = new String();
		if (request.getParameter("operation") != null && request.getParameter("operation").trim().length() > 0) {
			operation = request.getParameter("operation");
		}

		String page = "/pages/admin/UserForm.jsp";
		String page1 = "/pages/admin/UserViewForm.jsp";
		String page2 = "UserTableController";
		HttpSession session = request.getSession();
		Users user = null;
		if (session != null) {
			user = (Users) session.getAttribute("userLogin");
		}

		if (operation.equals("create")) {

			String appPath = request.getServletContext().getRealPath("") + "pages\\";
			String savePath = appPath + SAVE_DIR;
			System.out.println(appPath);
			File fileSaveDir = new File(savePath);
			String renamedFileName = new String();
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
			}
			Collection<Part> allUploadedParts = request.getParts();
			int i = 0;
			for (Part part : allUploadedParts) {
				// Part: class represents a part as uploaded to the server as
				// part
				// of a
				// multipart/form-data request body. The part may represent
				// either
				// an
				// uploaded file or form data.

				// 2: Retain only file parts and not any form parts
				// Get name of File

				String fileName = part.getSubmittedFileName();

				if (fileName == null)
					continue;

				// 3: Write the file to the disk
				// convenience method to write an uploaded part to disk.

				part.write(savePath + File.separator + fileName);
				File f1 = new File(savePath + File.separator + fileName);
				int index = fileName.lastIndexOf(".");
				String primary = fileName.substring(0, index);
				String secondary = fileName.substring(index);
				renamedFileName = primary + System.currentTimeMillis() + secondary;
				String renamed = savePath + File.separator + renamedFileName;
				File f2 = new File(renamed);
				f1.renameTo(f2);
				i++;
			}

			userPhoto = renamedFileName;
			System.out.println(userPhoto);

			UsersDao dao = new UsersDao();
			System.out.println("Data :" + userName + userEmail + userPassword);
			Users u = new Users(userName, userEmail, userPassword, userDesignation, userMobile, userStatus, doj, dob,
					userFormAddress, userPhoto, userCreatedBy, userType);
			System.out.println(u);
			int a = 0;
			a = dao.create(u);
			request.setAttribute("createdby", user.getName());
			if (a > 0)
				response.sendRedirect("/DanishHousing" + page + "?msg=1");
			else
				response.sendRedirect("/DanishHousing" + page + "?msg=2");
			// RequestDispatcher rd = request.getRequestDispatcher(page +
			// "?msg=1");
			// rd.forward(request, response);
		} else if (operation.equals("edit")) {

			String appPath = request.getServletContext().getRealPath("") + "pages\\";
			String savePath = appPath + SAVE_DIR;
			System.out.println(appPath);
			File fileSaveDir = new File(savePath);
			String renamedFileName = new String();
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
			}
			String oldFile = new UsersDao().find(id).getPhoto();
			Collection<Part> allUploadedParts = request.getParts();
			int i = 0;
			boolean uploaded = false;
			for (Part part : allUploadedParts) {
				// Part: class represents a part as uploaded to the server as
				// part
				// of a
				// multipart/form-data request body. The part may represent
				// either
				// an
				// uploaded file or form data.

				// 2: Retain only file parts and not any form parts
				// Get name of File

				String fileName = part.getSubmittedFileName();
				System.out.println("file: " + fileName);
				if (fileName == null || fileName == "")
					continue;

				// 3: Write the file to the disk
				// convenience method to write an uploaded part to disk.

				part.write(savePath + File.separator + fileName);
				File f1 = new File(savePath + File.separator + fileName);
				int index = fileName.lastIndexOf(".");
				String primary = fileName.substring(0, index);
				String secondary = fileName.substring(index);
				renamedFileName = primary + System.currentTimeMillis() + secondary;
				String renamed = savePath + File.separator + renamedFileName;
				File f2 = new File(renamed);
				uploaded = f1.renameTo(f2);
				i++;
			}
			if (uploaded == true) {
				File f3 = new File(savePath + File.separator + oldFile);
				f3.delete();
				userPhoto = renamedFileName;
				System.out.println(userPhoto);
			} else {
				userPhoto = oldFile;
			}

			UsersDao dao = new UsersDao();
			System.out.println("Data :" + userName + userEmail + userPassword);
			Users u = new Users(id, userName, userEmail, userPassword, userDesignation, userMobile, userStatus, doj,
					dob, userFormAddress, userPhoto, userCreatedBy, userType);
			System.out.println(u);
			boolean status = false;
			status = dao.edit(u);
			request.setAttribute("createdby", user.getName());
			if (status == true)
				response.sendRedirect( page2 + "?msg=1");
			else
				response.sendRedirect( page2 + "?msg=2");
			// RequestDispatcher rd = request.getRequestDispatcher(page +
			// "?msg=1");
			// rd.forward(request, response);

		} else if (operation.equals("show")) {
			UsersDao dao = new UsersDao();
			Users u = new Users();
			u = dao.find(id);
			System.out.println(u);
			request.setAttribute("user", u);
			RequestDispatcher rd = request.getRequestDispatcher(page1);
			rd.forward(request, response);

		} else {

			// System.out.println(userName + userEmail + " 1");

			request.setAttribute("createdby", user.getName());
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);

		}

	}

}
