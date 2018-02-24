package com.vedisoft.danishhousing.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

import com.vedisoft.danishhousing.config.ConnectionPool;
import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.pojos.ReceiptRecord;
import com.vedisoft.danishhousing.pojos.TransactionRecords;
import com.vedisoft.danishhousing.pojos.TrialBalanceDto;
import com.vedisoft.danishhousing.pojos.Users;
import com.vedisoft.danishhousing.pojos.CashBankBookDto;
import com.vedisoft.danishhousing.pojos.DailyTransactionDto;

public class TransactionRecordsDao {

	public ArrayList<TransactionRecords> findMemTransactionRecord(int memberNo) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<TransactionRecords> listTransaction = new ArrayList<TransactionRecords>();
		try {
			String sql = "select * from transaction_records where membno = ? and flag = 3";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, memberNo);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TransactionRecords transaction = new TransactionRecords();
				transaction.setsNo(rs.getInt("s_no"));
				transaction.setSlno(rs.getInt("slno"));
				transaction.setDocNo(rs.getInt("docno"));
				java.sql.Date docDate = rs.getDate("docdte");
				if (docDate != null)
					transaction.setDocDte(new java.util.Date((docDate).getTime()));
				else
					transaction.setDocDte(docDate);
				transaction.setDocType(rs.getString("doctype"));
				transaction.setAcCode(rs.getString("accode"));
				transaction.setBkCode(rs.getString("bkcode"));
				transaction.setChqNo(rs.getString("chqno"));
				java.sql.Date chDate = rs.getDate("ch_date");
				if (chDate != null)
					transaction.setChDate(new java.util.Date((chDate).getTime()));
				else
					transaction.setChDate(chDate);
				transaction.setBankBr(rs.getString("bank_br"));
				transaction.setMembNo(rs.getInt("membno"));
				transaction.setAmt(rs.getDouble("amt"));
				transaction.setParti(rs.getString("parti"));
				transaction.setaP(rs.getString("a_p"));
				transaction.setFlag(rs.getInt("flag"));
				transaction.setVrNo(rs.getInt("vr_no"));
				transaction.setsN(rs.getString("sno"));
				transaction.setsR(rs.getString("sr"));
				transaction.setDocNoo(rs.getString("docnoo"));
				transaction.setProjCd(rs.getInt("projcd"));
				java.sql.Date wcLrDt = rs.getDate("wc_lr_dt");
				if (wcLrDt != null)
					transaction.setWcLrDt(new java.util.Date((wcLrDt).getTime()));
				else
					transaction.setWcLrDt(wcLrDt);
				java.sql.Date chClDt = rs.getDate("ch_cl_dt");
				if (chClDt != null)
					transaction.setChClDt(new java.util.Date((chClDt).getTime()));
				else
					transaction.setChClDt(chClDt);
				transaction.setcFlag(rs.getString("c_flag"));
				transaction.setPartyCd(rs.getInt("party_cd"));
				transaction.setUserId(rs.getInt("userid"));
				java.sql.Date lastupdate = rs.getDate("lastupdate");
				if (lastupdate != null)
					transaction.setLastUpdate(new java.util.Date((lastupdate).getTime()));
				else
					transaction.setLastUpdate(lastupdate);
				listTransaction.add(transaction);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return listTransaction;
	}

	public ArrayList<TransactionRecords> findDateTransactionRecord(Date d1, Date d2, String acCode) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<TransactionRecords> listTransaction = new ArrayList<TransactionRecords>();
		try {
			String sql = "select * from transaction_records where docdte between ? and ? and accode = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			java.sql.Date date1 = null;
			if (d1 != null)
				date1 = new java.sql.Date(d1.getTime());
			else
				return null;
			java.sql.Date date2 = null;
			if (d2 != null)
				date2 = new java.sql.Date(d2.getTime());
			else
				return null;
			ps.setDate(1, date1);
			ps.setDate(2, date2);
			ps.setString(3, acCode);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TransactionRecords transaction = new TransactionRecords();
				transaction.setsNo(rs.getInt("s_no"));
				transaction.setSlno(rs.getInt("slno"));
				transaction.setDocNo(rs.getInt("docno"));
				java.sql.Date docDate = rs.getDate("docdte");
				if (docDate != null)
					transaction.setDocDte(new java.util.Date((docDate).getTime()));
				else
					transaction.setDocDte(docDate);
				transaction.setDocType(rs.getString("doctype"));
				transaction.setAcCode(rs.getString("accode"));
				transaction.setBkCode(rs.getString("bkcode"));
				transaction.setChqNo(rs.getString("chqno"));
				java.sql.Date chDate = rs.getDate("ch_date");
				if (chDate != null)
					transaction.setChDate(new java.util.Date((chDate).getTime()));
				else
					transaction.setChDate(chDate);
				transaction.setBankBr(rs.getString("bank_br"));
				transaction.setMembNo(rs.getInt("membno"));
				transaction.setAmt(rs.getDouble("amt"));
				transaction.setParti(rs.getString("parti"));
				transaction.setaP(rs.getString("a_p"));
				transaction.setFlag(rs.getInt("flag"));
				transaction.setVrNo(rs.getInt("vr_no"));
				transaction.setsN(rs.getString("sno"));
				transaction.setsR(rs.getString("sr"));
				transaction.setDocNoo(rs.getString("docnoo"));
				transaction.setProjCd(rs.getInt("projcd"));
				java.sql.Date wcLrDt = rs.getDate("wc_lr_dt");
				if (wcLrDt != null)
					transaction.setWcLrDt(new java.util.Date((wcLrDt).getTime()));
				else
					transaction.setWcLrDt(wcLrDt);
				java.sql.Date chClDt = rs.getDate("ch_cl_dt");
				if (chClDt != null)
					transaction.setChClDt(new java.util.Date((chClDt).getTime()));
				else
					transaction.setChClDt(chClDt);
				transaction.setcFlag(rs.getString("c_flag"));
				transaction.setPartyCd(rs.getInt("party_cd"));
				transaction.setUserId(rs.getInt("userid"));
				java.sql.Date lastupdate = rs.getDate("lastupdate");
				if (lastupdate != null)
					transaction.setLastUpdate(new java.util.Date((lastupdate).getTime()));
				else
					transaction.setLastUpdate(lastupdate);
				listTransaction.add(transaction);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return listTransaction;
	}

	public ArrayList<TransactionRecords> findDateTransactionRecord(Date d1, Date d2, int partyCode) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<TransactionRecords> listTransaction = new ArrayList<TransactionRecords>();
		try {
			String sql = "select * from transaction_records where accode = 'P0079' and party_cd = ? and docdte between ? and ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			java.sql.Date date1 = null;
			if (d1 != null)
				date1 = new java.sql.Date(d1.getTime());
			else
				return null;
			java.sql.Date date2 = null;
			if (d2 != null)
				date2 = new java.sql.Date(d2.getTime());
			else
				return null;
			ps.setInt(1, partyCode);
			ps.setDate(2, date1);
			ps.setDate(3, date2);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TransactionRecords transaction = new TransactionRecords();
				transaction.setsNo(rs.getInt("s_no"));
				transaction.setSlno(rs.getInt("slno"));
				transaction.setDocNo(rs.getInt("docno"));
				java.sql.Date docDate = rs.getDate("docdte");
				if (docDate != null)
					transaction.setDocDte(new java.util.Date((docDate).getTime()));
				else
					transaction.setDocDte(docDate);
				transaction.setDocType(rs.getString("doctype"));
				transaction.setAcCode(rs.getString("accode"));
				transaction.setBkCode(rs.getString("bkcode"));
				transaction.setChqNo(rs.getString("chqno"));
				java.sql.Date chDate = rs.getDate("ch_date");
				if (chDate != null)
					transaction.setChDate(new java.util.Date((chDate).getTime()));
				else
					transaction.setChDate(chDate);
				transaction.setBankBr(rs.getString("bank_br"));
				transaction.setMembNo(rs.getInt("membno"));
				transaction.setAmt(rs.getDouble("amt"));
				transaction.setParti(rs.getString("parti"));
				transaction.setaP(rs.getString("a_p"));
				transaction.setFlag(rs.getInt("flag"));
				transaction.setVrNo(rs.getInt("vr_no"));
				transaction.setsN(rs.getString("sno"));
				transaction.setsR(rs.getString("sr"));
				transaction.setDocNoo(rs.getString("docnoo"));
				transaction.setProjCd(rs.getInt("projcd"));
				java.sql.Date wcLrDt = rs.getDate("wc_lr_dt");
				if (wcLrDt != null)
					transaction.setWcLrDt(new java.util.Date((wcLrDt).getTime()));
				else
					transaction.setWcLrDt(wcLrDt);
				java.sql.Date chClDt = rs.getDate("ch_cl_dt");
				if (chClDt != null)
					transaction.setChClDt(new java.util.Date((chClDt).getTime()));
				else
					transaction.setChClDt(chClDt);
				transaction.setcFlag(rs.getString("c_flag"));
				transaction.setPartyCd(rs.getInt("party_cd"));
				transaction.setUserId(rs.getInt("userid"));
				java.sql.Date lastupdate = rs.getDate("lastupdate");
				if (lastupdate != null)
					transaction.setLastUpdate(new java.util.Date((lastupdate).getTime()));
				else
					transaction.setLastUpdate(lastupdate);
				listTransaction.add(transaction);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return listTransaction;
	}

	public ArrayList<CashBankBookDto> findCashBankBookDtoReceipt(Date d1, Date d2, String bkCode) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<CashBankBookDto> listCashBankBookDto = new ArrayList<CashBankBookDto>();
		try {
			String sql = "select * from transaction_records where docdte between ? and ? and bkcode = ? and doctype = 'D'";
			PreparedStatement ps = conn.prepareStatement(sql);
			java.sql.Date date1 = null;
			if (d1 != null)
				date1 = new java.sql.Date(d1.getTime());
			else
				return null;
			java.sql.Date date2 = null;
			if (d2 != null)
				date2 = new java.sql.Date(d2.getTime());
			else
				return null;
			ps.setDate(1, date1);
			ps.setDate(2, date2);
			ps.setString(3, bkCode);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				CashBankBookDto cashBankBookDto = new CashBankBookDto();

				cashBankBookDto.setDocNo(rs.getInt("docno"));
				cashBankBookDto.setAccNo(rs.getString("accode"));
				cashBankBookDto.setAccName(AccountMasterDao.findByCode(cashBankBookDto.getAccNo()).getAcName());
				cashBankBookDto.setRemarks(rs.getString("parti"));
				cashBankBookDto.setAmount(rs.getDouble("amt"));
				if(rs.getInt("flag")==3)
					cashBankBookDto.setAdjustment(rs.getDouble("amt"));
				else
					cashBankBookDto.setAdjustment(0.0);
				java.sql.Date docDate = rs.getDate("docdte");
				if (docDate != null)
					cashBankBookDto.setDocDate(new java.util.Date((docDate).getTime()));
				else
					cashBankBookDto.setDocDate(docDate);
				cashBankBookDto.setMembNo(rs.getInt("membno"));
				cashBankBookDto.setChqNo(rs.getString("chqno"));
				listCashBankBookDto.add(cashBankBookDto);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return listCashBankBookDto;
	}

	public ArrayList<CashBankBookDto> findCashBankBookDtoPayment(Date d1, Date d2, String bkCode) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<CashBankBookDto> listCashBankBookDto = new ArrayList<CashBankBookDto>();
		try {
			String sql = "select * from transaction_records where docdte between ? and ? and bkcode = ? and doctype = 'W'";
			PreparedStatement ps = conn.prepareStatement(sql);
			java.sql.Date date1 = null;
			if (d1 != null)
				date1 = new java.sql.Date(d1.getTime());
			else
				return null;
			java.sql.Date date2 = null;
			if (d2 != null)
				date2 = new java.sql.Date(d2.getTime());
			else
				return null;
			ps.setDate(1, date1);
			ps.setDate(2, date2);
			ps.setString(3, bkCode);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				CashBankBookDto cashBankBookDto = new CashBankBookDto();

				cashBankBookDto.setDocNo(rs.getInt("docno"));
				cashBankBookDto.setAccNo(rs.getString("accode"));
				cashBankBookDto.setAccName(AccountMasterDao.findByCode(cashBankBookDto.getAccNo()).getAcName());
				cashBankBookDto.setRemarks(rs.getString("parti"));
				cashBankBookDto.setAmount(rs.getDouble("amt"));
				if(rs.getInt("flag")==3)
					cashBankBookDto.setAdjustment(rs.getDouble("amt"));
				else
					cashBankBookDto.setAdjustment(0.0);
				cashBankBookDto.setChqNo(rs.getString("chqno"));
				java.sql.Date docDate = rs.getDate("docdte");
				if (docDate != null)
					cashBankBookDto.setDocDate(new java.util.Date((docDate).getTime()));
				else
					cashBankBookDto.setDocDate(docDate);
					
				listCashBankBookDto.add(cashBankBookDto);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return listCashBankBookDto;
	}
	
	
	public ArrayList<CashBankBookDto> findCashBankBookRecord(Date d1, Date d2) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<CashBankBookDto> listCashBankBookDto = new ArrayList<CashBankBookDto>();
		try {
			String sql = "select * from transaction_records where docdte between ? and ? order by docdte,docno";
			PreparedStatement ps = conn.prepareStatement(sql);
			java.sql.Date date1 = null;
			if (d1 != null)
				date1 = new java.sql.Date(d1.getTime());
			else
				return null;
			java.sql.Date date2 = null;
			if (d2 != null)
				date2 = new java.sql.Date(d2.getTime());
			else
				return null;
			ps.setDate(1, date1);
			ps.setDate(2, date2);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				CashBankBookDto cashBankBookDto = new CashBankBookDto();

				cashBankBookDto.setDocNo(rs.getInt("docno"));
				cashBankBookDto.setAccNo(rs.getString("accode"));
				cashBankBookDto.setAccName(AccountMasterDao.findByCode(cashBankBookDto.getAccNo()).getAcName());
				cashBankBookDto.setRemarks(rs.getString("parti"));
				cashBankBookDto.setAmount(rs.getDouble("amt"));
				if(rs.getInt("flag")==3)
					cashBankBookDto.setAdjustment(rs.getDouble("amt"));
				else
					cashBankBookDto.setAdjustment(0.0);
				cashBankBookDto.setChqNo(rs.getString("chqno"));
				cashBankBookDto.setMembNo(rs.getInt("membno"));
				java.sql.Date docDate = rs.getDate("docdte");
				if (docDate != null)
					cashBankBookDto.setDocDate(new java.util.Date((docDate).getTime()));
				else
					cashBankBookDto.setDocDate(docDate);
				cashBankBookDto.setBkCode(rs.getString("bkcode"));
				cashBankBookDto.setDocType(rs.getString("doctype"));
				listCashBankBookDto.add(cashBankBookDto);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return listCashBankBookDto;
	}
	
	
	
	

	public static double bankOpeningBalance(Date d1, String bkCode) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		double openingBal = 0.0;
		try {
			String sql = "SELECT (coalesce(a.credit,0.00) - coalesce(b.debit,0.00) + coalesce(ac.op_bal,0.00)) as OpBal FROM danish_housing.accounts ac,(SELECT sum(amt) as credit"
					+ " FROM danish_housing.transaction_records t  where docdte <= ? and bkcode = ? and doctype = 'D') a,"
					+ "(SELECT sum(amt) as debit FROM danish_housing.transaction_records t  where docdte <= ? and bkcode = ? and "
					+ "doctype = 'W') b where bk_code = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			java.sql.Date date1 = null;
			if (d1 != null)
				date1 = new java.sql.Date(d1.getTime());
			else
				return 0;

			ps.setDate(1, date1);
			ps.setString(2, bkCode);
			ps.setDate(3, date1);
			ps.setString(4, bkCode);
			ps.setString(5, bkCode);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				openingBal = rs.getDouble("OpBal");
			}
		} catch (SQLException sq) {
			System.out.println("Unable to fetch opening balance." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return openingBal;
	}

	public boolean edit(TransactionRecords transaction) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "update transaction_records set  lastupdate = ?, docno= ?,slno= ?,docdte= ?,doctype= ?,accode= ?,bkcode= ?,chqno= ?,ch_date= ?,bank_br= ?,"
					+ "membno= ?,amt= ?,parti= ?,a_p= ?,flag= ?,vr_no= ?,sno= ?,sr= ?,docnoo= ?,projcd= ?,wc_lr_dt= ?,ch_cl_dt= ?,c_flag= ?,party_cd= ?,userid= ? ";
			;
			PreparedStatement ps1 = conn.prepareStatement(sql);

			java.sql.Date lastUpdate = new java.sql.Date(new Date().getTime());
			;

			ps1.setDate(1, lastUpdate);

			ps1.setInt(2, transaction.getDocNo());
			ps1.setInt(3, transaction.getSlno());
			java.sql.Date docDate = null;
			if (transaction.getDocDte() != null)
				docDate = new java.sql.Date(transaction.getDocDte().getTime());
			ps1.setDate(4, docDate);
			ps1.setString(5, transaction.getDocType()); // D
			ps1.setString(6, transaction.getAcCode());
			ps1.setString(7, transaction.getBkCode());
			ps1.setString(8, transaction.getChqNo());
			java.sql.Date chkDate = null;
			if (transaction.getChDate() != null)
				chkDate = new java.sql.Date(transaction.getChDate().getTime());
			ps1.setDate(9, chkDate);
			ps1.setString(10, transaction.getBankBr());
			ps1.setInt(11, transaction.getMembNo());
			ps1.setDouble(12, transaction.getAmt());
			ps1.setString(13, transaction.getParti());
			ps1.setString(14, transaction.getaP());
			ps1.setInt(15, transaction.getFlag());
			ps1.setInt(16, transaction.getVrNo());
			ps1.setString(17, transaction.getsN());
			ps1.setString(18, transaction.getsR());
			ps1.setString(19, transaction.getDocNoo());
			ps1.setInt(20, transaction.getProjCd());
			java.sql.Date wcLrDt = null;
			if (transaction.getWcLrDt() != null)
				wcLrDt = new java.sql.Date(transaction.getWcLrDt().getTime());
			ps1.setDate(21, wcLrDt);
			java.sql.Date chClDt = null;
			if (transaction.getChClDt() != null)
				chClDt = new java.sql.Date(transaction.getChClDt().getTime());
			ps1.setDate(22, chClDt);
			ps1.setString(23, transaction.getcFlag());
			ps1.setInt(24, transaction.getPartyCd());
			ps1.setInt(25, transaction.getUserId());
			int x = ps1.executeUpdate();
			if (x == 0) {
				System.out.println("Record not Edited");
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

	public int count(TransactionRecords transaction) {
		int c = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "select count(*) as total from transaction_records where docno = ? and accode= ? and amt = ? and doctype= ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, transaction.getDocNo());
			ps.setString(2, transaction.getAcCode());
			ps.setDouble(3, transaction.getAmt());
			ps.setString(4, transaction.getDocType());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = rs.getInt("total");
			}

		} catch (SQLException sq) {
			return 0;
		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Record Successfully Counted");
		return c;
	}

	public boolean updateDeletedRecords(TransactionRecords transaction) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			System.out.println(transaction.getDocType());
			if (transaction.getDocType() != null && transaction.getDocType().equals("D")) {
				// System.out.println("D to DD");
				String sql = "update transaction_records set doctype=\"DD\" where docno = ? and accode = ? and amt = ? limit 1";
				// System.out.println("DD");
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, transaction.getDocNo());
				ps.setString(2, transaction.getAcCode());
				ps.setDouble(3, transaction.getAmt());
				int x = ps.executeUpdate();
				if (x == 0)
					return false;
			} else if (transaction.getDocType() != null && transaction.getDocType().equals("W")) {
				// System.out.println("W to WD");
				String sql = "update transaction_records set doctype=\"WD\" where docno = ? and accode=? and amt = ? limit 1";
				// System.out.println("WD");
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, transaction.getDocNo());
				ps.setString(2, transaction.getAcCode());
				ps.setDouble(3, transaction.getAmt());
				int x = ps.executeUpdate();
				if (x == 0)
					return false;
			}
		} catch (SQLException sq) {
			return false;
		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Record Successfully Updated");
		return true;
	}

	
	public ArrayList<TrialBalanceDto> findRecTransactionRecord(Date d1, Date d2) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<TrialBalanceDto> listRecBal = new ArrayList<TrialBalanceDto>();
		try {
			String sql = "select sum(amt) as total_deposit, accode  from transaction_records where doctype= 'D'"
					+ " and docdte between ? and ?  group by accode";
			PreparedStatement ps = conn.prepareStatement(sql);
			java.sql.Date date1 = null;
			if (d1 != null)
				date1 = new java.sql.Date(d1.getTime());
			else
				return null;
			java.sql.Date date2 = null;
			if (d2 != null)
				date2 = new java.sql.Date(d2.getTime());
			else
				return null;
			ps.setDate(1, date1);
			ps.setDate(2, date2);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrialBalanceDto dto = new TrialBalanceDto();
				dto.setAcCode(rs.getString("accode"));
				dto.setAcName(AccountMasterDao.findByCode(rs.getString("accode")).getAcName());
				dto.setRecAmount(rs.getDouble("total_deposit"));
				dto.setPayAmount(0.0);
				listRecBal.add(dto);

			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return listRecBal;
	}

	public ArrayList<TrialBalanceDto> findPayTransactionRecord(Date d1, Date d2) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<TrialBalanceDto> listPayBal = new ArrayList<TrialBalanceDto>();
		try {
			String sql = "select sum(amt) as total_deposit, accode  from transaction_records where doctype= 'W'"
					+ " and docdte between ? and ?  group by accode";
			PreparedStatement ps = conn.prepareStatement(sql);
			java.sql.Date date1 = null;
			if (d1 != null)
				date1 = new java.sql.Date(d1.getTime());
			else
				return null;
			java.sql.Date date2 = null;
			if (d2 != null)
				date2 = new java.sql.Date(d2.getTime());
			else
				return null;
			ps.setDate(1, date1);
			ps.setDate(2, date2);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrialBalanceDto dto = new TrialBalanceDto();
				dto.setAcCode(rs.getString("accode"));
				dto.setAcName(AccountMasterDao.findByCode(rs.getString("accode")).getAcName());
				dto.setPayAmount(rs.getDouble("total_deposit"));
				dto.setRecAmount(0.0);
				listPayBal.add(dto);

			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return listPayBal;
	}

	public ArrayList<TrialBalanceDto> findPartyRecTransactionRecord(Date d1, Date d2) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<TrialBalanceDto> listRecBal = new ArrayList<TrialBalanceDto>();
		try {
			String sql = "select sum(amt) as total_deposit, party_cd  from transaction_records where doctype= 'D'"
					+ " and accode='p0079' and docdte between ? and ?  group by party_cd";
			PreparedStatement ps = conn.prepareStatement(sql);
			java.sql.Date date1 = null;
			if (d1 != null)
				date1 = new java.sql.Date(d1.getTime());
			else
				return null;
			java.sql.Date date2 = null;
			if (d2 != null)
				date2 = new java.sql.Date(d2.getTime());
			else
				return null;
			ps.setDate(1, date1);
			ps.setDate(2, date2);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrialBalanceDto dto = new TrialBalanceDto();
				dto.setAcCode(String.valueOf(rs.getInt("party_cd")));
				dto.setAcName(new SupplierDao().find(rs.getInt("party_cd")).getSupplName());
				dto.setRecAmount(rs.getDouble("total_deposit"));
				dto.setPayAmount(0.0);
				listRecBal.add(dto);

			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return listRecBal;
	}
	
	public ArrayList<TrialBalanceDto> findPartyPayTransactionRecord(Date d1, Date d2) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<TrialBalanceDto> listRecBal = new ArrayList<TrialBalanceDto>();
		try {
			String sql = "select sum(amt) as total_withdrawal, party_cd  from transaction_records where doctype= 'W'"
					+ " and accode='p0079' and docdte between ? and ?  group by party_cd";
			PreparedStatement ps = conn.prepareStatement(sql);
			java.sql.Date date1 = null;
			if (d1 != null)
				date1 = new java.sql.Date(d1.getTime());
			else
				return null;
			java.sql.Date date2 = null;
			if (d2 != null)
				date2 = new java.sql.Date(d2.getTime());
			else
				return null;
			ps.setDate(1, date1);
			ps.setDate(2, date2);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrialBalanceDto dto = new TrialBalanceDto();
				dto.setAcCode(String.valueOf(rs.getInt("party_cd")));
				dto.setAcName(new SupplierDao().find(rs.getInt("party_cd")).getSupplName());
				dto.setRecAmount(0.0);
				dto.setPayAmount(rs.getDouble("total_withdrawal"));
				listRecBal.add(dto);

			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return listRecBal;
	}
	
	public static void main(String[] args) {

		// List<TransactionRecords> list =new
		// TransactionRecordsDao().findMemTransactionRecord(7299);
		// List<TransactionRecords> list =new
		// TransactionRecordsDao().findDateTransactionRecord(DateUtils.convertDate("24/08/2017"),DateUtils.convertDate("28/08/2017"),"A0001"
		// );
		// for(TransactionRecords t : list)
		// System.out.println(t);

		// double openingBal = new
		// TransactionRecordsDao().bankOpeningBalance(DateUtils.convertDate("22/10/2017"),
		// "SBI0089");
		// System.out.println(openingBal);

		// ArrayList<CashBankBookDto> listCashBankBookDto = new
		// TransactionRecordsDao().findCashBankBookDtoReceipt(DateUtils.convertDate("01/08/2017"),DateUtils.convertDate(
		// "21/08/2017"), "001");
		// for(CashBankBookDto t : listCashBankBookDto)
		// System.out.println(t);

		// ArrayList<CashBankBookDto> listCashBankBookDto = new
		// TransactionRecordsDao().findCashBankBookDtoPayment(DateUtils.convertDate("01/08/2017"),DateUtils.convertDate(
		// "21/08/2017"), "001");
		// for(CashBankBookDto t : listCashBankBookDto)
		// System.out.println(t);
		//

		java.util.Date date1 = DateUtils.convertDate("26/06/2017");
		java.util.Date date2 = DateUtils.convertDate("30/06/2017");
//		ArrayList<TrialBalanceDto> balList = new ArrayList<TrialBalanceDto>();
//		ArrayList<TrialBalanceDto> recBalList = new TransactionRecordsDao().findRecTransactionRecord(d1, d2);
//		ArrayList<TrialBalanceDto> payBalList = new TransactionRecordsDao().findPayTransactionRecord(d1, d2);
//		for (TrialBalanceDto dto : recBalList) {
//			TrialBalanceDto tdto = new TrialBalanceDto();
//			int flag = 0;
//			for (TrialBalanceDto d : payBalList) {
//				if (dto.getAcCode().equals(d.getAcCode())) {
//					tdto.setAcCode(dto.getAcCode());
//					tdto.setAcName(dto.getAcName());
//					tdto.setPayAmount(d.getPayAmount());
//					tdto.setRecAmount(dto.getRecAmount());
//					flag = 1;
//				}
//			}
//			if (flag == 0) {
//				tdto.setAcCode(dto.getAcCode());
//				tdto.setAcName(dto.getAcName());
//				tdto.setPayAmount(dto.getPayAmount());
//				tdto.setRecAmount(dto.getRecAmount());
//			}
//			balList.add(tdto);
//		}
//		for (TrialBalanceDto dto : payBalList) {
//			int flag = 0;
//			System.out.println("DTO :" + dto);
//			TrialBalanceDto tdto = new TrialBalanceDto();
//			for (TrialBalanceDto d : balList) {
//				if (dto.getAcCode().equals(d.getAcCode())) {
//					System.out.println("record found");
//					flag=1;
//					break;
//				}
//			}
//			if (flag == 0) {
//				tdto.setAcCode(dto.getAcCode());
//				tdto.setAcName(dto.getAcName());
//				tdto.setPayAmount(dto.getPayAmount());
//				tdto.setRecAmount(dto.getRecAmount());
//				System.out.println("tdto :" + tdto);
//				balList.add(tdto);
//			}
//		}
//		int counter = 0;
//		System.out.println("Complete");
//		for (TrialBalanceDto dto : balList) {
//			System.out.println(dto);
//			counter++;
//		}
//		System.out.println(counter);
		
		
//		ArrayList<CashBankBookDto> transactionList = new TransactionRecordsDao
//				().findCashBankBookRecord(date1, date2);
//				for(CashBankBookDto t:transactionList)
//					System.out.println(t);
//				ArrayList<DailyTransactionDto> dailyTranList = new ArrayList<DailyTransactionDto>();
//				ArrayList<CashBankBookDto> tranList = new ArrayList<CashBankBookDto>();
//				Date curDate = date1;
//				for (CashBankBookDto t : transactionList) {
//					System.out.println(t);
//						if(t.getDocDate().equals(DateUtils.getNextDate(curDate))){
//							System.out.println("Docdate : " + t.getDocDate());
//							DailyTransactionDto dailyRecord=new DailyTransactionDto();
//							ArrayList<CashBankBookDto> tempTranList = new ArrayList<CashBankBookDto>(tranList);
//							dailyRecord.setDailyTransaction(tempTranList);
//							dailyRecord.setOpeningBalance(new AccountDao().findAllBankBalanceByDate(DateUtils.getPreviousDate(curDate), "opBal"));
//							dailyRecord.setClosingBalance(new AccountDao().findAllBankBalanceByDate(curDate, "clsBal"));
//							dailyTranList.add(dailyRecord);
//							tranList.clear();
//							curDate=DateUtils.getNextDate(curDate);
//							System.out.println("Currdate : " + curDate);
//							System.out.println(tempTranList);
//						}
//						tranList.add(t);
//				}
//				
//				System.out.println(dailyTranList);		
	}

}
