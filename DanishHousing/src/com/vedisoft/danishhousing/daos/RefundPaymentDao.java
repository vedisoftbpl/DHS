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
import com.vedisoft.danishhousing.pojos.ChequePayment;
import com.vedisoft.danishhousing.pojos.ReceiptRecord;
import com.vedisoft.danishhousing.pojos.RefundPayment;
import com.vedisoft.danishhousing.pojos.TransactionRecords;

public class RefundPaymentDao {

	public int create(RefundPayment refundPayment) {

		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			conn.setAutoCommit(false);

			String sqlRefundPay = "insert into refund_pay (paytype,memb_no,amount,c_dd,c_ddte,remarks,"
					+ "p_d,vr_no,sl_no,payment_mode) values (?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement ps2 = conn.prepareStatement(sqlRefundPay, Statement.RETURN_GENERATED_KEYS,
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

			ps2.setString(1, refundPayment.getPayType());
			ps2.setInt(2, refundPayment.getMemberNo());
			ps2.setDouble(3, refundPayment.getAmount());
			ps2.setString(4, refundPayment.getTransactionNo());

			java.sql.Date dt = null;
			if (refundPayment.getCdDate() != null)
				dt = new java.sql.Date(refundPayment.getCdDate().getTime());

			ps2.setDate(5, dt);
			ps2.setString(6, refundPayment.getRemarks());
			ps2.setString(7, refundPayment.getpD());
			ps2.setInt(8, refundPayment.getVoucherNo());
			ps2.setInt(9, refundPayment.getSlNo());
			ps2.setString(10, refundPayment.getPaymentmode());

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

	public int create(TransactionRecords transaction, RefundPayment refundPayment) {

		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			conn.setAutoCommit(false);

			String sqlTransaction = "insert into transaction_records" + " ("
					+ "lastupdate, docno,slno,docdte,doctype,accode,bkcode,chqno,ch_date,bank_br,"
					+ "membno,amt,parti,a_p,flag,vr_no,sno,sr,docnoo,projcd,wc_lr_dt,ch_cl_dt,c_flag,party_cd,userid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			String sqlRefundPay = "insert into refund_pay (paytype,memb_no,amount,c_dd,c_ddte,remarks,"
					+ "p_d,vr_no,sl_no,payment_mode,accode) values (?,?,?,?,?,?,?,?,?,?,?)";

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
			if (x <= 0) {
				Exception a = new Exception();
				throw a;
			}

			ResultSet generatedKeys = ps1.getGeneratedKeys();
			if (generatedKeys.next()) {
				id = generatedKeys.getInt(1);
			}

			PreparedStatement ps2 = conn.prepareStatement(sqlRefundPay, Statement.RETURN_GENERATED_KEYS,
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

			ps2.setString(1, refundPayment.getPayType());
			ps2.setInt(2, refundPayment.getMemberNo());
			ps2.setDouble(3, refundPayment.getAmount());
			ps2.setString(4, refundPayment.getTransactionNo());

			java.sql.Date dt = null;
			System.out.println(refundPayment.getCdDate());
			if (refundPayment.getCdDate() != null)
				dt = new java.sql.Date(refundPayment.getCdDate().getTime());

			ps2.setDate(5, dt);
			ps2.setString(6, refundPayment.getRemarks());
			ps2.setString(7, refundPayment.getpD());
			ps2.setInt(8, refundPayment.getVoucherNo());
			ps2.setInt(9, refundPayment.getSlNo());
			ps2.setString(10, refundPayment.getPaymentmode());
			ps2.setString(11, transaction.getAcCode());
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

	
	public int create(TransactionRecords transaction, RefundPayment refundPayment, ChequePayment chequePay) {

		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			conn.setAutoCommit(false);

			String sqlTransaction = "insert into transaction_records" + " ("
					+ "lastupdate, docno,slno,docdte,doctype,accode,bkcode,chqno,ch_date,bank_br,"
					+ "membno,amt,parti,a_p,flag,vr_no,sno,sr,docnoo,projcd,wc_lr_dt,ch_cl_dt,c_flag,party_cd,userid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			String sqlRefundPay = "insert into refund_pay (paytype,memb_no,amount,c_dd,c_ddte,remarks,"
					+ "p_d,vr_no,sl_no,payment_mode,accode) values (?,?,?,?,?,?,?,?,?,?,?)";

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
			if (x <= 0) {
				Exception a = new Exception();
				throw a;
			}

			ResultSet generatedKeys = ps1.getGeneratedKeys();
			if (generatedKeys.next()) {
				id = generatedKeys.getInt(1);
			}

			PreparedStatement ps2 = conn.prepareStatement(sqlRefundPay, Statement.RETURN_GENERATED_KEYS,
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

			ps2.setString(1, refundPayment.getPayType());
			ps2.setInt(2, refundPayment.getMemberNo());
			ps2.setDouble(3, refundPayment.getAmount());
			ps2.setString(4, refundPayment.getTransactionNo());

			java.sql.Date dt = null;
			if (refundPayment.getCdDate() != null)
				dt = new java.sql.Date(refundPayment.getCdDate().getTime());

			ps2.setDate(5, dt);
			ps2.setString(6, refundPayment.getRemarks());
			ps2.setString(7, refundPayment.getpD());
			ps2.setInt(8, refundPayment.getVoucherNo());
			ps2.setInt(9, refundPayment.getSlNo());
			ps2.setString(10, refundPayment.getPaymentmode());
			ps2.setString(11, transaction.getAcCode());
			int x1 = ps2.executeUpdate();
			if (x1 <= 0) {
				Exception a = new Exception();
				throw a;
			}

			PreparedStatement ps3 = conn.prepareStatement(sqlChequePay, ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_UPDATABLE);

			ps3.setInt(1, chequePay.getDocno());

			if (chequePay.getDocDate() != null)
				ps3.setDate(2, new java.sql.Date(chequePay.getDocDate().getTime()));
			else
				ps3.setDate(2, null);

			ps3.setString(3, chequePay.getBankCode());
			ps3.setString(4, chequePay.getPaymentMode());
			ps3.setString(5, chequePay.getTransactionNo());

			if (chequePay.getChequeDate() != null)
				ps3.setDate(6, new java.sql.Date(chequePay.getChequeDate().getTime()));
			else
				ps3.setDate(6, null);

			ps3.setDouble(7, chequePay.getAmount());

	
			if (chequePay.getCheqClDate() != null)
				ps3.setDate(8, new java.sql.Date(chequePay.getCheqClDate().getTime()));
			else
				ps3.setDate(8, null);

			int x2 = ps3.executeUpdate();
			if (x2 <= 0) {
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

	// Create for setting Member Dead when share Capital is Refunded(For Cash)

		public int create(TransactionRecords transaction, RefundPayment refundPayment, int membNo) {

			int id = 0;
			ConnectionPool pool = ConnectionPool.getInstance();
			pool.initialize();
			Connection conn = pool.getConnection();
			try {
				conn.setAutoCommit(false);

				String sqlTransaction = "insert into transaction_records" + " ("
						+ "lastupdate, docno,slno,docdte,doctype,accode,bkcode,chqno,ch_date,bank_br,"
						+ "membno,amt,parti,a_p,flag,vr_no,sno,sr,docnoo,projcd,wc_lr_dt,ch_cl_dt,c_flag,party_cd,userid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

				String sqlRefundPay = "insert into refund_pay (paytype,memb_no,amount,c_dd,c_ddte,remarks,"
						+ "p_d,vr_no,sl_no,payment_mode,accode) values (?,?,?,?,?,?,?,?,?,?,?)";

				String sqlUpdateMember = "update members set live_dead = 'D',refdte = ? ,ref_amt = ?  where membno = ? ";

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
				if (x <= 0) {
					Exception a = new Exception();
					throw a;
				}

				ResultSet generatedKeys = ps1.getGeneratedKeys();
				if (generatedKeys.next()) {
					id = generatedKeys.getInt(1);
				}

				PreparedStatement ps2 = conn.prepareStatement(sqlRefundPay, Statement.RETURN_GENERATED_KEYS,
						ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

				ps2.setString(1, refundPayment.getPayType());
				ps2.setInt(2, refundPayment.getMemberNo());
				ps2.setDouble(3, refundPayment.getAmount());
				ps2.setString(4, refundPayment.getTransactionNo());

				java.sql.Date dt = null;
				if (refundPayment.getCdDate() != null)
					dt = new java.sql.Date(refundPayment.getCdDate().getTime());

				ps2.setDate(5, dt);
				ps2.setString(6, refundPayment.getRemarks());
				ps2.setString(7, refundPayment.getpD());
				ps2.setInt(8, refundPayment.getVoucherNo());
				ps2.setInt(9, refundPayment.getSlNo());
				ps2.setString(10, refundPayment.getPaymentmode());
				ps2.setString(11, transaction.getAcCode());
				int x1 = ps2.executeUpdate();
				if (x1 <= 0) {
					Exception a = new Exception();
					throw a;
				}

				PreparedStatement ps3 = conn.prepareStatement(sqlUpdateMember, Statement.RETURN_GENERATED_KEYS,
						ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
				
				ps3.setDate(1, new java.sql.Date(refundPayment.getCdDate().getTime()));
				ps3.setDouble(2, refundPayment.getAmount());
				ps3.setInt(3, membNo);
				int x2 = ps3.executeUpdate();
				if (x2 <= 0) {
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

		public int create(TransactionRecords transaction, RefundPayment refundPayment, ChequePayment chequePay,int memberNo) {

			int id = 0;
			ConnectionPool pool = ConnectionPool.getInstance();
			pool.initialize();
			Connection conn = pool.getConnection();
			try {
				conn.setAutoCommit(false);

				String sqlTransaction = "insert into transaction_records" + " ("
						+ "lastupdate, docno,slno,docdte,doctype,accode,bkcode,chqno,ch_date,bank_br,"
						+ "membno,amt,parti,a_p,flag,vr_no,sno,sr,docnoo,projcd,wc_lr_dt,ch_cl_dt,c_flag,party_cd,userid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

				String sqlRefundPay = "insert into refund_pay (paytype,memb_no,amount,c_dd,c_ddte,remarks,"
						+ "p_d,vr_no,sl_no,payment_mode,accode) values (?,?,?,?,?,?,?,?,?,?,?)";

				String sqlChequePay = "insert into cheque_pay (docno, doc_date,bank_code ,payment_mode, transaction_no,"
						+ "ch_date,payment_amt, cl_date) values(?,?,?,?,?,?,?,?)";
				
				String sqlUpdateMember = "update members set live_dead = 'D',refdte = ? ,ref_amt = ?  where membno = ? ";

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
				if (x <= 0) {
					Exception a = new Exception();
					throw a;
				}

				ResultSet generatedKeys = ps1.getGeneratedKeys();
				if (generatedKeys.next()) {
					id = generatedKeys.getInt(1);
				}

				PreparedStatement ps2 = conn.prepareStatement(sqlRefundPay, Statement.RETURN_GENERATED_KEYS,
						ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

				ps2.setString(1, refundPayment.getPayType());
				ps2.setInt(2, refundPayment.getMemberNo());
				ps2.setDouble(3, refundPayment.getAmount());
				ps2.setString(4, refundPayment.getTransactionNo());

				java.sql.Date dt = null;
				if (refundPayment.getCdDate() != null)
					dt = new java.sql.Date(refundPayment.getCdDate().getTime());

				ps2.setDate(5, dt);
				ps2.setString(6, refundPayment.getRemarks());
				ps2.setString(7, refundPayment.getpD());
				ps2.setInt(8, refundPayment.getVoucherNo());
				ps2.setInt(9, refundPayment.getSlNo());
				ps2.setString(10, refundPayment.getPaymentmode());
				ps2.setString(11, transaction.getAcCode());
				int x1 = ps2.executeUpdate();
				if (x1 <= 0) {
					Exception a = new Exception();
					throw a;
				}

				PreparedStatement ps3 = conn.prepareStatement(sqlChequePay, ResultSet.TYPE_SCROLL_INSENSITIVE,
						ResultSet.CONCUR_UPDATABLE);

				ps3.setInt(1, chequePay.getDocno());

				if (chequePay.getDocDate() != null)
					ps3.setDate(2, new java.sql.Date(chequePay.getDocDate().getTime()));
				else
					ps3.setDate(2, null);

				ps3.setString(3, chequePay.getBankCode());
				ps3.setString(4, chequePay.getPaymentMode());
				ps3.setString(5, chequePay.getTransactionNo());

				if (chequePay.getChequeDate() != null)
					ps3.setDate(6, new java.sql.Date(chequePay.getChequeDate().getTime()));
				else
					ps3.setDate(6, null);

				ps3.setDouble(7, chequePay.getAmount());

		
				if (chequePay.getCheqClDate() != null)
					ps3.setDate(8, new java.sql.Date(chequePay.getCheqClDate().getTime()));
				else
					ps3.setDate(8, null);

				int x2 = ps3.executeUpdate();
				if (x2 <= 0) {
					Exception a = new Exception();
					throw a;
				}

				conn.commit();
				
				PreparedStatement ps4 = conn.prepareStatement(sqlUpdateMember, Statement.RETURN_GENERATED_KEYS,
						ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
				ps4.setDate(1, new java.sql.Date(refundPayment.getCdDate().getTime()));
				ps4.setDouble(2, refundPayment.getAmount());
				ps3.setInt(3, memberNo);
				int x3 = ps4.executeUpdate();
				if (x3 <= 0) {
					Exception a = new Exception();
					throw a;
				}

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
		
		
	public boolean remove(RefundPayment refundPayment) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "delete from refund_pay where vr_no = ? and p_d= ? and amount = ? limit 1";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, refundPayment.getVoucherNo());
			ps.setString(2, refundPayment.getpD());
			ps.setDouble(3, refundPayment.getAmount());
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

	public int count(RefundPayment refundPayment) {
		int c = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "select count(*) as total from refund_pay where vr_no = ? and p_d = ? and amount = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, refundPayment.getVoucherNo());
			ps.setString(2, refundPayment.getpD());
			ps.setDouble(3, refundPayment.getAmount());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = rs.getInt("total");
			}

		} catch (SQLException sq) {
			return 0;
		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Record Successfully counted");
		return c;
	}

	public ArrayList<RefundPayment> findMemRefundPay(int memberNo) {

		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<RefundPayment> listRefund = new ArrayList<RefundPayment>();

		try {
			String sql = "select * from refund_pay where memb_no = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, memberNo);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				{
					RefundPayment refund = new RefundPayment();

					if (rs.getString("paytype").length() > 0)
						refund.setPayType(rs.getString("paytype"));
					refund.setMemberNo(rs.getInt("memb_no"));
					refund.setAmount(rs.getDouble("amount"));
					refund.setTransactionNo(rs.getString("c_dd"));

					java.sql.Date cddte = rs.getDate("c_ddte");
					if (cddte != null)
						refund.setCdDate(new java.util.Date((cddte).getTime()));

					refund.setRemarks(rs.getString("remarks"));
					refund.setpD(rs.getString("p_D"));
					refund.setVoucherNo(rs.getInt("vr_no"));
					refund.setSlNo(rs.getInt("sl_no"));
					refund.setPaymentmode(rs.getString("payment_mode"));
					refund.setAccode((rs.getString("accode")));
					listRefund.add(refund);
				}
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a receipts." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return listRefund;

	}
public static double findTotalPlotRefund(int memberNo,Date endDte){
	ConnectionPool pool = ConnectionPool.getInstance();
	pool.initialize();
	Connection conn = pool.getConnection();
	double totalRef=0.0;
	try {
		String sql = "select sum(amount) as total_refund from refund_pay where memb_no = ? and p_d='P' and c_ddte = ? ";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, memberNo);
		ps.setDate(2, new java.sql.Date(endDte.getTime()));
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			totalRef=rs.getDouble("total_refund");
		}
	} catch (SQLException sq) {
		System.out.println("Unable to find record." + sq);
	} finally {
		pool.putConnection(conn);
	}
	return totalRef;

}
public static double findTotalDevRefund(int memberNo,Date endDte){
	ConnectionPool pool = ConnectionPool.getInstance();
	pool.initialize();
	Connection conn = pool.getConnection();
	double totalRef=0.0;
	try {
		String sql = "select sum(amount) as total_refund from refund_pay where memb_no = ? and p_d='D' and c_ddte=? ";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, memberNo);
		ps.setDate(2, new java.sql.Date(endDte.getTime()));
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			totalRef=rs.getDouble("total_refund");
		}
	} catch (SQLException sq) {
		System.out.println("Unable to find record." + sq);
	} finally {
		pool.putConnection(conn);
	}
	return totalRef;

}
public static double findTotalRecRefund(int memberNo,Date endDte){
	ConnectionPool pool = ConnectionPool.getInstance();
	pool.initialize();
	Connection conn = pool.getConnection();
	double totalRef=0.0;
	try {
		String sql = "select sum(amount) as total_refund from refund_pay where memb_no = ? and p_d='D' and c_ddte = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, memberNo);
		ps.setDate(2, new java.sql.Date(endDte.getTime()));
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			totalRef=rs.getDouble("total_refund");
		}
	} catch (SQLException sq) {
		System.out.println("Unable to find record." + sq);
	} finally {
		pool.putConnection(conn);
	}
	return totalRef;

}
	public static void main(String a[]) {
		// RefundPaymentDao dao = new RefundPaymentDao();
		// Date d1 = null;
		// Date d2 = new Date();
		// Date d3 = new Date();
		// d3 = DateUtils.convertDate("02/04/2016");
		//
		//
		// TransactionRecords t = new TransactionRecords(
		// 44999,1,d1,"D","E0010","01","hv",d1," ",7299,8400.00,"ESTABLISHMENT
		// FEES UPTO 31/03/2016",1,26,8,1,d2);
		//
		// RefundPayment r = new RefundPayment("r", 90,
		// 452.00,"transactionNo",d3,"remarks",
		// "pD",5, 8,"paymentmode");
		//
		// ChequePayment c = new ChequePayment(500,
		// d2,"bCode","paymentMode","transactionNo",
		// d3,5431.00,d2);
		//
		//
		// int id = dao.create(t, r);
		//
		// int id = dao.create(t, r,c);
		//
		// System.out.println(id);
		//
		List<RefundPayment> list = new RefundPaymentDao().findMemRefundPay(90);
		for (RefundPayment r : list)
			System.out.println(r);

	}

}
