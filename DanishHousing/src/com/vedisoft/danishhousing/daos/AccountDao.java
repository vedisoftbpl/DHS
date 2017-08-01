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
import com.vedisoft.danishhousing.pojos.Account;

public class AccountDao {
	public int create(Account account) {
		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "insert into accounts" + " (" + " co_code, bk_code, bk_name, op_date, op_bal, receipt, payment,"
					+ "cl_bal, ifsc, branch) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, account.getCoCode());
			ps.setString(2, account.getBkCode());
			ps.setString(3, account.getBkName());
			java.sql.Date opDate = null;
			if(account.getOpDate() != null)
			opDate = new java.sql.Date(account.getOpDate().getTime());
			ps.setDate(4, opDate);
			ps.setDouble(5, account.getOpBal());
			ps.setDouble(6, account.getReceipt());
			ps.setDouble(7, account.getPayment());
			ps.setDouble(8, account.getClBal());
			ps.setString(9, account.getIfsc());
			ps.setString(10, account.getBranch());
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

	public boolean edit(Account account) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "update accounts set  co_code=?, bk_code =?, bk_name=?, op_date = ?, op_bal=? ,"
					+ "receipt = ?, payment=?, cl_bal=?, ifsc=?," + " branch=? where account_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, account.getCoCode());
			ps.setString(2, account.getBkCode());
			ps.setString(3, account.getBkName());
			java.sql.Date opDate = null;
			if(account.getOpDate() != null)
			opDate = new java.sql.Date(account.getOpDate().getTime());
			ps.setDate(4, opDate);
			ps.setDouble(5, account.getOpBal());
			ps.setDouble(6, account.getReceipt());
			ps.setDouble(7, account.getPayment());
			ps.setDouble(8, account.getClBal());
			ps.setString(9, account.getIfsc());
			ps.setString(10, account.getBranch());
			ps.setInt(11, account.getAccountId());
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

	public boolean remove(int accountId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "delete from account where account_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, accountId);
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

	public Account find(int accountId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		Account account = new Account();
		try {
			String sql = "select * from accounts where account_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, accountId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				account.setAccountId(accountId);
				account.setCoCode(rs.getString("co_code"));
				account.setBkCode(rs.getString("bk_code"));
				account.setBkName(rs.getString("bk_name"));
				account.setOpBal(rs.getDouble("op_bal"));
				account.setReceipt(rs.getDouble("receipt"));
				java.sql.Date opDate = null;
				if(rs.getDate("op_date") != null)
				opDate = rs.getDate("op_date");
				account.setOpDate(new java.util.Date(opDate.getTime()));
				account.setReceipt(rs.getDouble("receipt"));
				account.setPayment(rs.getDouble("payment"));
				account.setClBal(rs.getDouble("cl_bal"));
				account.setIfsc(rs.getString("ifsc"));
				account.setBranch(rs.getString("branch"));
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return account;
	}

	public ArrayList<Account> findAll() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<Account> listAccount = new ArrayList<Account>();
		try {
			String sql = "select * from accounts";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Account account = new Account();
				account.setAccountId(rs.getInt("account_id"));
				account.setCoCode(rs.getString("co_code"));
				account.setBkCode(rs.getString("bk_code"));
				account.setBkName(rs.getString("bk_name"));
				account.setOpBal(rs.getDouble("op_bal"));
				account.setReceipt(rs.getDouble("receipt"));
				java.sql.Date opDate = null;
				if(rs.getDate("op_date") != null)
				opDate = rs.getDate("op_date");
				account.setOpDate(new java.util.Date(opDate.getTime()));
				
				account.setPayment(rs.getDouble("payment"));
				account.setClBal(rs.getDouble("cl_bal"));
				account.setIfsc(rs.getString("ifsc"));
				account.setBranch(rs.getString("branch"));
				listAccount.add(account);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row.");
		} finally {
			pool.putConnection(conn);
		}
		return listAccount;
	}

	public ArrayList<Account> findAll(int start, int num) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<Account> listAccount = new ArrayList<Account>();
		try {
			String sql = "select * from accounts limit ? , ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, start - 1);
			ps.setInt(2, num);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Account account = new Account();
				account.setAccountId(rs.getInt("account_id"));
				account.setCoCode(rs.getString("co_code"));
				account.setBkCode(rs.getString("bk_code"));
				account.setBkName(rs.getString("bk_name"));
				account.setOpBal(rs.getDouble("op_bal"));
				account.setReceipt(rs.getDouble("receipt"));
				java.sql.Date opDate = null;
				if(rs.getDate("op_date") != null)
				opDate = rs.getDate("op_date");
				account.setOpDate(new java.util.Date(opDate.getTime()));
				
				account.setPayment(rs.getDouble("payment"));
				account.setClBal(rs.getDouble("cl_bal"));
				account.setIfsc(rs.getString("ifsc"));
				account.setBranch(rs.getString("branch"));
				listAccount.add(account);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row.");
		} finally {
			pool.putConnection(conn);
		}
		return listAccount;
	}


	public static void main(String[] args) {
		AccountDao dao = new AccountDao();
		//System.out.println(new Date());
//		Date d1 = new Date();
//		d1 = DateUtils.convertDate("01-04-2017");
//		Date d2 = new Date();
//		d1 = DateUtils.convertDate("25-07-1996");
//		Account u = new Account("Christopher","SBI0089","SBI",d1,45,50,55,60,"SBI1234","Neemuch");
//		 dao.create(u);
		//
//		 Account u = new Account();
//		 u.setAccountId(1);
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
//		 dao.edit(u);
		
		// dao.remove(3);
		
		 Account u = dao.find(1);
		 System.out.println(u);
		
		 List<Account> list = dao.findAll();
		 for(Account u1 : list)
		 System.out.println(u);
		
		 List<Account> list2 = dao.findAll(1, 1);
		 for(Account u2 : list2)
		 System.out.println(u);
		

	}
}
