package com.vedisoft.danishhousing.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.vedisoft.danishhousing.config.ConnectionPool;
import com.vedisoft.danishhousing.config.DateUtils;
import com.vedisoft.danishhousing.pojos.Users;

public class UtilityDao {
	
	public static int maxReceiptNo() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		int recno = 0;
		Connection conn = pool.getConnection();
		try {
			String sql = "select max(receno) max from receipt_records";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				recno = rs.getInt("max");
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return recno + 1;
	}
	
	public static int maxVoucherNo(Date d) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		int vrno = 0;
		Date d1 = DateUtils.getFinancialStartDate(d);
		java.sql.Date date1 = null;
		if (d1 != null)
			date1 = new java.sql.Date(d1.getTime());
		Date d2 = DateUtils.getFinancialLastDate(d);
		java.sql.Date date2 = null;
		if (d2 != null)
			date2 = new java.sql.Date(d2.getTime());
		Connection conn = pool.getConnection();
		try {
			String sql = "select coalesce(max(vr_no),0) as max from transaction_records where docdte between ? and ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDate(1, date1);
			ps.setDate(2, date2);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
					vrno = rs.getInt("max");
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return vrno + 1;
	}
	
	public static boolean checkReceiptNo(int recno) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		int sno = 0;
		Connection conn = pool.getConnection();
		try {
			String sql = "select receipt_id from receipt_records where receno = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, recno);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				sno = rs.getInt("receipt_id");
			}
			
		} catch (SQLException sq) {
			System.out.println("Unable to find row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		if(sno > 0){
			return false;
		}
		else
			return true;
	}
	
	public static boolean checkVoucherNo(int vrno, Date d) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		int sno = 0;
		Date d1 = DateUtils.getFinancialStartDate(d);
		java.sql.Date date1 = null;
		if (d1 != null)
			date1 = new java.sql.Date(d1.getTime());
		Date d2 = DateUtils.getFinancialLastDate(d);
		java.sql.Date date2 = null;
		if (d2 != null)
			date2 = new java.sql.Date(d2.getTime());
		Connection conn = pool.getConnection();
		try {
			String sql = "select s_no from transaction_records where vr_no = ? and docdte between ? and ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, vrno);
			ps.setDate(2, date1);
			ps.setDate(3, date2);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				sno = rs.getInt("s_no");
			}
			
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		if(sno > 0){
			return false;
		}
		else
			return true;
	}
	
	public static int startingPageNo() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		int pageNo = 0;
		Connection conn = pool.getConnection();
		try {
			String sql = "select page_no from cashbook_page_no";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				pageNo = rs.getInt("page_no");
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a new row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return pageNo;
	}
	
	public static void savePageNo(int pageNo) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "update cashbook_page_no set page_no = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, pageNo);
			ps.executeUpdate();
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Record SuccessFully Added");
	}
public static void main(String args[]){
//	System.out.println("Max Receipt Number :" + maxReceiptNo());
//	System.out.println(checkReceiptNo(44926));
	System.out.println(checkVoucherNo(27 , DateUtils.convertDate("31/03/2017")));
	System.out.println("Max Voucher Number :" + maxVoucherNo(DateUtils.convertDate("31/03/2017")));
}
}
