package com.vedisoft.danishhousing.servlets.models;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vedisoft.danishhousing.daos.MemberDocumentDao;
import com.vedisoft.danishhousing.pojos.Users;

/**
 * Servlet implementation class MemberDocumentDownload
 */
@WebServlet("/admin/pages/MemberDocumentDownloadController")
public class MemberDocumentDownloadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "documents";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberDocumentDownloadController() {
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
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("userLogin");
		String page = "/pages/admin/MemberDocumentView.jsp";
		int mDocId = 0,docNo = 0;
		if( request.getParameter("docNo")!= null &&  ((String)request.getParameter("docNo")).trim().length() > 0) {
			System.out.println(request.getParameter("docNo"));
				docNo = Integer.parseInt((String)request.getParameter("docNo"));
			}
		if(docNo > 0){
			String filename = new MemberDocumentDao().findFileFromTitle(docNo);
			System.out.println(filename);
			String filepath = request.getServletContext().getRealPath("") + "pages/" + SAVE_DIR;
			RequestDispatcher rd = request.getRequestDispatcher("<html><head><head><body><img src='filepath "+   File.separator +" filename'></body></html>");
			rd.forward(request, response);
			
			
		} else {
		String operation = new String();
		if (request.getParameter("operation") != null && request.getParameter("memberDocTitle").trim().length() > 0)
			operation = request.getParameter("operation");
		System.out.println(operation);
		if (operation.equals("view")) {
			if (request.getParameter("memberDocTitle") != null
					&& request.getParameter("memberDocTitle").trim().length() > 0)
				mDocId = Integer.parseInt(request.getParameter("memberDocTitle"));
			System.out.println("MemberId = " + mDocId);
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String filename = new MemberDocumentDao().findFileFromTitle(mDocId);
			System.out.println(filename);
			String filepath = request.getServletContext().getRealPath("") + "pages/" + SAVE_DIR;
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
			try {
				FileInputStream fileInputStream = new FileInputStream(filepath +   File.separator + filename);
				int i;

				while ((i = fileInputStream.read()) != -1) {
					out.write(i);
				}

				fileInputStream.close();
				out.close();
			} catch (FileNotFoundException e) {
				request.setAttribute("msg", 2);
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}

		} else {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}
	}
}
