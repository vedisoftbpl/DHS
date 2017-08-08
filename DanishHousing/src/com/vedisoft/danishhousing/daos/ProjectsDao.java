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
import com.vedisoft.danishhousing.pojos.Projects;

public class ProjectsDao {
	
	public int create(Projects projects) {
		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "insert into projects" + " (" + " project_name, bung_plot,opdt) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	
			ps.setString(1, projects.getProjectName());
			ps.setString(2, projects.getBungProject());
			java.sql.Date opdt = null;
			if (projects.getOpDate() != null)
				opdt = new java.sql.Date(projects.getOpDate().getTime());
			ps.setDate(3,opdt);
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
			String sql = "update projects set  project_name=?, bung_plot =? ,opdt = ? where project_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, projects.getProjectName());
			ps.setString(2, projects.getBungProject());
			java.sql.Date opdt = null;
			if (projects.getOpDate() != null)
				opdt = new java.sql.Date(projects.getOpDate().getTime());
			ps.setDate(3,opdt);
			ps.setInt(4, projects.getProjectId());

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
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return projects;
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
				listProjects.add(projects);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row.");
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
				listProjects.add(projects);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row.");
		} finally {
			pool.putConnection(conn);
		}
		return listProjects;
	}

	
	public static void main(String[] args) {
		ProjectsDao dao = new ProjectsDao();
		//System.out.println(new Date());
//		Date d1 = new Date();
//		d1 = DateUtils.convertDate("01/04/2017");
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
		
		 List<Projects> list = dao.findAll();
		 for(Projects u1 : list)
		 System.out.println(u1);
		
//		 List<Projects> list2 = dao.findAll(1, 2);
//		 for(Projects u2 : list2)
//		 System.out.println(u2);
//		
//		 int userId = ProjectsDao.verify("christopherrozario7@gmail.com",
//		 "root","Administrator");
//		 System.out.println(userId);
//		 System.out.println("User Id");
		//
	}

}
