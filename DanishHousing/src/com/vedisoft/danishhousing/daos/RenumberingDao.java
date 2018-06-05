package com.vedisoft.danishhousing.daos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import org.apache.poi.ss.usermodel.DateUtil;

import com.vedisoft.danishhousing.config.ConnectionPool;
import com.vedisoft.danishhousing.config.DateUtils;

public class RenumberingDao {

	public static boolean renumbering(int transactionNo, Date fromDate, Date toDate) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		boolean value = true;
		try {
			conn.setAutoCommit(false);
			String sql = " call renumbering(?,?)";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setDate(1, new java.sql.Date(fromDate.getTime()));
			cstmt.setDate(2, new java.sql.Date(toDate.getTime()));
			boolean b = cstmt.execute();
			if (!b) {

				value = false;
			}

			ArrayList<Integer> listId = new ArrayList<Integer>();
			String sql2 = "select distinct vr_no from temp_table";
			PreparedStatement psmt1 = conn.prepareStatement(sql2);
			ResultSet rs = psmt1.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("vr_no");
				listId.add(id);
			}

			System.out.println(listId);
			int ctr = transactionNo;
			String sql3 = "update temp_table set docnoo = ? where vr_no = ?";
			PreparedStatement psmt2 = conn.prepareStatement(sql3);
			// for (int i = ctr, j = 0; j < listId.size(); i++, j++) {
			// if (listId.get(j) != 0) {
			// psmt2.setInt(1, i);
			// psmt2.setInt(2, listId.get(j));
			// psmt2.addBatch();
			// }
			// }
			int i = ctr, j = 0;
			while (j < listId.size()) {
				if (listId.get(j) != 0) {
					psmt2.setInt(1, i);
					psmt2.setInt(2, listId.get(j));
					psmt2.addBatch();
					i++;
				} else {
					psmt2.setInt(1, 0);
					psmt2.setInt(2, 0);
					psmt2.addBatch();
				}
				j++;
			}
			int results[] = psmt2.executeBatch();
			System.out.println("Statements Processed : " + results.length);

//			ArrayList<Integer> listId1 = new ArrayList<Integer>();
//			ArrayList<Integer> listId2 = new ArrayList<Integer>();
//			String sql4 = "select  docnoo,docno from temp_table";
//			PreparedStatement psmt3 = conn.prepareStatement(sql4);
//			ResultSet rs1 = psmt3.executeQuery();
//			while (rs1.next()) {
//				int id1 = rs1.getInt("docnoo");
//				int id2 = rs1.getInt("docno");
//				listId1.add(id1);
//				listId2.add(id2);
//			}
//
//			System.out.println(listId1);
//
//			String sql5 = "update temp_table set docno = ? where docno=?";
//			PreparedStatement psmt4 = conn.prepareStatement(sql5);
//			for (int x = 0, y = 0; x < listId1.size(); x++, y++) {
//				if (listId1.get(x) != 0) {
//					psmt4.setInt(1, listId1.get(x));
//					psmt4.setInt(2, listId2.get(y));
//					System.out.println("update temp_table set docno = "+listId1.get(x)+" where docno="+listId2.get(y));
//					psmt4.addBatch();
//				}
//			}
//			int results1[] = psmt4.executeBatch();
//			System.out.println("Statements Processed : " + results1.length);
			
			
			
			 String sql1 = " call renumbering1(?,?)";
			 CallableStatement cstmt1 = conn.prepareCall(sql1);
			 cstmt1.setDate(1, new java.sql.Date(fromDate.getTime()));
			 cstmt1.setDate(2, new java.sql.Date(toDate.getTime()));
			 boolean b1 = cstmt1.execute();
			 if (!b1) {
			 value = false;
			 }

			conn.commit();

		} catch (SQLException sq) {
			System.out.println("Batch Problem in temp_table." + sq);
			value = false;

		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException sq) {
				System.out.println("Unable to set autocommit to true." + sq);
				value = false;
			}
			pool.putConnection(conn);
		}
		return value;
	}

	public static void main(String[] args) {

		java.util.Date startDate = DateUtils.convertDate("01/04/2016");
		java.util.Date endDate = DateUtils.convertDate("31/03/2017");
		System.out.println(RenumberingDao.renumbering(1, startDate, endDate));
	}
}
