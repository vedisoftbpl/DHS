package com.vedisoft.danishhousing.servlets.models;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.daos.AccountMasterDao;
import com.vedisoft.danishhousing.daos.MembersDao;
import com.vedisoft.danishhousing.daos.ProjectsDao;
import com.vedisoft.danishhousing.pojos.AccountMaster;
import com.vedisoft.danishhousing.pojos.ProjectTypeEnum;
import com.vedisoft.danishhousing.pojos.AccountMasterFlagsEnum;
import com.vedisoft.danishhousing.pojos.Members;
import com.vedisoft.danishhousing.pojos.Projects;

/**
 * Servlet implementation class MasterAccountTableController
 */
@WebServlet("/admin/pages/MasterAccountTableController")
public class MasterAccountTableController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	 private String GLOBAL_SEARCH_TERM;
	 private String COLUMN_NAME;
	 private String DIRECTION;
	 private int INITIAL;
	 private int SECHO;
	 private int RECORD_SIZE;
    public MasterAccountTableController() {
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
		

		String[] columnNames = { "accode", "acname", "acclass", "flag", "projcd" };
		 
		  JSONObject jsonResult = new JSONObject();
		
		  
		  int pageNo = 0;
		  if(request.getParameter("iDisplayStart") != null && request.getParameter("iDisplayStart").trim().length() > 0 )
			  pageNo = Integer.parseInt(request.getParameter("iDisplayStart"));
		  
		  int sEcho = 0;
		  if(request.getParameter("sEcho") != null && request.getParameter("sEcho").trim().length() > 0 )
			  sEcho = Integer.parseInt(request.getParameter("sEcho"));
		  
		  int pageSize = 20;
		  if(request.getParameter("iDisplayLength") != null && request.getParameter("iDisplayLength").trim().length() > 0 )
			  if (Integer.parseInt(request.getParameter("iDisplayLength")) > 10 || Integer.parseInt(request.getParameter("iDisplayLength")) < 50)
			  pageSize = Integer.parseInt(request.getParameter("iDisplayLength"));
		  
		  
		  int colIndex = 0;
		  if(request.getParameter("iSortCol_0") != null && request.getParameter("iSortCol_0").trim().length() > 0 )
			  if (Integer.parseInt(request.getParameter("iSortCol_0")) > 0 || Integer.parseInt(request.getParameter("iSortCol_0")) < 5)
			  colIndex = Integer.parseInt(request.getParameter("iSortCol_0"));
		  
		  String sortDirection = new String();
		  if(request.getParameter("sSortDir_0") != null && request.getParameter("sSortDir_0").trim().length() > 0 )
			  sortDirection = request.getParameter("sSortDir_0");
		
		  String colName = columnNames[colIndex];  
		  int totalRecords= -1;
		  totalRecords = AccountMasterDao.totalRows();
		
		  String globalSearch = "null";
		  if(request.getParameter("sSearch") != null && request.getParameter("sSearch").trim().length() > 0 )
			  globalSearch = request.getParameter("sSearch");
		
		  GLOBAL_SEARCH_TERM = globalSearch;
		  RECORD_SIZE = pageSize;
		  COLUMN_NAME = colName;
		  DIRECTION = sortDirection;
		  INITIAL = pageNo;
		  SECHO = sEcho;
		  System.out.println("Master Account Table:  " + DIRECTION + INITIAL + " " + RECORD_SIZE);
		if(request.getParameter("sSortDir_0") == null ){
			System.out.println("Pass");
			String page = "/pages/admin/AccountMasterTable.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else{
			try {
				System.out.println("Not Pass");
				   jsonResult = getMemberDetails(totalRecords, request);
				  } catch (ClassNotFoundException e) {
				   e.printStackTrace();
				  } catch (SQLException e) {
				   e.printStackTrace();
				  }
				 
				  response.setContentType("application/json");
				  response.setHeader("Cache-Control", "no-store");
				  PrintWriter out = response.getWriter();
				  out.print(jsonResult);
			
		}
		  
		
		
		
		
	
			  
	}
	
	private JSONObject getMemberDetails(int totalRecords, HttpServletRequest request) throws SQLException, ClassNotFoundException {
		 int totalAfterSearch = 5;
		  JSONObject result = new JSONObject();
		  JSONArray array = new JSONArray();
		  ArrayList<AccountMaster> a = new ArrayList<AccountMaster>();
		    
		  if(GLOBAL_SEARCH_TERM != "null")
			  {
			  System.out.println(GLOBAL_SEARCH_TERM);
			  	a = AccountMasterDao.findAll(INITIAL, RECORD_SIZE, GLOBAL_SEARCH_TERM,COLUMN_NAME,DIRECTION );
			  	
			  }
		  else
			  a = AccountMasterDao.findAll(INITIAL, RECORD_SIZE, null,COLUMN_NAME,DIRECTION);
		  for(AccountMaster u : a) {
			  String acclass,flag="N/A",proj;
			  JSONArray ja = new JSONArray();
			  System.out.println(u);
			   ja.put(u.getAcCode());
			   ja.put(u.getAcName());
			   
			   if(u.getAcClass().equals("A"))
				   acclass = "Assests";
			   else if(u.getAcClass().equals("I"))
				   acclass = "Income";
			   else if(u.getAcClass().equals("L"))
				   acclass = "Liability";
			   else if(u.getAcClass().equals("E"))
				   acclass = "Expenses";
			   else acclass = "N/A";
			   ja.put(acclass);
			   
			   for(AccountMasterFlagsEnum ae: AccountMasterFlagsEnum.values())
			   {
				   if(u.getFlag().equals(ae.getValue()))
					   flag = ae.toString();
			   }
			   ja.put(flag);
			   
			   ja.put(u.getProjCd());
			   
			   ja.put("<a href=\"MasterAccountFormController?operation=show&showId="+u.getMasterAccountId()+"\"> <i class=\"fa fa-edit\"></i>View</a>");
			   array.put(ja); 
		  }
		  
		  try {
			  System.out.println(totalRecords);
			  result.put("sEcho",SECHO);
			   result.put("iTotalRecords", totalRecords);
			   result.put("iTotalDisplayRecords", totalRecords);
			   result.put("aaData", array);
			  } catch (Exception e) {
			 System.out.println("N-O-N-E");
			  }
			  return result;
	}
		


}
