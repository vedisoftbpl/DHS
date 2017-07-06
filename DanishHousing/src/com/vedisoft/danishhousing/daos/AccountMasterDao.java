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
import com.vedisoft.danishhousing.pojos.AccountMaster;

public class AccountMasterDao {
	public int create(AccountMaster accountmaster) {
		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "insert into account_master	" + " ("
					+ " anx_cd, accode, acname, address, acclass, opdte, opbal,"
					+ "mbal, pexp, ixpge, flag, projcd) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, accountmaster.getAnxCd());
			ps.setString(2, accountmaster.getAcCode());
			ps.setString(3, accountmaster.getAcName());
			ps.setString(4, accountmaster.getAddress());
			ps.setString(5, accountmaster.getAcClass());
			java.sql.Date opdte = null;
			if(accountmaster.getOpdte() != null)
				opdte =  new java.sql.Date(accountmaster.getOpdte().getTime());
			ps.setDate(6, opdte);
			ps.setDouble(7, accountmaster.getOpBal());
			ps.setDouble(8, accountmaster.getmBal());
			ps.setString(9, accountmaster.getPexp());
			ps.setString(10, accountmaster.getIxpge());
			ps.setString(11, accountmaster.getFlag());
			ps.setInt(12, accountmaster.getProjCd());
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

	public boolean edit(AccountMaster accountmaster) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "update account_master set  anx_cd=?, accode =?, acname=?, address = ?, acclass=? ,"
					+ "opdte = ?, opbal=?, mbal=?, pexp=?,"
					+ " ixpge=?, flag=? , projcd=?  where account_master_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, accountmaster.getAnxCd());
			ps.setString(2, accountmaster.getAcCode());
			ps.setString(3, accountmaster.getAcName());
			ps.setString(4, accountmaster.getAddress());
			ps.setString(5, accountmaster.getAcClass());
			java.sql.Date opdte = null;
			if (accountmaster.getOpdte() != null)
				opdte = new java.sql.Date(accountmaster.getOpdte().getTime());
			ps.setDate(6, opdte);
			ps.setDouble(7, accountmaster.getOpBal());
			ps.setDouble(8, accountmaster.getmBal());
			ps.setString(9, accountmaster.getPexp());
			ps.setString(10, accountmaster.getIxpge());
			ps.setString(11, accountmaster.getFlag());
			ps.setInt(12, accountmaster.getProjCd());
			ps.setInt(13, accountmaster.getMasterAccountId());

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
			String sql = "delete from account_master where account_master_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			int x = ps.executeUpdate();
			if (x == 0)
				return false;
		} catch (SQLException sq) {
			return false;
		}
		System.out.println("Record Successfully Deleted");
		return true;
	}

	public AccountMaster find(int userId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		AccountMaster accountmaster = new AccountMaster();
		try {
			String sql = "select * from account_master where account_master_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				accountmaster.setMasterAccountId(userId);
				accountmaster.setAnxCd(rs.getInt("anx_cd"));
				accountmaster.setAcCode(rs.getString("accode"));
				accountmaster.setAcName(rs.getString("acname"));
				accountmaster.setAddress(rs.getString("address"));
				accountmaster.setAcClass(rs.getString("acclass"));
				java.sql.Date opdte = rs.getDate("opdte");
				if (opdte != null)
					accountmaster.setOpdte(new java.util.Date(opdte.getTime()));
				accountmaster.setOpBal(rs.getDouble("opbal"));
				accountmaster.setmBal(rs.getDouble("mbal"));
				accountmaster.setPexp(rs.getString("pexp"));
				accountmaster.setIxpge(rs.getString("ixpge"));
				accountmaster.setFlag(rs.getString("flag"));
				accountmaster.setProjCd(rs.getInt("projcd"));
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return accountmaster;
	}

	public ArrayList<AccountMaster> findAll() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<AccountMaster> listAccountMaster = new ArrayList<AccountMaster>();
		try {
			String sql = "select * from account_master";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				AccountMaster accountmaster = new AccountMaster();
				accountmaster.setMasterAccountId(rs.getInt("account_master_id"));
				accountmaster.setAnxCd(rs.getInt("anx_cd"));

				accountmaster.setAcCode(rs.getString("accode"));
				accountmaster.setAcName(rs.getString("acname"));
				accountmaster.setAddress(rs.getString("address"));

				accountmaster.setAcClass(rs.getString("acclass"));

				java.sql.Date opdte = rs.getDate("opdte");

				if (opdte != null)
					accountmaster.setOpdte(new java.util.Date(opdte.getTime()));

				accountmaster.setOpBal(rs.getDouble("opbal"));

				accountmaster.setmBal(rs.getDouble("mbal"));
				accountmaster.setPexp(rs.getString("pexp"));
				accountmaster.setIxpge(rs.getString("ixpge"));

				accountmaster.setFlag(rs.getString("flag"));
				accountmaster.setProjCd(rs.getInt("projcd"));
				listAccountMaster.add(accountmaster);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row.");
		} finally {
			pool.putConnection(conn);
		}
		return listAccountMaster;
	}

	public ArrayList<AccountMaster> findAll(int start, int num) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<AccountMaster> listAccountMaster = new ArrayList<AccountMaster>();
		try {
			String sql = "select * from account_master limit ? , ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, start - 1);
			ps.setInt(2, num);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				AccountMaster accountmaster = new AccountMaster();
				accountmaster.setMasterAccountId(rs.getInt("account_master_id"));
				accountmaster.setAnxCd(rs.getInt("anx_cd"));
				accountmaster.setAcCode(rs.getString("accode"));
				accountmaster.setAcName(rs.getString("acname"));
				accountmaster.setAddress(rs.getString("address"));
				accountmaster.setAcClass(rs.getString("acclass"));
				java.sql.Date opdte = rs.getDate("opdte");
				if (opdte != null)
					accountmaster.setOpdte(new java.util.Date(opdte.getTime()));
				accountmaster.setOpBal(rs.getDouble("opbal"));
				accountmaster.setmBal(rs.getDouble("mbal"));
				accountmaster.setPexp(rs.getString("pexp"));
				accountmaster.setIxpge(rs.getString("ixpge"));
				accountmaster.setFlag(rs.getString("flag"));
				accountmaster.setProjCd(rs.getInt("projcd"));
				listAccountMaster.add(accountmaster);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row.");
		} finally {
			pool.putConnection(conn);
		}
		return listAccountMaster;
	}

	public static void main(String[] args) {
		AccountMasterDao dao = new AccountMasterDao();
		// System.out.println(new Date());
		// Date d1 = new Date();
		// d1 = DateUtils.convertDate("01-04-2001");
		// Date d2 = new Date();
		// d1 = DateUtils.convertDate("25-07-1996");
		// AccountMaster u = new AccountMaster(1,001,"A0001","AUDIT
		// PAYABLE","","L",d1,0.00,0.00,"","","",0 );
		// dao.create(u);
		//
		// AccountMaster u = new AccountMaster();
		// u.setMasterAccountId(1);;
		//
		// u.setDesignation("Designation 2");
		// u.setEmail("email2@gmai.com");
		// u.setAcName("AUDIT FEES PAYABLE");;
		// u.setMobile("9874563121");
		// u.setName("Name 2");
		// u.setPassword("Password 2");
		// u.setPhoto("avavtar5.png");
		// u.setStatus("Status 2");
		//
		// u.setUserType("User Type 2");
		// dao.edit(u);

		// dao.remove(3);

		// AccountMaster u = dao.find(1);
		// System.out.println(u);
		//
		List<AccountMaster> list = dao.findAll();
		for (AccountMaster u1 : list)
			System.out.println(u1);
		//
		// List<AccountMaster> list2 = dao.findAll(1, 2);
		// for(AccountMaster u2 : list2)
		// System.out.println(u);
		//
	}
}
