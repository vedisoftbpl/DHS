package com.vedisoft.danishhousing.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.vedisoft.danishhousing.config.ConnectionPool;
import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.pojos.FinancialProjectReportDto;
import com.vedisoft.danishhousing.pojos.ProjectPlotDevReportDto;
import com.vedisoft.danishhousing.pojos.Projects;

public class ProjectsDao {
	
	public int create(Projects projects) {
		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "insert into projects" + " (" + " project_name, bung_plot,opdt,pad1,pad2,pad3) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	
			ps.setString(1, projects.getProjectName());
			ps.setString(2, projects.getBungProject());
			java.sql.Date opdt = null;
			if (projects.getOpDate() != null)
				opdt = new java.sql.Date(projects.getOpDate().getTime());
			ps.setDate(3,opdt);
			ps.setString(4, projects.getPad1());
			ps.setString(5, projects.getPad2());
			ps.setString(6, projects.getPad3());
			int x = ps.executeUpdate();
			if (x == 0) {
				return 0;
			}
			ResultSet generatedKeys = ps.getGeneratedKeys();
			if (generatedKeys.next()) {
				id = generatedKeys.getInt(1);
			}
		} catch (SQLException sq) {
			sq.printStackTrace();
			return 0;
		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Record SuccessFully Added");
		return id;

	}

	public boolean edit(Projects projects) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "update projects set  project_name=?, bung_plot =? ,opdt = ? , pad1 = ?, pad2 = ?, pad3 = ?  where project_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, projects.getProjectName());
			ps.setString(2, projects.getBungProject());
			java.sql.Date opdt = null;
			if (projects.getOpDate() != null)
				opdt = new java.sql.Date(projects.getOpDate().getTime());
			ps.setDate(3,opdt);
			ps.setString(4, projects.getPad1());
			ps.setString(5, projects.getPad2());
			ps.setString(6, projects.getPad3());
			ps.setInt(7, projects.getProjectId());

			int x = ps.executeUpdate();
			if (x == 0) {
				System.out.println("Record not Saved");
				return false;
			}
		} catch (SQLException sq) {
			sq.printStackTrace();
			return false;
		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Record SuccessFully Updated");
		return true;
	}

	public boolean remove(int projectId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "delete from projects where project_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, projectId);
			int x = ps.executeUpdate();
			if (x == 0)
				return false;
		} catch (SQLException sq) {
			return false;
		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Record Successfully Deleted");
		return true;
	}

	public Projects find(int projectId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		Projects projects = new Projects();
		try {
			String sql = "select * from projects where project_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, projectId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				projects.setProjectId(projectId);
				projects.setProjectName(rs.getString("project_name"));
				projects.setBungProject(rs.getString("bung_plot"));
				java.sql.Date opdt = rs.getDate("opdt");
				if (opdt != null)
					projects.setOpDate(new java.util.Date((opdt).getTime()));
				else
					projects.setOpDate(opdt);
				projects.setPad1(rs.getString("pad1"));
				projects.setPad2(rs.getString("pad2"));
				projects.setPad3(rs.getString("pad3"));
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return projects;
	}
	public ArrayList<FinancialProjectReportDto> financialProjectReport(int projectId,Date clsDate) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<FinancialProjectReportDto> projectRepList=new ArrayList<FinancialProjectReportDto>();
		try {
			String sql = "SELECT * FROM members where projcd = ?  and recedte <= ? and live_dead='L'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, projectId);
			ps.setDate(2, new java.sql.Date(clsDate.getTime()));
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				FinancialProjectReportDto projectRep=new FinancialProjectReportDto();
				projectRep.setMemberNo(rs.getInt("membno"));
				projectRep.setMemberName(rs.getString("prefix")+ " "+rs.getString("membnme"));
				projectRep.setPlotSize(rs.getString("plsize"));
				projectRep.setPlotNo(rs.getString("plno"));
				projectRep.setExtraWork(rs.getDouble("extamt"));
				projectRep.setPlotCost(rs.getDouble("cost"));
				projectRep.setTotalCost(projectRep.getPlotCost()+projectRep.getExtraWork());
				projectRep.setRecAmount(ReceiptDao.findTotalRecAmtByMember(projectRep.getMemberNo(),projectId,clsDate));
				projectRep.setrefAmount(RefundPaymentDao.findTotalRecRefund(projectRep.getMemberNo(),clsDate));
				projectRep.setBalAmount(projectRep.getTotalCost()-projectRep.getrefAmount()-projectRep.getRecAmount());
				projectRepList.add(projectRep);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return projectRepList;
	}
	
	public ArrayList<ProjectPlotDevReportDto> projectPlotDevReport(int projectId,Date clsDate) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<ProjectPlotDevReportDto> projectRepList=new ArrayList<ProjectPlotDevReportDto>();
		try {
			String sql = "SELECT * FROM members where projcd = ?  and recedte <= ? and live_dead='L'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, projectId);
			ps.setDate(2, new java.sql.Date(clsDate.getTime()));
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProjectPlotDevReportDto projectRep=new ProjectPlotDevReportDto();
				projectRep.setMembNo(rs.getInt("membno"));
				projectRep.setMembName(rs.getString("prefix")+ " "+rs.getString("membnme"));
				projectRep.setPlotSize(rs.getString("plsize"));
				projectRep.setPlotNo(rs.getString("plno"));
				projectRep.setPlotCost(ReceiptDao.findTotalPlotCostOfMember(projectRep.getMembNo(),projectId,clsDate));
				projectRep.setPlotRefund(RefundPaymentDao.findTotalPlotRefund(projectRep.getMembNo(),clsDate));
				projectRep.setDevCost(ReceiptDao.findTotalDevCostOfMember(projectRep.getMembNo(),projectId,clsDate));
				projectRep.setDevRefund(RefundPaymentDao.findTotalDevRefund(projectRep.getMembNo(),clsDate));
				projectRep.setTotal((projectRep.getPlotCost()-projectRep.getPlotRefund())+(projectRep.getDevCost()-projectRep.getDevRefund()));
				projectRepList.add(projectRep);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return projectRepList;
	}
	
	public  ArrayList<Projects> findAll() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<Projects> listProjects = new ArrayList<Projects>();
		try {
			String sql = "select * from projects";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Projects projects = new Projects();
				projects.setProjectId(rs.getInt("project_id"));
				projects.setProjectName(rs.getString("project_name"));
				projects.setBungProject(rs.getString("bung_plot"));
				java.sql.Date opdt = rs.getDate("opdt");
				if (opdt != null)
					projects.setOpDate(new java.util.Date((opdt).getTime()));
				else
					projects.setOpDate(opdt);
				projects.setPad1(rs.getString("pad1"));
				projects.setPad2(rs.getString("pad2"));
				projects.setPad3(rs.getString("pad3"));
				listProjects.add(projects);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find row.");
		} finally {
			pool.putConnection(conn);
		}
		return listProjects;
	}

	public ArrayList<Projects> findAll(int start, int num) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<Projects> listProjects = new ArrayList<Projects>();
		try {
			String sql = "select * from projects limit ? , ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, start - 1);
			ps.setInt(2, num);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Projects projects = new Projects();
				projects.setProjectId(rs.getInt("project_id"));
				projects.setProjectName(rs.getString("project_name"));
				projects.setBungProject(rs.getString("bung_plot"));
				java.sql.Date opdt = rs.getDate("opdt");
				if (opdt != null)
					projects.setOpDate(new java.util.Date((opdt).getTime()));
				else
					projects.setOpDate(opdt);
				projects.setPad1(rs.getString("pad1"));
				projects.setPad2(rs.getString("pad2"));
				projects.setPad3(rs.getString("pad3"));
				listProjects.add(projects);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row.");
		} finally {
			pool.putConnection(conn);
		}
		return listProjects;
	}

	public ArrayList<String> findAll(String name) {
		System.out.println("In AutoComplete");
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<String> listProject = new ArrayList<String>();
		try {
			String sql = "select project_name,project_id from projects where project_name like '%"+name+"%' or project_id like '%"+name+"%'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String project = new String();
				System.out.println("Found: " + rs.getString("project_name") + " : " + rs.getString("project_id"));
				project = rs.getString("project_name")+ " : " + rs.getString("project_id");
				listProject.add(project);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find row.");
		} finally {
			pool.putConnection(conn);
		}
		return listProject;
	}
	
	public static void main(String[] args) {
//		ProjectsDao dao = new ProjectsDao();
		//System.out.println(new Date());
//		Date d1 = new Date();
//		d1 = DateUtils.convertDate("11/04/2017");
//		Date d2 = new Date();
//		d1 = DateUtils.convertDate("25-07-1996");
//		Projects u = new Projects("Christo Enclave New","B",d1);
//		System.out.println(u); 
//		dao.create(u);
		//
		// Projects u = new Projects();
		 //u.setUserId(4);
		//
		// u.setDesignation("Designation 2");
		// u.setEmail("email2@gmai.com");
		// u.setLastUpdate(new Date());
		// u.setMobile("9874563121");
		// u.setName("Name 2");
		// u.setPassword("Password 2");
		// u.setPhoto("avavtar5.png");
		// u.setStatus("Status 2");
		//
		// u.setUserType("User Type 2");
	//	 dao.edit(u);
		
		// dao.remove(3);
//		Projects y = new Projects();
//		 y = dao.find(4);
//		 System.out.println(y);
		
//		 List<Projects> list = dao.findAll();
//		 for(Projects u1 : list)
//		 System.out.println(u1);
		
//		 List<Projects> list2 = dao.findAll(1, 2);
//		 for(Projects u2 : list2)
//		 System.out.println(u2);
//		
//		 int userId = ProjectsDao.verify("christopherrozario7@gmail.com",
//		 "root","Administrator");
//		 System.out.println(userId);
//		 System.out.println("User Id");
		//
//		List<FinancialProjectReportDto> list=new ProjectsDao().financialProjectReport(36, d1);
//		System.out.println(list);
	}

}
