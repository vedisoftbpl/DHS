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
import com.vedisoft.danishhousing.pojos.ReceiptRecord;
import com.vedisoft.danishhousing.pojos.TransactionRecords;

import sun.net.www.content.text.plain;

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

	public static void main(String[] args) {
		
		 List<TransactionRecords> list =new TransactionRecordsDao().findMemTransactionRecord(7299);
		 for(TransactionRecords t : list)
			 System.out.println(t);
	}
	
}
