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

		String prefix = new String();
		if (request.getParameter("prefix") != null && request.getParameter("prefix").trim().length() > 0) {
			prefix = request.getParameter("prefix");
		}

		String memberFullName = new String();
		if (request.getParameter("memberFullName") != null
				&& request.getParameter("memberFullName").trim().length() > 0) {
			memberFullName = request.getParameter("memberFullName");
		}

		String relation = new String();
		if (request.getParameter("relation") != null && request.getParameter("relation").trim().length() > 0) {
			relation = request.getParameter("relation");
		}

		String relativeFullName = new String();
		if (request.getParameter("relativeFullName") != null
				&& request.getParameter("relativeFullName").trim().length() > 0) {
			relativeFullName = request.getParameter("relativeFullName");
		}

		Date dob = null;
		if (request.getParameter("dob") != null && request.getParameter("dob").trim().length() > 0) {
			dob = DateUtils.convertDate(request.getParameter("dob"));
			// System.out.println(request.getParameter("dob"));
		}

		String memberEmail = new String();
		if (request.getParameter("memberEmail") != null && request.getParameter("memberEmail").trim().length() > 0) {
			memberEmail = request.getParameter("memberEmail");
		}

		String memberOccupation = new String();
		if (request.getParameter("memberOccupation") != null
				&& request.getParameter("memberOccupation").trim().length() > 0) {
			memberOccupation = request.getParameter("memberOccupation");
		}

		String memberPhone = new String();
		if (request.getParameter("memberPhone") != null && request.getParameter("memberPhone").trim().length() > 0) {
			memberPhone = request.getParameter("memberPhone");
		}

		String memberAdhaar = new String();
		if (request.getParameter("memberAdhaar") != null && request.getParameter("memberAdhaar").trim().length() > 0) {
			memberAdhaar = request.getParameter("memberAdhaar");
		}

		String memberPAN = new String();
		if (request.getParameter("memberPAN") != null && request.getParameter("memberPAN").trim().length() > 0) {
			memberPAN = request.getParameter("memberPAN");
		}

		String memberPhoto = new String();
		if (request.getParameter("memberPhoto") != null && request.getParameter("memberPhoto").trim().length() > 0) {
			memberPhoto = request.getParameter("memberPhoto");
		}

		String memberAddress1 = new String();
		if (request.getParameter("memberAddress1") != null
				&& request.getParameter("memberAddress1").trim().length() > 0) {
			memberAddress1 = request.getParameter("memberAddress1");
		}

		String memberAddress2 = new String();
		if (request.getParameter("memberAddress2") != null
				&& request.getParameter("memberAddress2").trim().length() > 0) {
			memberAddress2 = request.getParameter("memberAddress2");
		}

		String memberCity = new String();
		if (request.getParameter("memberCity") != null && request.getParameter("memberCity").trim().length() > 0) {
			memberCity = request.getParameter("memberCity");
		}

		String addressProof = new String();
		if (request.getParameter("addressProof") != null && request.getParameter("addressProof").trim().length() > 0) {
			addressProof = request.getParameter("addressProof");
		}
		String memberNomineeName = new String();
		if (request.getParameter("memberNomineeName") != null
				&& request.getParameter("memberNomineeName").trim().length() > 0) {
			memberNomineeName = request.getParameter("memberNomineeName");
		}
		String memberMotherName = new String();
		if (request.getParameter("memberMotherName") != null
				&& request.getParameter("memberMotherName").trim().length() > 0) {
			memberMotherName = request.getParameter("memberMotherName");
		}

		String memberNomineeRelation = new String();
		if (request.getParameter("memberNomineeRelation") != null
				&& request.getParameter("memberNomineeRelation").trim().length() > 0) {
			memberNomineeRelation = request.getParameter("memberNomineeRelation");
		}
		String gender = new String();
		if (request.getParameter("gender") != null && request.getParameter("gender").trim().length() > 0) {
			gender = request.getParameter("gender");
		}
		String category = new String();
		if (request.getParameter("category") != null && request.getParameter("category").trim().length() > 0) {
			category = request.getParameter("category");
		}

		String operation = new String();
		if (request.getParameter("operation") != null && request.getParameter("operation").trim().length() > 0) {
			operation = request.getParameter("operation");
		}

		int projectCd = -1;
		if (request.getParameter("projectCode") != null && request.getParameter("projectCode").trim().length() > 0) {
			projectCd = Integer.parseInt(request.getParameter("projectCode"));
		}

		String plotSize = new String();
		if (request.getParameter("plotSize") != null && request.getParameter("plotSize").trim().length() > 0) {
			plotSize = request.getParameter("plotSize");
		}

		float netPlotSize = 0;
		if (request.getParameter("netPlotSize") != null && request.getParameter("netPlotSize").trim().length() > 0) {
			netPlotSize = Float.parseFloat(request.getParameter("netPlotSize"));
		}

		String plotNo = new String();
		if (request.getParameter("plotNo") != null && request.getParameter("plotNo").trim().length() > 0) {
			plotNo = request.getParameter("plotNo");
		}

		char rC = '\u0000';
		if (request.getParameter("residentialCommercial") != null
				&& request.getParameter("residentialCommercial").trim().length() > 0) {
			rC = request.getParameter("residentialCommercial").charAt(0);
		}
		double establishmentCharge = 0.0;
		if (request.getParameter("establishmentCharge") != null
				&& request.getParameter("establishmentCharge").trim().length() > 0) {
			establishmentCharge = Double.parseDouble(request.getParameter("establishmentCharge"));
		}
		double securityDeposit = 0.0;
		if (request.getParameter("securityDeposit") != null
				&& request.getParameter("securityDeposit").trim().length() > 0) {
			securityDeposit = Double.parseDouble(request.getParameter("securityDeposit"));
		}
		double cost = 0;
		if (request.getParameter("cost") != null && request.getParameter("cost").trim().length() > 0) {
			cost = Double.parseDouble(request.getParameter("cost"));
		}
		String fullPay = new String();
		if (request.getParameter("fullpay") != null && request.getParameter("fullpay").trim().length() > 0) {
			fullPay = request.getParameter("fullpay");
		}
		String inst1 = new String();
		if (request.getParameter("inst1") != null && request.getParameter("inst1").trim().length() > 0) {
			inst1 = request.getParameter("inst1");
		}
		String inst2 = new String();
		if (request.getParameter("inst2") != null && request.getParameter("inst2").trim().length() > 0) {
			inst2 = request.getParameter("inst2");
		}
		String inst3 = new String();
		if (request.getParameter("inst3") != null && request.getParameter("inst3").trim().length() > 0) {
			inst3 = request.getParameter("inst3");
		}

		char liveDead = '\u0000';
		if (request.getParameter("memberStatus") != null && request.getParameter("memberStatus").trim().length() > 0) {
			liveDead = request.getParameter("memberStatus").charAt(0);
		}
		double openingBalance = 0.0;
		if (request.getParameter("openingBalance") != null
				&& request.getParameter("openingBalance").trim().length() > 0) {
			openingBalance = Double.parseDouble(request.getParameter("openingBalance"));
		}
		int membershipFee = 0;
		if (request.getParameter("membershipFee") != null
				&& request.getParameter("membershipFee").trim().length() > 0) {
			membershipFee = Integer.parseInt(request.getParameter("membershipFee"));
		}

		int entranceFee = 0;
		if (request.getParameter("entranceFee") != null && request.getParameter("entranceFee").trim().length() > 0) {
			entranceFee = Integer.parseInt(request.getParameter("entranceFee"));
		}
		Date receiptDt = null;
		if (request.getParameter("receiptdt") != null && request.getParameter("receiptdt").trim().length() > 0) {
			receiptDt = DateUtils.convertDate(request.getParameter("receiptdt"));

		}
		String registered = new String();
		if (request.getParameter("registered") != null && request.getParameter("registered").trim().length() > 0) {
			registered = request.getParameter("registered");
		}
		Date regDt = null;
		if (request.getParameter("regDt") != null && request.getParameter("regDt").trim().length() > 0) {
			regDt = DateUtils.convertDate(request.getParameter("regDt"));

		}
		String registrationNo =new String();
		if (request.getParameter("registrationNo") != null
				&& request.getParameter("registrationNo").trim().length() > 0) {
			registrationNo = request.getParameter("registrationNo");
		}
		Date nocDt = null;
		if (request.getParameter("nocdt") != null && request.getParameter("nocdt").trim().length() > 0) {
			nocDt = DateUtils.convertDate(request.getParameter("nocdt"));

		}
		Date refDt = null;
		if (request.getParameter("refDt") != null && request.getParameter("refDt").trim().length() > 0) {
			refDt = DateUtils.convertDate(request.getParameter("refDt"));

		}
		double referenceAmount = 0;
		if (request.getParameter("referenceAmount") != null
				&& request.getParameter("referenceAmount").trim().length() > 0) {
			referenceAmount = Double.parseDouble(request.getParameter("referenceAmount"));
		}
		double waterConnectionCharge = 0;
		if (request.getParameter("waterConnectionCharge") != null
				&& request.getParameter("waterConnectionCharge").trim().length() > 0) {
			waterConnectionCharge = Double.parseDouble(request.getParameter("waterConnectionCharge"));
		}
		double waterCharge = 0;
		if (request.getParameter("waterCharge") != null && request.getParameter("waterCharge").trim().length() > 0) {
			waterCharge = Double.parseDouble(request.getParameter("waterCharge"));
		}
		Date wtCnDt = null;
		if (request.getParameter("waterConnDate") != null && request.getParameter("waterConnDate").trim().length() > 0) {
			wtCnDt = DateUtils.convertDate(request.getParameter("waterConnDate"));

		}
		double diversion = 0;
		if (request.getParameter("diversion") != null && request.getParameter("diversion").trim().length() > 0) {
			diversion = Double.parseDouble(request.getParameter("diversion"));
		}
		int mutationNo = 0;
		if (request.getParameter("mutationNo") != null && request.getParameter("mutationNo").trim().length() > 0) {
			mutationNo = Integer.parseInt(request.getParameter("mutationNo"));
		}
		Date mutaDt = null;
		if (request.getParameter("mutaDt") != null && request.getParameter("mutaDt").trim().length() > 0) {
			mutaDt = DateUtils.convertDate(request.getParameter("mutaDt"));

		}
		String eligibleIneligible = new String();
		if (request.getParameter("eligibleIneligible") != null
				&& request.getParameter("eligibleIneligible").trim().length() > 0) {
			eligibleIneligible = request.getParameter("eligibleIneligible");
		}
		String buildingFlag = new String();
		if (request.getParameter("buildingFlag") != null && request.getParameter("buildingFlag").trim().length() > 0) {
			buildingFlag = request.getParameter("buildingFlag");
		}
		String memberNominal = new String();
		if (request.getParameter("memberNominal") != null
				&& request.getParameter("memberNominal").trim().length() > 0) {
			memberNominal = request.getParameter("memberNominal");
		}
		String defaulter = new String();
		if (request.getParameter("defaulter") != null && request.getParameter("defaulter").trim().length() > 0) {
			defaulter = request.getParameter("defaulter");
		}

		double extraAmount = 0;
		if (request.getParameter("extraAmount") != null && request.getParameter("extraAmount").trim().length() > 0) {
			extraAmount = Double.parseDouble(request.getParameter("extraAmount"));
		}
		
		double finalamt = 0;
		if (request.getParameter("finalAmount") != null && request.getParameter("finalAmount").trim().length() > 0) {
			finalamt = Double.parseDouble(request.getParameter("finalAmount"));
		}
		double maint = 0;
		if (request.getParameter("maintenance") != null && request.getParameter("maintenance").trim().length() > 0) {
			maint = Double.parseDouble(request.getParameter("maintenance"));
		}
		
		int memAge = 0;
		if (request.getParameter("dob") != null && request.getParameter("dob").trim().length() > 0) {
			dob = DateUtils.convertDate(request.getParameter("dob"));
			memAge=DateUtils.calculateAge(dob);
		}

		ProjectsDao pdao = new ProjectsDao();
		request.setAttribute("projectList", pdao.findAll());
		request.setAttribute("enumList", AccountMasterFlagsEnum.values());

		String page = "/pages/admin/MembershipForm.jsp";
		String page1 = "/pages/admin/MembershipViewForm.jsp";
		String page2 = "MemberTableController";
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
			String oldFile = new MembersDao().find(id).getPhoto();
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

			
			memberPhoto = renamedFileName;
			System.out.println(memberPhoto);

			MembersDao dao = new MembersDao();
			Members m = new Members(prefix, memberFullName, memberAddress1, memberAddress2, memberCity,
					memberOccupation, relation, relativeFullName, memberNomineeRelation, memberNomineeName,
					membershipFee, entranceFee, new Date(), 'L', memberPhone, memberEmail, dob,memberPhoto,
					addressProof, memberAdhaar,memAge, new Date(), user.getUserId());
			System.out.println(m);
			int a = 0;
			a = dao.create(m);
			if (a > 0)
				response.sendRedirect("/DanishHousing" + page + "?msg=1");
			else
				response.sendRedirect("/DanishHousing" + page + "?msg=2");
		} else if (operation.equals("show")) {
			MembersDao dao = new MembersDao();
			Members m = new Members();
			m = dao.find(id);
			request.setAttribute("member", m);
			RequestDispatcher rd = request.getRequestDispatcher(page1);
			rd.forward(request, response);
		} else if (operation.equals("edit")) {
			String appPath = request.getServletContext().getRealPath("") + "pages\\";
			String savePath = appPath + SAVE_DIR;
			System.out.println(appPath);
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
				System.out.println("dfh");
				System.out.println(fileName);
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
				memberPhoto = renamedFileName;
				System.out.println(memberPhoto);
			} else {
				memberPhoto = oldFile;
			}

			
			System.out.println(memberPhoto);

			MembersDao dao = new MembersDao();
			Members m = new Members(id, projectCd, plotSize, netPlotSize, plotNo, prefix, memberFullName,id,
					memberAddress1, memberAddress2, memberCity, memberOccupation, relation, relativeFullName,
					memberNomineeRelation, memberNomineeName, membershipFee, entranceFee, receiptDt, fullPay, inst1,
					inst2, inst3, openingBalance, securityDeposit, waterConnectionCharge, registered, regDt,
					registrationNo, rC, nocDt, liveDead, referenceAmount, refDt, diversion, wtCnDt, finalamt,
					establishmentCharge, waterCharge, extraAmount, cost, memberPhone, memberEmail, dob, memberPhoto,
					addressProof, memberAdhaar, buildingFlag, memberNominal, mutationNo, mutaDt, gender, category,
					defaulter, memberMotherName, memberPAN, eligibleIneligible,maint,memAge, user.getUserId(), new Date());
			// Members m = new Members(id, projectCd, plotSize, netPlotSize,
			// plotNo, prefix, memberFullName,
			// memberAddress1, memberAddress2, memberCity, memberOccupation,
			// relation, relativeFullName,
			// memberNomineeRelation, memberNomineeName, membershipFee,
			// entranceFee, receiptdt, rC, liveDead,
			// diversion, extraAmount, cost, memberPhone, memberEmail, dob,
			// memberPhoto, addressProof,
			// memberAdhaar, user.getUserId(), new Date());
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
		} else {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}

	}

}
