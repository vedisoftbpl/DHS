package com.vedisoft.danishhousing.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import com.vedisoft.danishhousing.config.ConnectionPool;
import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.pojos.Members;
import com.vedisoft.danishhousing.pojos.ReceiptRecord;
import com.vedisoft.danishhousing.pojos.TransactionRecords;

public class TransactionDao {

	public int create(TransactionRecords transaction, ReceiptRecord receipt) {
		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			conn.setAutoCommit(false);

			String sqlTransaction = "insert into transaction_records" + " ("
					+ "s_no, docno,slno,docdte,doctype,accode,bkcode,chqno,ch_date,bank_br,"
					+ "membno,amt,parti,flag,vr_no,projcd,userid,lastupdate) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			String sqlReceipt = "insert into receipt_records" + " (" + " s_no, paytype, slno, recdte, receno, membno,"
					+ "cashamt, chqamt, c_dd, c_ddte, plsize, plno, projcd, trcode,"
					+ " remarks, r_c, p_d,  accode, branch,d_c,"
					+ "userid,lastupdate) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement ps1 = conn.prepareStatement(sqlTransaction, Statement.RETURN_GENERATED_KEYS,
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ps1.setInt(1, transaction.getsNo());
			ps1.setInt(2, transaction.getDocNo());
			ps1.setInt(3, transaction.getSlno());
			java.sql.Date docDate = null;
			if (transaction.getDocDte() != null)
				docDate = new java.sql.Date(transaction.getDocDte().getTime());
			ps1.setDate(4, docDate);
			ps1.setString(5, transaction.getDocType());
			ps1.setString(6, transaction.getAcCode());
			ps1.setString(7, transaction.getBkCode());
			ps1.setInt(8, transaction.getChqNo());
			java.sql.Date chkDate = null;
			if (transaction.getChDate() != null)
				chkDate = new java.sql.Date(transaction.getChDate().getTime());
			ps1.setDate(9, chkDate);
			ps1.setString(10, transaction.getBankBr());
			ps1.setInt(11, transaction.getMembNo());
			ps1.setDouble(12, transaction.getAmt());
			ps1.setString(13, transaction.getParti());
			ps1.setInt(14, transaction.getFlag());
			ps1.setString(15, transaction.getVrNo());
			ps1.setInt(16, transaction.getProjCd());
			ps1.setInt(17, transaction.getUserId());
			java.sql.Date lastUpdate = null;
			if (transaction.getLastUpdate() != null)
				lastUpdate = new java.sql.Date(transaction.getLastUpdate().getTime());
			ps1.setDate(18, lastUpdate);
			int x = ps1.executeUpdate();
			if (x == 0) {
				return 0;
			}
			ResultSet generatedKeys = ps1.getGeneratedKeys();
			if (generatedKeys.next()) {
				id = generatedKeys.getInt(1);
			}

			PreparedStatement ps2 = conn.prepareStatement(sqlReceipt, Statement.RETURN_GENERATED_KEYS,
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ps2.setInt(1, receipt.getsNo());
			ps2.setString(2, String.valueOf(receipt.getPayType()));
			ps2.setInt(3, receipt.getSlno());
			java.sql.Date recDate = null;
			if (receipt.getRecDte() != null)
				recDate = new java.sql.Date(receipt.getRecDte().getTime());
			ps2.setDate(4, recDate);
			ps2.setInt(5, receipt.getReceno());
			ps2.setInt(6, receipt.getMembNo());
			ps2.setDouble(7, receipt.getCashAmt());
			ps2.setDouble(8, receipt.getChqAmt());
			ps2.setDouble(9, receipt.getcDd());
			java.sql.Date cdDate = null;
			if (receipt.getcDdte() != null)
				cdDate = new java.sql.Date(receipt.getcDdte().getTime());
			ps2.setDate(10, cdDate);
			ps2.setString(11, receipt.getPlSize());
			ps2.setString(12, receipt.getPlNo());
			ps2.setDouble(13, receipt.getProjCd());
			ps2.setString(14, String.valueOf(receipt.getTrCode()));
			ps2.setString(15, receipt.getRemarks());
			ps2.setString(16, String.valueOf(receipt.getrC()));
			ps2.setString(17, receipt.getpD());
			ps2.setString(18, receipt.getAccode());
			ps2.setString(19, receipt.getBranch());
			ps2.setString(20, String.valueOf(receipt.getdC()));
			ps2.setInt(21, receipt.getUserId());
			java.sql.Date lastUpdate1 = null;
			if (receipt.getLastUpdate() != null)
				lastUpdate1 = new java.sql.Date(receipt.getLastUpdate().getTime());
			ps2.setDate(22, lastUpdate1);
			int x1 = ps2.executeUpdate();
			if (x1 == 0) {
				return 0;
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

	public TransactionRecords findTransactionRecord(int transactionId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		TransactionRecords transaction = new TransactionRecords();
		try {
			String sql = "select * from transaction_records where tr_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, transactionId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				transaction.setTrId(transactionId);
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
				transaction.setChqNo(rs.getInt("chqno"));
				java.sql.Date chDate = rs.getDate("ch_date");
				if (chDate != null)
					transaction.setChDate(new java.util.Date((chDate).getTime()));
				else
					transaction.setChDate(chDate);
				transaction.setBankBr(rs.getString("bank_br"));
				transaction.setMembNo(rs.getInt("membno"));
				transaction.setAmt(rs.getDouble("amt"));
				transaction.setParti(rs.getString("parti"));
				transaction.setFlag(rs.getInt("flag"));
				transaction.setVrNo(rs.getString("vr_no"));
				transaction.setProjCd(rs.getInt("projcd"));
				transaction.setUserId(rs.getInt("userid"));
				java.sql.Date lastupdate = rs.getDate("lastupdate");
				if (lastupdate != null)
					transaction.setLastUpdate(new java.util.Date((lastupdate).getTime()));
				else
					transaction.setLastUpdate(lastupdate);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return transaction;
	}

	public ReceiptRecord findReceiptRecord(int recordId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ReceiptRecord receipt = new ReceiptRecord();
		try {
			String sql = "select * from receipt_records where record_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, recordId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				receipt.setRecordId(recordId);
				receipt.setsNo(rs.getInt("s_no"));
				if (rs.getString("paytype").length() > 0)
					receipt.setPayType(rs.getString("paytype").charAt(0));
				receipt.setSlno(rs.getInt("slno"));
				java.sql.Date recdte = rs.getDate("recdte");
				if (recdte != null)
					receipt.setRecDte(new java.util.Date((recdte).getTime()));
				else
					receipt.setRecDte(recdte);
				receipt.setReceno(rs.getInt("receno"));
				receipt.setMembNo(rs.getInt("membno"));
				receipt.setCashAmt(rs.getDouble("cashamt"));
				receipt.setChqAmt(rs.getDouble("chqamt"));
				receipt.setcDd(rs.getInt("c_dd"));
				java.sql.Date cddate = rs.getDate("c_ddte");
				if (cddate != null)
					receipt.setcDdte(new java.util.Date((cddate).getTime()));
				else
					receipt.setcDdte(cddate);
				receipt.setPlSize(rs.getString("plsize"));
				receipt.setPlNo(rs.getString("plno"));
				receipt.setProjCd(rs.getInt("projcd"));
				if (rs.getString("trcode").length() > 0)
					receipt.setTrCode(rs.getString("trcode").charAt(0));
				receipt.setRemarks(rs.getString("remarks"));
				if (rs.getString("r_c").length() > 0) {
					receipt.setrC(rs.getString("r_c").charAt(0));
				}
				receipt.setpD(rs.getString("p_d"));
				receipt.setAccode(rs.getString("accode"));
				receipt.setBranch(rs.getString("branch"));
				
				if (rs.getString("d_c").length() > 0) {
					receipt.setdC(rs.getString("d_c").charAt(0));
				}
				receipt.setUserId(rs.getInt("userid"));
				java.sql.Date lastupdate = rs.getDate("lastupdate");
				if (lastupdate != null)
					receipt.setLastUpdate(new java.util.Date((lastupdate).getTime()));
				else
					receipt.setLastUpdate(lastupdate);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return receipt;
	}

	public static void main(String a[]) {
		TransactionDao dao = new TransactionDao();
//		 Date d1 = null;
//		 Date d2 = new Date();
//		 Date d3 = new Date();
//		 d3 = DateUtils.convertDate("02/04/2016");
//		 TransactionRecords t = new TransactionRecords(109061,
//		 44901,1,d1,"D","E0010","01",0,d1," ",7299,8400.00,"ESTABLISHMENT FEES UPTO 31/03/2016",1," ",8,1,d2);
//		 ReceiptRecord r = new
//		 ReceiptRecord(109061,'R',1,d3,44901,7299,8400.00,0.00,0,d1,"35x60 RC","DK-1/326",8,'R',"ESTABLISHMENT FEES UPTO 31/03/2016",' ',"O","E0010","A",' ',1,d2);
//		 int id = dao.create(t, r);
//		 System.out.println(id);
		TransactionRecords t1 = dao.findTransactionRecord(1);
		System.out.println(t1);
		ReceiptRecord r1 = dao.findReceiptRecord(1);
		System.out.println(r1);

	}

}
