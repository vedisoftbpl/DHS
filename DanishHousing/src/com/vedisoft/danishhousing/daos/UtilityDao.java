package com.vedisoft.danishhousing.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.vedisoft.danishhousing.config.ConnectionPool;
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
	
	public static int maxVoucherNo() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		int vrno = 0;
		Connection conn = pool.getConnection();
		try {
			String sql = "select max(vr_no) max from transaction_records";
			PreparedStatement ps = conn.prepareStatement(sql);
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
			String sql = "select s_no from receipt_records where receno = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, recno);
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
	
	
public static void main(String args[]){
	System.out.println("Max Receipt Number :" + maxReceiptNo());
//	System.out.println(checkReceiptNo(44902));
	System.out.println("Max Voucher Number :" + maxVoucherNo());
}
}
