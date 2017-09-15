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
import com.vedisoft.danishhousing.pojos.ReceiptRecord;
import com.vedisoft.danishhousing.pojos.TransactionRecords;
import com.vedisoft.danishhousing.pojos.CashBankBookDto;



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
			while (rs.next())  {
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
			while (rs.next())  {
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
			
			while (rs.next())  {
				CashBankBookDto cashBankBookDto = new CashBankBookDto();
				
				cashBankBookDto.setDocNo(rs.getInt("docno"));
				cashBankBookDto.setAccNo(rs.getString("accode"));
				cashBankBookDto.setAccName(AccountMasterDao.findByCode(cashBankBookDto.getAccNo()).getAcName());
				cashBankBookDto.setRemarks(rs.getString("parti"));
				cashBankBookDto.setAmount(rs.getDouble("amt"));
				cashBankBookDto.setAdjustment(rs.getDouble("amt"));
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
			
			while (rs.next())  {
				CashBankBookDto cashBankBookDto = new CashBankBookDto();
				
				cashBankBookDto.setDocNo(rs.getInt("docno"));
				cashBankBookDto.setAccNo(rs.getString("accode"));
				cashBankBookDto.setAccName(AccountMasterDao.findByCode(cashBankBookDto.getAccNo()).getAcName());
				cashBankBookDto.setRemarks(rs.getString("parti"));
				cashBankBookDto.setAmount(rs.getDouble("amt"));
				cashBankBookDto.setAdjustment(rs.getDouble("amt"));
				listCashBankBookDto.add(cashBankBookDto);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return listCashBankBookDto;
	}
	
	
	
	
	
	public static double bankOpeningBalance(Date d1,String bkCode) {
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
			while (rs.next())  {
				openingBal =rs.getDouble("OpBal");
			}
		} catch (SQLException sq) {
			System.out.println("Unable to fetch opening balance." + sq);
		} finally {
			pool.putConnection(conn);
		}
			return openingBal;
	}
	
	
	

	public static void main(String[] args) {
		
//		 List<TransactionRecords> list =new TransactionRecordsDao().findMemTransactionRecord(7299);
//		List<TransactionRecords> list =new TransactionRecordsDao().findDateTransactionRecord(DateUtils.convertDate("24/08/2017"),DateUtils.convertDate("28/08/2017"),"A0001" ); 
//		for(TransactionRecords t : list)
//			 System.out.println(t);
		
		
		double openingBal = new TransactionRecordsDao().bankOpeningBalance(DateUtils.convertDate("22/10/2017"), "SBI0089");
		System.out.println(openingBal);
		
//		ArrayList<CashBankBookDto> listCashBankBookDto = new TransactionRecordsDao().findCashBankBookDtoReceipt(DateUtils.convertDate("01/08/2017"),DateUtils.convertDate( "21/08/2017"), "001");
//		for(CashBankBookDto t : listCashBankBookDto)
//			 System.out.println(t);
		
//		ArrayList<CashBankBookDto> listCashBankBookDto = new TransactionRecordsDao().findCashBankBookDtoPayment(DateUtils.convertDate("01/08/2017"),DateUtils.convertDate( "21/08/2017"), "001");
//		for(CashBankBookDto t : listCashBankBookDto)
//			 System.out.println(t);
//		
		
		
	}
	
	
}
