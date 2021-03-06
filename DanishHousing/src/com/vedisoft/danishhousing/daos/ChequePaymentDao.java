package com.vedisoft.danishhousing.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import com.vedisoft.danishhousing.config.ConnectionPool;
import com.vedisoft.danishhousing.config.DateUtils;

import com.vedisoft.danishhousing.pojos.ChequePayment;
import com.vedisoft.danishhousing.pojos.TransactionRecords;

public class ChequePaymentDao {

	public int create(TransactionRecords transaction, ChequePayment chequePay) {
		
		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			conn.setAutoCommit(false);

			String sqlTransaction = "insert into transaction_records" + " ("
					+ "lastupdate, docno,slno,docdte,doctype,accode,bkcode,chqno,ch_date,bank_br,"
					+ "membno,amt,parti,a_p,flag,vr_no,sno,sr,docnoo,projcd,wc_lr_dt,ch_cl_dt,c_flag,party_cd,userid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			String sqlChequePay = "insert into cheque_pay (docno, doc_date,bank_code ,payment_mode, transaction_no,"
					+ "ch_date,payment_amt, cl_date) values(?,?,?,?,?,?,?,?)";
		
			PreparedStatement ps1 = conn.prepareStatement(sqlTransaction, Statement.RETURN_GENERATED_KEYS,
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			java.sql.Date lastUpdate = null;
			if (transaction.getLastUpdate() != null)
				lastUpdate = new java.sql.Date(transaction.getLastUpdate().getTime());
			ps1.setDate(1, lastUpdate);
			
			ps1.setInt(2, transaction.getDocNo());
			ps1.setInt(3, transaction.getSlno());
			java.sql.Date docDate = null;
			if (transaction.getDocDte() != null)
				docDate = new java.sql.Date(transaction.getDocDte().getTime());
			ps1.setDate(4, docDate);
			ps1.setString(5, transaction.getDocType());						
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
			ps1.setString(14,transaction.getaP());
			ps1.setInt(15, transaction.getFlag());
			ps1.setInt(16, transaction.getVrNo());
			ps1.setString(17,transaction.getsN());
			ps1.setString(18,transaction.getsR());
			ps1.setString(19,transaction.getDocNoo());
			ps1.setInt(20, transaction.getProjCd());
			java.sql.Date wcLrDt = null;
			if (transaction.getWcLrDt() != null)
				wcLrDt = new java.sql.Date(transaction.getWcLrDt().getTime());
			ps1.setDate(21,wcLrDt);
			java.sql.Date chClDt = null;
			if (transaction.getChClDt() != null)
				chClDt = new java.sql.Date(transaction.getChClDt().getTime());
			ps1.setDate(22,chClDt);
			ps1.setString(23,transaction.getcFlag());
			ps1.setInt(24,transaction.getPartyCd());
			ps1.setInt(25, transaction.getUserId());
			
			int x = ps1.executeUpdate();
			if (x <= 0) {
				Exception a = new Exception();
				throw a;
				}
			
			

			ResultSet generatedKeys = ps1.getGeneratedKeys();
			if (generatedKeys.next()) {
				id = generatedKeys.getInt(1);
			}
			
			PreparedStatement ps2 = conn.prepareStatement(sqlChequePay, Statement.RETURN_GENERATED_KEYS,
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			ps2.setInt(1, chequePay.getDocno());
			
			java.sql.Date doDate = null;
			if(chequePay.getDocDate() != null)
				ps2.setDate(2,  new java.sql.Date(chequePay.getDocDate().getTime()));
			else
				ps2.setDate(2,  null);
				
			ps2.setString(3, chequePay.getBankCode());
			ps2.setString(4, chequePay.getPaymentMode());
			ps2.setString(5, chequePay.getTransactionNo());
			
			java.sql.Date chequeDate = null;
			if(chequePay.getChequeDate() != null)
				ps2.setDate(6,  new java.sql.Date(chequePay.getChequeDate().getTime()));
			else
				ps2.setDate(6, null);
			
			ps2.setDouble(7, chequePay.getAmount());
			
			java.sql.Date chequeClearDate = null;
			if(chequePay.getCheqClDate() != null)
				ps2.setDate(8,  new java.sql.Date(chequePay.getCheqClDate().getTime()));
			else
				ps2.setDate(8,  null);
			
			int x1 = ps2.executeUpdate();
			if (x1 <= 0) {
				Exception a = new Exception();
				throw a;
			}
			
			conn.commit();

		} catch (Exception sq) {
			try {
				System.out.println("Rolling Back");
				conn.rollback();
			} catch (SQLException se2) {
				se2.printStackTrace();
			}
			sq.printStackTrace();
			return 0;
		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Records SuccessFully Added");
		return id;
			
	}
	
public int create(TransactionRecords transaction) {
		
		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			conn.setAutoCommit(false);

			String sqlTransaction = "insert into transaction_records" + " ("
					+ "lastupdate, docno,slno,docdte,doctype,accode,bkcode,chqno,ch_date,bank_br,"
					+ "membno,amt,parti,a_p,flag,vr_no,sno,sr,docnoo,projcd,wc_lr_dt,ch_cl_dt,c_flag,party_cd,userid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
			PreparedStatement ps1 = conn.prepareStatement(sqlTransaction, Statement.RETURN_GENERATED_KEYS,
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			java.sql.Date lastUpdate = null;
			if (transaction.getLastUpdate() != null)
				lastUpdate = new java.sql.Date(transaction.getLastUpdate().getTime());
			ps1.setDate(1, lastUpdate);
			
			ps1.setInt(2, transaction.getDocNo());
			ps1.setInt(3, transaction.getSlno());
			java.sql.Date docDate = null;
			if (transaction.getDocDte() != null)
				docDate = new java.sql.Date(transaction.getDocDte().getTime());
			ps1.setDate(4, docDate);
			ps1.setString(5, transaction.getDocType());						
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
			ps1.setString(14,transaction.getaP());
			ps1.setInt(15, transaction.getFlag());
			ps1.setInt(16, transaction.getVrNo());
			ps1.setString(17,transaction.getsN());
			ps1.setString(18,transaction.getsR());
			ps1.setString(19,transaction.getDocNoo());
			ps1.setInt(20, transaction.getProjCd());
			java.sql.Date wcLrDt = null;
			if (transaction.getWcLrDt() != null)
				wcLrDt = new java.sql.Date(transaction.getWcLrDt().getTime());
			ps1.setDate(21,wcLrDt);
			java.sql.Date chClDt = null;
			if (transaction.getChClDt() != null)
				chClDt = new java.sql.Date(transaction.getChClDt().getTime());
			ps1.setDate(22,chClDt);
			ps1.setString(23,transaction.getcFlag());
			ps1.setInt(24,transaction.getPartyCd());
			ps1.setInt(25, transaction.getUserId());
			
			int x = ps1.executeUpdate();
			if (x <= 0) {
				Exception a = new Exception();
				throw a;
				}
			
			ResultSet generatedKeys = ps1.getGeneratedKeys();
			if (generatedKeys.next()) {
				id = generatedKeys.getInt(1);
			}
			
			conn.commit();
		}
			catch (Exception sq) {
				try {
					System.out.println("Rolling Back");
					conn.rollback();
				} catch (SQLException se2) {
					se2.printStackTrace();
				}
				sq.printStackTrace();
				return 0;
			} finally {
				pool.putConnection(conn);
			}
			
			

		System.out.println("Records SuccessFully Added");
		
		return id;
			
	}
	
	
	
	
	public int createCheque(ChequePayment chequePay){
		
		
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			conn.setAutoCommit(false);

			String sqlChequePay = "insert into cheque_pay (docno, doc_date,bank_code ,payment_mode, transaction_no,"
					+ "ch_date,payment_amt, cl_date) values(?,?,?,?,?,?,?,?)";
		
			PreparedStatement ps1 = conn.prepareStatement(sqlChequePay,
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
	
			ps1.setInt(1, chequePay.getDocno());
			
			java.sql.Date doDate = null;
			if(chequePay.getDocDate() != null)
				doDate =  new java.sql.Date(chequePay.getDocDate().getTime());
				ps1.setDate(2, doDate);
				
			ps1.setString(3, chequePay.getBankCode());
			ps1.setString(4, chequePay.getPaymentMode());
			if(chequePay.getTransactionNo() != null)
			ps1.setString(5, chequePay.getTransactionNo());
			else
				ps1.setString(5, "0");
			
			java.sql.Date chequeDate = null;
			if(chequePay.getChequeDate() != null)
				chequeDate = new java.sql.Date(chequePay.getChequeDate().getTime());
				ps1.setDate(6,  chequeDate);
			
			ps1.setDouble(7, chequePay.getAmount());
			
			java.sql.Date chequeClearDate = null;
			if(chequePay.getCheqClDate() != null)
				chequeClearDate = new java.sql.Date(chequePay.getCheqClDate().getTime());
			ps1.setDate(8,  chequeClearDate);
			
			int x1 = ps1.executeUpdate();
			if (x1 <= 0) {
				Exception a = new Exception();
				throw a;
			}
		

			conn.commit();

		} catch (Exception sq) {
			try {
				System.out.println("Rolling Back");
				conn.rollback();
			} catch (SQLException se2) {
				se2.printStackTrace();
			}
			sq.printStackTrace();
			return 0;
		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Records SuccessFully Added" );
		
		return 1;
			
	}
		
	
	public static void main(String a[]) {
//		ChequePaymentDao dao = new ChequePaymentDao();
//		 Date d1 = null;
//		 Date d2 = new Date();
//		 Date d3 = new Date();
//		 d3 = DateUtils.convertDate("02/04/2016");
//	
//
//		 TransactionRecords t = new TransactionRecords(
//		 44901,1,d1,"D","E0010","01","hv",d1," ",7299,8400.00,"ESTABLISHMENT FEES UPTO 31/03/2016",1,26,8,1,d2);
//		 
//		 ChequePayment c = new ChequePayment(458, d2,"bCode","paymentMode","transactionNo",
//					d3,5431.00,d2);
//		 
//		 int id = dao.create(t, c);
//		 System.out.println(id);
//		 
//		 int flag = dao.createCheque(c);
//		 System.out.println(flag);
		 
	}	
	
}
