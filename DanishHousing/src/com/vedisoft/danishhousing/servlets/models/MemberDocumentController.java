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

import com.vedisoft.danishhousing.daos.MemberDocumentDao;
import com.vedisoft.danishhousing.pojos.MemberDocument;
import com.vedisoft.danishhousing.pojos.Users;

/**
 * Servlet implementation class ContractDocument
 */
@SuppressWarnings("serial")
@WebServlet("/admin/pages/ContractDocumentsController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 25, maxRequestSize = 1024 * 1024
		* 50) // 10mb
public class MemberDocumentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String SAVE_DIR = "photos";
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberDocumentController() {
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
		
		HttpSession session = request.getSession();
		Users user = (Users)session.getAttribute("userLogin");
		String page = "/pages/admin/MemberDocuments.jsp";
		
		String renamedFileName = new String();
		String operation = new String();
		operation = request.getParameter("operation");
		if (operation != null) {

			String docTitle = new String();
			if (request.getParameter("contractDocTitle") != null
					&& request.getParameter("contractDocTitle").trim().length() > 0)
				docTitle = request.getParameter("contractDocTitle");

			String docDetail = new String();
			if (request.getParameter("contractDocDetails") != null
					&& request.getParameter("contractDocDetails").trim().length() > 0)
				docDetail = request.getParameter("contractDocDetails");

			String docFile = new String();
			if (request.getParameter("contractDocFile") != null) {
				docFile = request.getParameter("contractDocFile");
			}
			String appPath = request.getServletContext().getRealPath("") + "pages/";
			String savePath = appPath + SAVE_DIR;
			
			System.out.println(savePath);
			File fileSaveDir = new File(savePath);
			
			if(!fileSaveDir.exists()){
				fileSaveDir.mkdir();
			}
			Collection<Part> allUploadedParts = request.getParts();
			int i =0;
			for(Part part : allUploadedParts) {
				String fileName = part.getSubmittedFileName();
				if(fileName == null)
					continue;
				
				part.write(savePath + File.separator + fileName);
				File f1 = new File(savePath + File.separator + fileName);
				int index = fileName.lastIndexOf(".");
				String primary = fileName.substring(0, index);
				String secondary = fileName.substring(index);
				
				renamedFileName = primary + System.currentTimeMillis() + secondary;
				
				String renamed = savePath + File.separator + renamedFileName;
				File f2 = new File(renamed);
				System.out.println(renamed);
				f1.renameTo(f2);
				i++;
			}
			MemberDocument memberDoc = new MemberDocument();
			memberDoc.setMemberDocumentTitle(docTitle);
			memberDoc.setMemberDocumentDetails(docDetail);
			memberDoc.setMemberDocumentFile(renamedFileName);
			memberDoc.setUserId(user.getUserId());
			memberDoc.setLastUpdate(new Date());
			MemberDocumentDao dao = new MemberDocumentDao();
			
			int a= 0;
			a = dao.create(memberDoc);
			if(a > 0)
				response.sendRedirect("/DanishHousing" + page + "?msg=1" );
			else
				response.sendRedirect("/DanishHousing" + page + "?msg=2");
		}

		else {
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		}
	}

}
