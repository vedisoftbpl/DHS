package com.vedisoft.danishhousing.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.vedisoft.danishhousing.config.ConnectionPool;
import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.pojos.Account;
import com.vedisoft.danishhousing.pojos.TransactionRecords;
import com.vedisoft.danishhousing.pojos.TrialBalanceDto;

public class AccountDao {
	public int create(Account account) {
		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "insert into accounts" + " ("
					+ " co_code, bk_code, bk_name, op_date, op_bal, receipt, payment,"
					+ "cl_bal, ifsc, branch) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, account.getCoCode());
			ps.setString(2, account.getBkCode());
			ps.setString(3, account.getBkName());
			java.sql.Date opDate = null;
			if (account.getOpDate() != null)
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
			if (account.getOpDate() != null)
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
				if (rs.getDate("op_date") != null)
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

	public Account findByBankCode(String bankCode) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		Account account = new Account();
		try {
			String sql = "select * from accounts where bk_code = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, bankCode);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				account.setAccountId(rs.getInt("account_id"));
				account.setCoCode(rs.getString("co_code"));
				account.setBkCode(bankCode);
				account.setBkName(rs.getString("bk_name"));
				account.setOpBal(rs.getDouble("op_bal"));
				account.setReceipt(rs.getDouble("receipt"));
				java.sql.Date opDate = null;
				if (rs.getDate("op_date") != null)
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
				if (rs.getDate("op_date") != null)
					opDate = rs.getDate("op_date");
				account.setOpDate(new java.util.Date(opDate.getTime()));

				account.setPayment(rs.getDouble("payment"));
				account.setClBal(rs.getDouble("cl_bal"));
				account.setIfsc(rs.getString("ifsc"));
				account.setBranch(rs.getString("branch"));
				listAccount.add(account);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find data.");
		} finally {
			pool.putConnection(conn);
		}
		return listAccount;
	}

	public static String bankInitials(String bkName) {
		String bkIn = new String();
		String[] parts = bkName.split(" ");
		for (String s : parts) {
			if (s != null && !s.isEmpty())
				bkIn = bkIn + s.charAt(0);
		}

		return bkIn;
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
				if (rs.getDate("op_date") != null)
					opDate = rs.getDate("op_date");
				account.setOpDate(new java.util.Date(opDate.getTime()));

				account.setPayment(rs.getDouble("payment"));
				account.setClBal(rs.getDouble("cl_bal"));
				account.setIfsc(rs.getString("ifsc"));
				account.setBranch(rs.getString("branch"));
				listAccount.add(account);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find row.");
		} finally {
			pool.putConnection(conn);
		}
		return listAccount;
	}
	
	public HashMap<String, String> findAllInMap() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		HashMap<String, String> m = new HashMap<String, String>();
		try {
			String sql = "select bk_code, bk_name from accounts";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				m.put(rs.getString("bk_code"), rs.getString("bk_name"));
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row.");
		} finally {
			pool.putConnection(conn);
		}
		return m;
	}
	public HashMap<String, String> findAllBankNameInitialInMap() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		HashMap<String, String> m = new HashMap<String, String>();
		try {
			String sql = "select bk_code, bk_name from accounts";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				m.put(rs.getString("bk_code"), bankInitials(rs.getString("bk_name")));
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find row.");
		} finally {
			pool.putConnection(conn);
		}
		return m;
	}

//	public ArrayList<TrialBalanceDto> findReceiptTransactionRecord(Date d1, Date d2) {
//		ConnectionPool pool = ConnectionPool.getInstance();
//		pool.initialize();
//		Connection conn = pool.getConnection();
//		ArrayList<TrialBalanceDto> listTransaction = new ArrayList<TrialBalanceDto>();
//		try {
//			String sql = "select sum(amt) as total_deposit, accode  from transaction_records where doctype= 'D'"
//					+ " and docdte between ? and ?  group by accode";
//			PreparedStatement ps = conn.prepareStatement(sql);
//			java.sql.Date date1 = null;
//			if (d1 != null)
//				date1 = new java.sql.Date(d1.getTime());
//			else
//				return null;
//			java.sql.Date date2 = null;
//			if (d2 != null)
//				date2 = new java.sql.Date(d2.getTime());
//			else
//				return null;
//			ps.setDate(1, date1);
//			ps.setDate(2, date2);
//			ResultSet rs = ps.executeQuery();
//			while (rs.next()) {
//				TrialBalanceDto dto = new TrialBalanceDto();
//				dto.setAmount(rs.getDouble("total_deposit"));
//				dto.setAcCode(rs.getString("accode"));
//				dto.setAcName(AccountMasterDao.findByCode(rs.getString("accode")).getAcName());
//			}
//		} catch (SQLException sq) {
//			System.out.println("Unable to find a row." + sq);
//		} finally {
//			pool.putConnection(conn);
//		}
//		return listTransaction;
//	}
//
//	public ArrayList<TranscationRecords> findPaymentTransactionRecord(Date d1, Date d2) {
//		ConnectionPool pool = ConnectionPool.getInstance();
//		pool.initialize();
//		Connection conn = pool.getConnection();
//		ArrayList<TrialBalanceDto> listTransaction = new ArrayList<TrialBalanceDto>();
//		try {
//			String sql = "select sum(amt) as total_deposit, accode  from transaction_records where doctype= 'W'"
//					+ " and docdte between ? and ?  group by accode";
//			PreparedStatement ps = conn.prepareStatement(sql);
//			java.sql.Date date1 = null;
//			if (d1 != null)
//				date1 = new java.sql.Date(d1.getTime());
//			else
//				return null;
//			java.sql.Date date2 = null;
//			if (d2 != null)
//				date2 = new java.sql.Date(d2.getTime());
//			else
//				return null;
//			ps.setDate(1, date1);
//			ps.setDate(2, date2);
//			ResultSet rs = ps.executeQuery();
//			while (rs.next()) {
//				TrialBalanceDto dto = new TrialBalanceDto();
//				dto.setAmount(rs.getDouble("total_deposit"));
//				dto.setAcCode(rs.getString("accode"));
//				dto.setAcName(AccountMasterDao.findByCode(rs.getString("accode")).getAcName());
//			}
//		} catch (SQLException sq) {
//			System.out.println("Unable to find a row." + sq);
//		} finally {
//			pool.putConnection(conn);
//		}
//		return listTransaction;
//	}

	public HashMap<String, Double> findAllBalance() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		HashMap<String, Double> b = new HashMap<String, Double>();
		try {
			String sql = "SELECT bk_name,(coalesce(a.credit,0.00) - coalesce(b.debit,0.00) + coalesce(ac.op_bal,0.00)) as OpBal "
					+ "FROM accounts ac left outer join ((SELECT bkcode ,sum(amt) as credit from transaction_records t where "
					+ "docdte <= ?  and doctype = 'D' group by bkcode) a,"
					+ "(SELECT bkcode ,sum(amt) as debit FROM transaction_records"
					+ " t  where docdte <= ? and doctype = 'W' group by bkcode) b) on bk_code= a.bkcode and a.bkcode=b.bkcode group by bk_code";

			PreparedStatement ps = conn.prepareStatement(sql);
			java.sql.Date date1 = null;

			date1 = new java.sql.Date(new Date().getTime());

			System.out.println(date1);
			ps.setDate(1, date1);
			ps.setDate(2, date1);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				b.put(rs.getString("bk_name"), rs.getDouble("OpBal"));
			}
		} catch (SQLException sq) {
			System.out.println("Unable to fetch balance");
			sq.printStackTrace();
		} finally {
			pool.putConnection(conn);
		}
		return b;
	}

	public String findBankCodebyName(String bankName) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		String bkCode = new String();
		try {
			String sql = "select bk_code from accounts where bk_name = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, bankName);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				bkCode = rs.getString("bk_code");
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return bkCode;
	}

	public HashMap<String, Double> findAllBalanceByDate(Date date) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		HashMap<String, Double> b = new HashMap<String, Double>();
		try {
			String sql = "SELECT bk_name,(coalesce(a.credit,0.00) - coalesce(b.debit,0.00) + coalesce(ac.op_bal,0.00)) as OpBal "
					+ "FROM accounts ac left outer join ((SELECT bkcode ,sum(amt) as credit from transaction_records t where "
					+ "docdte <= ?  and doctype = 'D' group by bkcode) a,"
					+ "(SELECT bkcode ,sum(amt) as debit FROM transaction_records"
					+ " t  where docdte <= ? and doctype = 'W' group by bkcode) b) on bk_code= a.bkcode and a.bkcode=b.bkcode group by bk_code";

			PreparedStatement ps = conn.prepareStatement(sql);
			java.sql.Date date1 = null;

			date1 = new java.sql.Date(date.getTime());

			System.out.println(date1);
			ps.setDate(1, date1);
			ps.setDate(2, date1);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				b.put(rs.getString("bk_name"), rs.getDouble("OpBal"));
			}
		} catch (SQLException sq) {
			System.out.println("Unable to fetch balance");
			sq.printStackTrace();
		} finally {
			pool.putConnection(conn);
		}
		return b;
	}

	public ArrayList<TrialBalanceDto> findAllBankBalanceByDate(Date date, String type) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<TrialBalanceDto> bankList = new ArrayList<TrialBalanceDto>();
		try {
			String sql = "SELECT bk_name,(coalesce(a.credit,0.00) - coalesce(b.debit,0.00) + coalesce(ac.op_bal,0.00)) as OpBal "
					+ "FROM accounts ac left outer join ((SELECT bkcode ,sum(amt) as credit from transaction_records t where "
					+ "docdte <= ?  and doctype = 'D' group by bkcode) a,"
					+ "(SELECT bkcode ,sum(amt) as debit FROM transaction_records"
					+ " t  where docdte <= ? and doctype = 'W' group by bkcode) b) on bk_code= a.bkcode and a.bkcode=b.bkcode group by bk_code";

			PreparedStatement ps = conn.prepareStatement(sql);
			java.sql.Date date1 = null;

			date1 = new java.sql.Date(date.getTime());

			System.out.println(date1);
			ps.setDate(1, date1);
			ps.setDate(2, date1);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrialBalanceDto dto = new TrialBalanceDto();
				if (type.equals("opBal")){
					dto.setRecAmount((rs.getDouble("OpBal")));
					dto.setPayAmount(0.0);
				}else if(type.equals("clsBal")){
					dto.setPayAmount((rs.getDouble("OpBal")));
					dto.setRecAmount(0.0);
				}
				dto.setAcName((rs.getString("bk_name")));
				dto.setAcCode(new AccountDao().findBankCodebyName((rs.getString("bk_name"))));
				bankList.add(dto);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to fetch balance");
			sq.printStackTrace();
		} finally {
			pool.putConnection(conn);
		}
		return bankList;
	}
	public ArrayList<TrialBalanceDto> findAllBankBalanceByDateWithShortName(Date date, String type) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<TrialBalanceDto> bankList = new ArrayList<TrialBalanceDto>();
		try {
			String sql = "SELECT bk_name,(coalesce(a.credit,0.00) - coalesce(b.debit,0.00) + coalesce(ac.op_bal,0.00)) as OpBal "
					+ "FROM accounts ac left outer join ((SELECT bkcode ,sum(amt) as credit from transaction_records t where "
					+ "docdte <= ?  and doctype = 'D' group by bkcode) a,"
					+ "(SELECT bkcode ,sum(amt) as debit FROM transaction_records"
					+ " t  where docdte <= ? and doctype = 'W' group by bkcode) b) on bk_code= a.bkcode and a.bkcode=b.bkcode group by bk_code";

			PreparedStatement ps = conn.prepareStatement(sql);
			java.sql.Date date1 = null;

			date1 = new java.sql.Date(date.getTime());

			System.out.println(date1);
			ps.setDate(1, date1);
			ps.setDate(2, date1);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrialBalanceDto dto = new TrialBalanceDto();
				if (type.equals("opBal")){
					dto.setRecAmount((rs.getDouble("OpBal")));
					dto.setPayAmount(0.0);
				}else if(type.equals("clsBal")){
					dto.setPayAmount((rs.getDouble("OpBal")));
					dto.setRecAmount(0.0);
				}
				dto.setAcName(bankInitials(rs.getString("bk_name")));
				dto.setAcCode(new AccountDao().findBankCodebyName((rs.getString("bk_name"))));
				bankList.add(dto);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to fetch balance");
			sq.printStackTrace();
		} finally {
			pool.putConnection(conn);
		}
		return bankList;
	}
	
	public static void main(String[] args) {
		AccountDao dao = new AccountDao();
		// System.out.println(new Date());
		// Date d1 = new Date();
		// d1 = DateUtils.convertDate("01-04-2017");
		// Date d2 = new Date();
		// d1 = DateUtils.convertDate("25-07-1996");
		// Account u = new
		// Account("Christopher","SBI0089","SBI",d1,45,50,55,60,"SBI1234","Neemuch");
		// dao.create(u);
		//
		// Account u = new Account();
		// u.setAccountId(1);
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
		// dao.edit(u);

		// dao.remove(3);

		// Account u = dao.find(1);
		// System.out.println(u);

		// List<Account> list = dao.findAll();
		// for(Account u1 : list)
		// System.out.println(u);

		// List<Account> list2 = dao.findAll(1, 1);
		// for(Account u2 : list2)
		// System.out.println(u);

		 HashMap<String, String> balance = new AccountDao().findAllBankNameInitialInMap();
		 System.out.println(balance);

	}

	public ArrayList<String> findAll(String name) {
		System.out.println("In AutoComplete Bank");
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<String> listAccount = new ArrayList<String>();
		try {
			String sql = "select bk_name,bk_code from accounts where bk_name like '%" + name + "%' or bk_code like '%"
					+ name + "%'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String account = new String();
				System.out.println("Found: " + rs.getString("bk_name") + " : " + rs.getString("bk_code"));
				account = rs.getString("bk_name") + " : " + rs.getString("bk_code");
				listAccount.add(account);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row.");
		} finally {
			pool.putConnection(conn);
		}
		return listAccount;
	}

	public static String findBankNameFromCode(String bkcode) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		String bkname = new String();

		try {
			String sql = "select bk_name from accounts where bk_code = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, bkcode);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bkname = rs.getString("bk_name");
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a record." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return bkname;
	}

}
