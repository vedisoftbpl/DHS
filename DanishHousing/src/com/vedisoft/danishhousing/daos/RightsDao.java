package com.vedisoft.danishhousing.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.vedisoft.danishhousing.config.ConnectionPool;
import com.vedisoft.danishhousing.pojos.Rights;

public class RightsDao {
	public boolean setRights(String userType, int rightId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = new String();
			if (userType.equals("Accounts")) {
				sql = "update rights set accounts= \"yes\"  where rights_id = ?";
				System.out.println("Accounts user");
			} else if (userType.equals("Data Entry")) {
				sql = "update rights set data_entry=\"yes\"  where rights_id = ?";
				System.out.println("data entry user");
			} else if (userType.equals("Reception")) {
				sql = "update rights set reception=\"yes\"  where rights_id = ?";
				System.out.println("reception user");
			}
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rightId);
			System.out.println("Executing query");
			int x = ps.executeUpdate();
			if (x == 0) {
				System.out.println("Record not Saved");
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

	public static ArrayList<Integer> findRights(String userType) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<Integer> rList = new ArrayList<Integer>();
		try {
			String sql = new String();
			if (userType.equals("Accounts")) {
				sql = "select right_id from rights where  accounts= yes";
			} else if (userType.equals("Data Entry")) {
				sql = "select right_id from rights where  data_entry= yes";
			} else if (userType.equals("Reception")) {
				sql = "select right_id from rights where  reception= yes";
			}
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("rights_id");
				rList.add(new Integer(id));
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find record");
			sq.printStackTrace();
		} finally {
			pool.putConnection(conn);
		}

		return rList;
	}
	public static ArrayList<Rights> findAllRights() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<Rights> rList = new ArrayList<Rights>();
		try {
			String sql = "SELECT * from rights";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Rights rt=new Rights();
				rt.setRightsId(rs.getInt("rights_id"));
				rt.setRightsName(rs.getString("rights_name"));
				rt.setAccounts(rs.getString("accounts"));
				rt.setDataEntry(rs.getString("data_entry"));
				rt.setReception(rs.getString("reception"));
				rList.add(rt);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find record");
			sq.printStackTrace();
		} finally {
			pool.putConnection(conn);
		}

		return rList;
	}
	public static ArrayList<Integer> findAllRightsId() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<Integer> rList = new ArrayList<Integer>();
		try {
			String sql = "SELECT rights_id from rights";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				int rt=rs.getInt("rights_id");
				rList.add(rt);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find record");
			sq.printStackTrace();
		} finally {
			pool.putConnection(conn);
		}

		return rList;
	}
}
