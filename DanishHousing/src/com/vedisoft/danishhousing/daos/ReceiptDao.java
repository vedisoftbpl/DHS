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
import com.vedisoft.danishhousing.pojos.AccountMasterFlagsEnum;
import com.vedisoft.danishhousing.pojos.ReceiptRecord;
import com.vedisoft.danishhousing.pojos.TransactionRecords;

public class ReceiptDao {

	public int create(TransactionRecords transaction, ReceiptRecord receipt) {
		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			conn.setAutoCommit(false);

			String sqlTransaction = "insert into transaction_records" + " ("
					+ "lastupdate, docno,slno,docdte,doctype,accode,bkcode,chqno,ch_date,bank_br,"
					+ "membno,amt,parti,a_p,flag,vr_no,sno,sr,docnoo,projcd,wc_lr_dt,ch_cl_dt,c_flag,party_cd,userid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			String sqlReceipt = "insert into receipt_records" + " (" + "s_no , paytype, slno, recdte, receno,prefix,membnme, membno,"
					+ "f_h_nme,mad1,mad2,mad3,amount,balchq, c_dd, c_ddte,fullpay,inst1,inst2,inst3,chalno,chaldte, plsize, plno, projcd,chqdhr,flag, trcode,"
					+ " remarks, r_c, p_d,  accode, branch,d_c,wc_lr_dt,"
					+ "userid,lastupdate,city) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

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
			ps1.setString(5, transaction.getDocType());						//D
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
			
			PreparedStatement ps2 = conn.prepareStatement(sqlReceipt, Statement.RETURN_GENERATED_KEYS,
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			ps2.setInt(1, id);
			ps2.setString(2, String.valueOf(receipt.getPayType()));
			ps2.setInt(3, receipt.getSlno());
			java.sql.Date recDate = null;
			if (receipt.getRecDte() != null)
				recDate = new java.sql.Date(receipt.getRecDte().getTime());
			ps2.setDate(4, recDate);
			ps2.setInt(5, receipt.getReceno());
			ps2.setString(6, receipt.getPrefix());
			ps2.setString(7, receipt.getMembNme());
			ps2.setInt(8, receipt.getMembNo());
			ps2.setString(9, receipt.getfHNme());
			ps2.setString(10, receipt.getMad1());
			ps2.setString(11, receipt.getMad2());
			ps2.setString(12, receipt.getMad3());
			
			ps2.setDouble(13, receipt.getAmount());
			System.out.println(receipt.getAmount());
			ps2.setDouble(14, receipt.getBalChq());
			ps2.setString(15, receipt.getcDd());
			java.sql.Date cdDate = null;
			if (receipt.getcDdte() != null)
				cdDate = new java.sql.Date(receipt.getcDdte().getTime());
			ps2.setDate(16, cdDate);
			ps2.setString(17, receipt.getFullPay());
			ps2.setString(18, receipt.getInst1());
			ps2.setString(19, receipt.getInst2());
			ps2.setString(20, receipt.getInst3());
			ps2.setInt(21, receipt.getChalNo());
			java.sql.Date chalDate = null;
			if (receipt.getChalDte() != null)
				chalDate = new java.sql.Date(receipt.getChalDte().getTime());
			ps2.setDate(22, chalDate);
			ps2.setString(23, receipt.getPlSize());
			ps2.setString(24, receipt.getPlNo());
			ps2.setDouble(25, receipt.getProjCd());
			ps2.setString(26, receipt.getChqDhr());
			ps2.setString(27, receipt.getFlag());
			ps2.setString(28, String.valueOf(receipt.getTrCode()));
			ps2.setString(29, receipt.getRemarks());
			ps2.setString(30, String.valueOf(receipt.getrC()));
			ps2.setString(31, receipt.getpD());
			ps2.setString(32, receipt.getAccode());
			ps2.setString(33, receipt.getBranch());
			ps2.setString(34, String.valueOf(receipt.getdC()));
		
			
			java.sql.Date wLrDt = null;
			if (receipt.getwLrDt() != null)
				wLrDt = new java.sql.Date(receipt.getwLrDt().getTime());
			ps2.setDate(35, wLrDt);
			ps2.setInt(36, receipt.getUserId());
			java.sql.Date lastUpdate1 = null;
			if (receipt.getLastUpdate() != null)
				lastUpdate1 = new java.sql.Date(receipt.getLastUpdate().getTime());
			ps2.setDate(37, lastUpdate1);
			
			ps2.setString(38,receipt.getCity());
			
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
//
//	public TransactionRecords findTransactionRecord(int transactionId) {
//		ConnectionPool pool = ConnectionPool.getInstance();
//		pool.initialize();
//		Connection conn = pool.getConnection();
//		TransactionRecords transaction = new TransactionRecords();
//		try {
//			String sql = "select * from transaction_records where tr_id = ?";
//			PreparedStatement ps = conn.prepareStatement(sql);
//			ps.setInt(1, transactionId);
//			ResultSet rs = ps.executeQuery();
//			if (rs.next()) {
//				transaction.setTrId(transactionId);
//				transaction.setsNo(rs.getInt("s_no"));
//				transaction.setSlno(rs.getInt("slno"));
//				transaction.setDocNo(rs.getInt("docno"));
//				java.sql.Date docDate = rs.getDate("docdte");
//				if (docDate != null)
//					transaction.setDocDte(new java.util.Date((docDate).getTime()));
//				else
//					transaction.setDocDte(docDate);
//				transaction.setDocType(rs.getString("doctype"));
//				transaction.setAcCode(rs.getString("accode"));
//				transaction.setBkCode(rs.getString("bkcode"));
//				transaction.setChqNo(rs.getInt("chqno"));
//				java.sql.Date chDate = rs.getDate("ch_date");
//				if (chDate != null)
//					transaction.setChDate(new java.util.Date((chDate).getTime()));
//				else
//					transaction.setChDate(chDate);
//				transaction.setBankBr(rs.getString("bank_br"));
//				transaction.setMembNo(rs.getInt("membno"));
//				transaction.setAmt(rs.getDouble("amt"));
//				transaction.setParti(rs.getString("parti"));
//				transaction.setaP(rs.getString("a_p"));
//				transaction.setFlag(rs.getInt("flag"));
//				transaction.setVrNo(rs.getString("vr_no"));
//				transaction.setsN(rs.getString("sno"));
//				transaction.setsR(rs.getString("sr"));
//				transaction.setDocNoo(rs.getString("docnoo"));
//				transaction.setProjCd(rs.getInt("projcd"));
//				java.sql.Date wcLrDt = rs.getDate("wc_lr_dt");
//				if (wcLrDt != null)
//					transaction.setWcLrDt(new java.util.Date((wcLrDt).getTime()));
//				else
//					transaction.setWcLrDt(wcLrDt);
//				java.sql.Date chClDt = rs.getDate("ch_cl_dt");
//				if (chClDt != null)
//					transaction.setChClDt(new java.util.Date((chClDt).getTime()));
//				else
//					transaction.setChClDt(chClDt);
//				transaction.setcFlag(rs.getString("c_flag"));
//				transaction.setPartyCd(rs.getInt("party_cd"));
//				transaction.setUserId(rs.getInt("userid"));
//				java.sql.Date lastupdate = rs.getDate("lastupdate");
//				if (lastupdate != null)
//					transaction.setLastUpdate(new java.util.Date((lastupdate).getTime()));
//				else
//					transaction.setLastUpdate(lastupdate);
//			}
//		} catch (SQLException sq) {
//			System.out.println("Unable to find a row." + sq);
//		} finally {
//			pool.putConnection(conn);
//		}
//		return transaction;
//	}

	
	
	public ArrayList<ReceiptRecord> findReceiptRecords(int receiptNo) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<ReceiptRecord> listReceipt = new ArrayList<ReceiptRecord>();
		
		try {
			String sql = "select * from receipt_records where receno = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, receiptNo);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) { {
				ReceiptRecord receipt = new ReceiptRecord();
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
				receipt.setPrefix(rs.getString("prefix"));
				receipt.setMembNme(rs.getString("membnme"));
				receipt.setMembNo(rs.getInt("membno"));
				receipt.setfHNme(rs.getString("f_h_nme"));
				receipt.setMad1(rs.getString("mad1"));
				receipt.setMad2(rs.getString("mad2"));
				receipt.setMad3(rs.getString("mad3"));
				receipt.setAmount(rs.getDouble("amount"));
				
				receipt.setBalChq(rs.getDouble("balchq"));
				receipt.setcDd(rs.getString("c_dd"));
				java.sql.Date cddate = rs.getDate("c_ddte");
				if (cddate != null)
					receipt.setcDdte(new java.util.Date((cddate).getTime()));
				else
					receipt.setcDdte(cddate);
			
				
				receipt.setFullPay(rs.getString("fullpay"));
				receipt.setInst1(rs.getString("inst1"));
				receipt.setInst2(rs.getString("inst2"));
				receipt.setInst3(rs.getString("inst3"));
				receipt.setChalNo(rs.getInt("chalno"));
				
				java.sql.Date chaldte = rs.getDate("chaldte");
				if (chaldte != null)
					receipt.setChalDte(new java.util.Date((chaldte).getTime()));
				else
					receipt.setChalDte(chaldte);
				receipt.setPlSize(rs.getString("plsize"));
				receipt.setPlNo(rs.getString("plno"));
				receipt.setProjCd(rs.getInt("projcd"));
				receipt.setChqDhr(rs.getString("chqdhr"));
				receipt.setFlag(rs.getString("flag"));
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
					receipt.setdC(rs.getString("d_c"));
				}
				java.sql.Date wc_lr_dt = rs.getDate("wc_lr_dt");
				if (wc_lr_dt != null)
					receipt.setwLrDt(new java.util.Date((wc_lr_dt).getTime()));
				else
					receipt.setwLrDt(wc_lr_dt);
				
				
				receipt.setUserId(rs.getInt("userid"));
				java.sql.Date lastupdate = rs.getDate("lastupdate");
				if (lastupdate != null)
					receipt.setLastUpdate(new java.util.Date((lastupdate).getTime()));
				else
					receipt.setLastUpdate(lastupdate);
				listReceipt.add(receipt);
			}
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a receipts." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return listReceipt;
	}

	public static void main(String a[]) {
		ReceiptDao dao = new ReceiptDao();
		 Date d1 = null;
		 Date d2 = new Date();
		 Date d3 = new Date();
		 d3 = DateUtils.convertDate("02/04/2016");
		 String fl = AccountMasterFlagsEnum.Developement.getValue();
		 System.out.println(fl);
		 TransactionRecords t = new TransactionRecords(
		 44901,1,d1,"D","E0010","01","hv",d1," ",7299,8400.00,"ESTABLISHMENT FEES UPTO 31/03/2016",1,25,8,1,d2);
		 ReceiptRecord r = new ReceiptRecord('R',1,d3,44901,"Mr.","Name",25,"FName","a1","a2","a3",84100.00,6541.00,"51361",d1,"No","","","",45,d2,
				 "35x60","DK-1/326",8,"chqdhr","flag",'R',
				 "ESTABLISHMENT FEES UPTO 31/03/2016",'r',fl,"E0010","Branch","Checque",d2,4,d2,"chhatarpur");
		 int id = dao.create(t, r);
		 System.out.println(id);
//		TransactionRecords t1 = dao.findTransactionRecord(3);
//		System.out.println(t1);
		 
//		 List<ReceiptRecord> list =dao.findReceiptRecords("44902");
//		 for(ReceiptRecord r : list)
//			 System.out.println(r);

	}

}
