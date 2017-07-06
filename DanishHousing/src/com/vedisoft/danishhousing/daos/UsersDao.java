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
import com.vedisoft.danishhousing.pojos.Users;

public class UsersDao {
	
	public int create(Users users) {
		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "insert into users" + " (" + " name, email, password, designation, mobile, status, doj,"
					+ "dob, photo, created_by, user_type, address) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, users.getName());

			ps.setString(2, users.getEmail());
			ps.setString(3, users.getPassword());
			ps.setString(4, users.getDesignation());
			ps.setString(5, users.getMobile());
			ps.setString(6, users.getStatus());
			java.sql.Date doj = new java.sql.Date(users.getDoj().getTime());
			ps.setDate(7, doj);
			java.sql.Date dob = new java.sql.Date(users.getDob().getTime());
			ps.setDate(8, dob);	
			ps.setString(9, users.getPhoto());
			ps.setString(10, users.getCreatedBy());
			ps.setString(11, users.getUserType());
			ps.setString(12, users.getAddress());
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

	public boolean edit(Users users) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "update users set  name=?, email =?, password=?, designation = ?, mobile=? ,"
					+ "status = ?, doj=?, dob=?, photo=?," + " created_by=?, user_type=? , address=?  where user_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, users.getName());

			ps.setString(2, users.getEmail());
			ps.setString(3, users.getPassword());
			ps.setString(4, users.getDesignation());
			ps.setString(5, users.getMobile());
			ps.setString(6, users.getStatus());
			java.sql.Date doj = new java.sql.Date(users.getDoj().getTime());
			ps.setDate(7, doj);
			java.sql.Date dob = new java.sql.Date(users.getDob().getTime());
			ps.setDate(8, dob);	
			ps.setString(9, users.getPhoto());
			ps.setString(10, users.getCreatedBy());
			ps.setString(11, users.getUserType());
			ps.setString(12, users.getAddress());
			ps.setInt(13, users.getUserId());

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

	public boolean remove(int userId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "delete from users where user_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
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

	public Users find(int userId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		Users users = new Users();
		try {
			String sql = "select * from users where user_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				users.setUserId(userId);
				users.setName(rs.getString("name"));
				users.setEmail(rs.getString("email"));
				users.setPassword(rs.getString("password"));
				users.setDesignation(rs.getString("designation"));
				users.setMobile(rs.getString("mobile"));
				users.setStatus(rs.getString("status"));
				java.sql.Date doj = rs.getDate("doj");
				users.setDoj(new java.util.Date(doj.getTime()));
				java.sql.Date dob = rs.getDate("dob");
				users.setDob(new java.util.Date(dob.getTime()));
				users.setPhoto(rs.getString("photo"));
				users.setCreatedBy(rs.getString("created_by"));
				users.setUserType(rs.getString("user_type"));
				users.setAddress(rs.getString("address"));
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return users;
	}

	public ArrayList<Users> findAll() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<Users> listUsers = new ArrayList<Users>();
		try {
			String sql = "select * from users";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Users users = new Users();
				users.setUserId(rs.getInt("user_id"));
				users.setName(rs.getString("name"));
				users.setEmail(rs.getString("email"));
				users.setPassword(rs.getString("password"));
				users.setDesignation(rs.getString("designation"));
				users.setMobile(rs.getString("mobile"));
				users.setStatus(rs.getString("status"));
				java.sql.Date doj = rs.getDate("doj");
				users.setDoj(new java.util.Date(doj.getTime()));
				java.sql.Date dob = rs.getDate("dob");
				users.setDob(new java.util.Date(dob.getTime()));
				users.setPhoto(rs.getString("photo"));
				users.setCreatedBy(rs.getString("created_by"));
				users.setUserType(rs.getString("user_type"));
				users.setAddress(rs.getString("address"));
				listUsers.add(users);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row.");
		} finally {
			pool.putConnection(conn);
		}
		return listUsers;
	}

	public ArrayList<Users> findAll(int start, int num) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<Users> listUsers = new ArrayList<Users>();
		try {
			String sql = "select * from users limit ? , ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, start - 1);
			ps.setInt(2, num);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Users users = new Users();
				users.setUserId(rs.getInt("user_id"));
				users.setName(rs.getString("name"));
				users.setEmail(rs.getString("email"));
				users.setPassword(rs.getString("password"));
				users.setDesignation(rs.getString("designation"));
				users.setMobile(rs.getString("mobile"));
				users.setStatus(rs.getString("status"));
				java.sql.Date doj = rs.getDate("doj");
				users.setDoj(new java.util.Date(doj.getTime()));
				java.sql.Date dob = rs.getDate("dob");
				users.setDob(new java.util.Date(dob.getTime()));
				users.setPhoto(rs.getString("photo"));
				users.setCreatedBy(rs.getString("created_by"));
				users.setUserType(rs.getString("user_type"));
				users.setAddress(rs.getString("address"));
				listUsers.add(users);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row.");
		} finally {
			pool.putConnection(conn);
		}
		return listUsers;
	}

	public static int verify(String email, String password, String userType) {
		int id = -1;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "select user_id from users where email=? and password=? and user_type=? and status='Active'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ps.setString(3, userType);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				id = rs.getInt("user_id");
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return id;

	}

	public static void main(String[] args) {
		UsersDao dao = new UsersDao();
		//System.out.println(new Date());
//		Date d1 = new Date();
//		d1 = DateUtils.convertDate("01-04-2017");
//		Date d2 = new Date();
//		d1 = DateUtils.convertDate("25-07-1996");
//		Users u = new Users("Christopher","christopherrozario7@gmail.com","root","Engineer","9131449948","Active",d1,d2,"Govind garden","","","Administrator"  );
//		 dao.create(u);
		//
		// Users u = new Users();
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
		
//		 Users u = dao.find(4);
//		 System.out.println(u);
//		
//		 List<Users> list = dao.findAll();
//		 for(Users u : list)
//		 System.out.println(u);
		
//		 List<Users> list2 = dao.findAll(1, 2);
//		 for(Users u : list2)
//		 System.out.println(u);
//		
//		 int userId = UsersDao.verify("christopherrozario7@gmail.com",
//		 "root","Administrator");
//		 System.out.println(userId);
//		 System.out.println("User Id");
		//
	}

}
