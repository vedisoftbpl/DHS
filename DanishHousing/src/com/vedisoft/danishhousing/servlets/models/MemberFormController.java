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
import com.vedisoft.danishhousing.daos.MembersDao;
import com.vedisoft.danishhousing.daos.ProjectsDao;
import com.vedisoft.danishhousing.daos.UsersDao;
import com.vedisoft.danishhousing.pojos.AccountMasterFlagsEnum;
import com.vedisoft.danishhousing.pojos.Members;
import com.vedisoft.danishhousing.pojos.Projects;
import com.vedisoft.danishhousing.pojos.Users;

/**
 * Servlet implementation class MemberFormController
 */
@SuppressWarnings("serial")
@WebServlet("/admin/pages/MemberFormController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
maxFileSize = 1024 * 1024 * 25, // 25 MB
maxRequestSize = 1024 * 1024 * 50) // 50 MB

public class MemberFormController extends HttpServlet {
	private static final String SAVE_DIR = "photos";
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFormController() {
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
		
		
		int id =0;
		if(request.getParameter("showId") != null && request.getParameter("showId").trim().length() > 0) {
		 id = Integer.parseInt(request.getParameter("showId"));
			}
		
		
		String prefix = new String();
		if(request.getParameter("prefix")!= null && request.getParameter("prefix").trim().length() > 0) {
			prefix = request.getParameter("prefix");
		}
		
		String memberFullName = new String();
		if(request.getParameter("memberFullName")!= null && request.getParameter("memberFullName").trim().length() > 0) {
			memberFullName = request.getParameter("memberFullName");
		}
		
		String relation = new String();
		if(request.getParameter("relation")!= null && request.getParameter("relation").trim().length() > 0) {
			relation = request.getParameter("relation");
		}
		
		String relativeFullName = new String();
		if(request.getParameter("relativeFullName")!= null && request.getParameter("relativeFullName").trim().length() > 0) {
			relativeFullName = request.getParameter("relativeFullName");
		}
		
		Date dob = new Date();
		if (request.getParameter("dob") != null && request.getParameter("dob").trim().length() > 0) {
			dob = DateUtils.convertDate(request.getParameter("dob"));
			//System.out.println(request.getParameter("dob"));
		}
		
		String memberEmail = new String();
		if(request.getParameter("memberEmail")!= null && request.getParameter("memberEmail").trim().length() > 0) {
			memberEmail = request.getParameter("memberEmail");
		}
		
		String memberOccupation = new String();
		if(request.getParameter("memberOccupation")!= null && request.getParameter("memberOccupation").trim().length() > 0) {
			memberOccupation = request.getParameter("memberOccupation");
		}
		
		String memberPhone = new String();
		if(request.getParameter("memberPhone")!= null && request.getParameter("memberPhone").trim().length() > 0) {
			memberPhone = request.getParameter("memberPhone");
		}
		
		String memberAdhaar = new String();
		if(request.getParameter("memberAdhaar")!= null && request.getParameter("memberAdhaar").trim().length() > 0) {
			memberAdhaar = request.getParameter("memberAdhaar");
		}
		
		String memberPhoto = new String();
		if(request.getParameter("memberPhoto")!= null && request.getParameter("memberPhoto").trim().length() > 0) {
			memberPhoto = request.getParameter("memberPhoto");
		}
		
		String memberAddress1 = new String();
		if(request.getParameter("memberAddress1")!= null && request.getParameter("memberAddress1").trim().length() > 0) {
			memberAddress1 = request.getParameter("memberAddress1");
		}
		
		String memberAddress2 = new String();
		if(request.getParameter("memberAddress2")!= null && request.getParameter("memberAddress2").trim().length() > 0) {
			memberAddress2 = request.getParameter("memberAddress2");
		}
		
		String memberCity = new String();
		if(request.getParameter("memberCity")!= null && request.getParameter("memberCity").trim().length() > 0) {
			memberCity = request.getParameter("memberCity");
		}
		
		String addressProof = new String();
		if(request.getParameter("addressProof")!= null && request.getParameter("addressProof").trim().length() > 0) {
			addressProof = request.getParameter("addressProof");
		}
		
		String memberNomineeName = new String();
		if(request.getParameter("memberNomineeName")!= null && request.getParameter("memberNomineeName").trim().length() > 0) {
			memberNomineeName = request.getParameter("memberNomineeName");
		}
		
		String memberNomineeRelation = new String();
		if(request.getParameter("memberNomineeRelation")!= null && request.getParameter("memberNomineeRelation").trim().length() > 0) {
			memberNomineeRelation = request.getParameter("memberNomineeRelation");
		}
		
		int membershipFee = 0;
		if(request.getParameter("membershipFee")!= null && request.getParameter("membershipFee").trim().length() > 0) {
			membershipFee = Integer.parseInt(request.getParameter("membershipFee"));
		}
		
		int entranceFee = 0;
		if(request.getParameter("entranceFee")!= null && request.getParameter("entranceFee").trim().length() > 0) {
			entranceFee = Integer.parseInt(request.getParameter("entranceFee"));
		}
		
		String operation = new String();
		if(request.getParameter("operation")!= null && request.getParameter("operation").trim().length() > 0) {
			operation = request.getParameter("operation");
		}
		
		int projectCd = 0;
		if(request.getParameter("projectCode")!= null && request.getParameter("projectCode").trim().length() > 0) {
			projectCd = Integer.parseInt(request.getParameter("projectCode"));
		}
		
		
		String plotSize = new String();
		if(request.getParameter("plotSize")!= null && request.getParameter("plotSize").trim().length() > 0) {
			plotSize  = request.getParameter("plotSize");
		}
		
		float netPlotSize=0;
		if(request.getParameter("netPlotSize")!= null && request.getParameter("netPlotSize").trim().length() > 0) {
			netPlotSize = Float.parseFloat(request.getParameter("netPlotSize"));
		}
		
		
		String plotNo = new String();
		if(request.getParameter("plotNo")!= null && request.getParameter("plotNo").trim().length() > 0) {
			plotNo  = request.getParameter("plotNo");
		}
		
		Date receiptdt = new Date();
		if (request.getParameter("datepicker1") != null && request.getParameter("datepicker1").trim().length() > 0) {
			receiptdt = DateUtils.convertDate(request.getParameter("datepicker1"));
			
		}
		
		char rC='\u0000';
		if(request.getParameter("residentialCommercial")!= null && request.getParameter("residentialCommercial").trim().length() > 0) {
			rC  = request.getParameter("residentialCommercial").charAt(0);
		}
		
		
		char liveDead='\u0000';
		if(request.getParameter("memberStatus")!= null && request.getParameter("memberStatus").trim().length() > 0) {
			liveDead  = request.getParameter("memberStatus").charAt(0);
		}
		
		double diversion=0;
		if (request.getParameter("diversion") != null && request.getParameter("diversion").trim().length() > 0) {
			diversion = Double.parseDouble(request.getParameter("diversion"));
		}
		
		double extraAmount=0;
		if (request.getParameter("extraAmount") != null && request.getParameter("extraAmount").trim().length() > 0) {
			extraAmount = Double.parseDouble(request.getParameter("extraAmount"));
		}
		
		
		double cost=0;
		if (request.getParameter("cost") != null && request.getParameter("cost").trim().length() > 0) {
			cost = Double.parseDouble(request.getParameter("cost"));
		}
		
		
		ProjectsDao pdao = new ProjectsDao();
		request.setAttribute("projectList", pdao.findAll());
		request.setAttribute("enumList", AccountMasterFlagsEnum.values());
		
		
		String page = "/pages/admin/MembershipForm.jsp";
		String page1= "/pages/admin/MembershipViewForm.jsp";
		String page2= "MemberTableController";
		HttpSession session = request.getSession();
		Users user = null;
		if (session != null) {
			user = (Users) session.getAttribute("userLogin");
		}
		
		if(operation.equals("create")){
			
			String appPath = request.getServletContext().getRealPath("") + "pages\\";
			String savePath = appPath +  SAVE_DIR;
			System.out.println(appPath );
			File fileSaveDir = new File(savePath);
			String renamedFileName = new String();
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
			}
			String oldFile = new MembersDao().find(id).getPhoto();
			Collection<Part> allUploadedParts = request.getParts();
			int i = 0;
			boolean uploaded = false;
			for (Part part : allUploadedParts) {
				// Part: class represents a part as uploaded to the server as part
				// of a
				// multipart/form-data request body. The part may represent either
				// an
				// uploaded file or form data.

				// 2: Retain only file parts and not any form parts
				// Get name of File

				String fileName = part.getSubmittedFileName();

				if (fileName == null || fileName == "")
					continue;

				// 3: Write the file to the disk
				// convenience method to write an uploaded part to disk.

				part.write(savePath + File.separator + fileName);
				File f1 = new File(savePath + File.separator + fileName);
				int index = fileName.lastIndexOf(".");
				String primary = fileName.substring(0, index);
				String secondary = fileName.substring(index);
				renamedFileName =  primary + System.currentTimeMillis() + secondary;
				String renamed = savePath + File.separator + renamedFileName;
				File f2 = new File(renamed);
				uploaded = f1.renameTo(f2);
				i++;
			}
			
			if (uploaded == true) {
				File f3 = new File(savePath + File.separator + oldFile);
				f3.delete();
				memberPhoto = renamedFileName;
				System.out.println(memberPhoto);
			} else {
				memberPhoto = oldFile;
			}
			memberPhoto = renamedFileName;
			System.out.println(memberPhoto);
			
			MembersDao dao = new MembersDao();
			Members m = new Members(prefix, memberFullName, memberAddress1, memberAddress2, memberCity,
					memberOccupation, relation, relativeFullName, memberNomineeRelation, memberNomineeName,
					membershipFee, entranceFee, new Date(), 'L', memberPhone, memberEmail, dob,
					memberPhoto, addressProof, memberAdhaar, new Date(), user.getUserId());
			System.out.println(m);
			int a = 0;
			a = dao.create(m);
			if(a > 0)
				response.sendRedirect("/DanishHousing" + page + "?msg=1");
			else
				response.sendRedirect("/DanishHousing" + page + "?msg=2");
		}
		else if(operation.equals("show")){
			MembersDao dao = new MembersDao();
			Members m = new Members();
			m = dao.find(id);
			request.setAttribute("member",m);
			RequestDispatcher rd = request.getRequestDispatcher(page1);
			rd.forward(request, response);
		}
		else if(operation.equals("edit")){
			String appPath = request.getServletContext().getRealPath("") + "pages\\";
			String savePath = appPath +  SAVE_DIR;
			System.out.println(appPath );
			File fileSaveDir = new File(savePath);
			String renamedFileName = new String();
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
			}
			String oldFile = new MembersDao().find(id).getPhoto();
			Collection<Part> allUploadedParts = request.getParts();
			int i = 0;
			for (Part part : allUploadedParts) {
				// Part: class represents a part as uploaded to the server as part
				// of a
				// multipart/form-data request body. The part may represent either
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
				renamedFileName =  primary + System.currentTimeMillis() + secondary;
				String renamed = savePath + File.separator + renamedFileName;
				File f2 = new File(renamed);
				f1.renameTo(f2);
				i++;
			}
			File f3 = new File(savePath + File.separator + oldFile);
			f3.delete();
			
			memberPhoto = renamedFileName;
			System.out.println(memberPhoto);
			
			MembersDao dao = new MembersDao();
			Members m = new Members(id,projectCd,plotSize,netPlotSize,plotNo,prefix, memberFullName, memberAddress1, memberAddress2, memberCity,
					memberOccupation, relation, relativeFullName, memberNomineeRelation, memberNomineeName,
					membershipFee, entranceFee, receiptdt,rC, liveDead,diversion, extraAmount,  cost ,memberPhone, memberEmail, dob,
					memberPhoto, addressProof, memberAdhaar);
			System.out.println(m);
			Boolean b = dao.edit(m);
			if (b) {
				RequestDispatcher rd = request.getRequestDispatcher(page2);
				request.setAttribute("msg", 1);
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher(page2);
				request.setAttribute("msg", 2);
				rd.forward(request, response);
			}
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		
	}

}
