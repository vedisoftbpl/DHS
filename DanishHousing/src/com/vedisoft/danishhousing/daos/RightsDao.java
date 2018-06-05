package com.vedisoft.danishhousing.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.vedisoft.danishhousing.config.ConnectionPool;
import com.vedisoft.danishhousing.pojos.ProcessDto;
import com.vedisoft.danishhousing.pojos.Rights;

public class RightsDao {
	public boolean setRights(String userType, int rightId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = new String();
			if (userType.equals("Accounts")) {
				sql = "update rights set accounts= \"yes\"  where process_id = ?";
				System.out.println("Accounts user");
			} else if (userType.equals("Data Entry")) {
				sql = "update rights set data_entry=\"yes\"  where process_id = ?";
				System.out.println("data entry user");
			} else if (userType.equals("Reception")) {
				sql = "update rights set reception=\"yes\"  where process_id = ?";
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
				sql = "select process_id from rights where  accounts= yes";
			} else if (userType.equals("Data Entry")) {
				sql = "select process_id from rights where  data_entry= yes";
			} else if (userType.equals("Reception")) {
				sql = "select process_id from rights where  reception= yes";
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

	public static String findProcessById(int processId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		String pName = new String();
		try {
			String sql = "select process_name from process where  process_id = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, processId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				pName = rs.getString("process_name");
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find record");
			sq.printStackTrace();
		} finally {
			pool.putConnection(conn);
		}

		return pName;
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
				Rights rt = new Rights();
				rt.setRightsId(rs.getInt("process_id"));
				rt.setRightsName(findProcessById(rs.getInt("process_id")));
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

	public static ArrayList<String> findAllMenu(String userType) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<String> mList = new ArrayList<String>();
		try {
			String sql = new String();
			if (userType.equals("Accounts")) {
				sql = "SELECT menu from process where process_id in (SELECT process_id from rights where accounts= yes) group by menu ";
			} else if (userType.equals("Data Entry")) {
				sql = "SELECT menu from process where process_id in (SELECT process_id from rights where data_entry= yes) group by menu";
			} else if (userType.equals("Reception")) {
				sql = "SELECT menu from process where process_id in (SELECT process_id from rights where receotion= yes) group by menu";
			}
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				String menu = rs.getString("menu");
				mList.add(menu);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find record");
			sq.printStackTrace();
		} finally {
			pool.putConnection(conn);
		}

		return mList;
	}
	
	public static ArrayList<String> findAllMenu() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<String> mList = new ArrayList<String>();
		try {
			String sql = "SELECT menu from process  group by menu ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				String menu = rs.getString("menu");
				mList.add(menu);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find record");
			sq.printStackTrace();
		} finally {
			pool.putConnection(conn);
		}

		return mList;
	}
	
	public static ArrayList<ProcessDto> findAllProcess(String userType) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<ProcessDto> pList = new ArrayList<ProcessDto>();
		try {
			String sql = new String();
			if (userType.equals("Accounts")) {
				sql = "SELECT * from process where process_id in (SELECT process_id from rights where accounts= 'yes')";
			} else if (userType.equals("Data Entry")) {
				sql = "SELECT * from process where process_id in (SELECT process_id from rights where data_entry= 'yes')";
			} else if (userType.equals("Reception")) {
				sql = "SELECT * from process where process_id in (SELECT process_id from rights where reception= 'yes')";
			}
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProcessDto pDto=new ProcessDto();
				pDto.setProcessName(rs.getString("process_name"));
				pDto.setMenu(rs.getString("menu"));
				pDto.setController(rs.getString("process_controller"));
				pList.add(pDto);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find record");
			sq.printStackTrace();
		} finally {
			pool.putConnection(conn);
		}

		return pList;
	}
	
	public static ArrayList<ProcessDto> findAllProcess() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<ProcessDto> pList = new ArrayList<ProcessDto>();
		try {
			String sql = "SELECT * from process ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProcessDto pDto=new ProcessDto();
				pDto.setProcessName(rs.getString("process_name"));
				pDto.setMenu(rs.getString("menu"));
				pDto.setController(rs.getString("process_controller"));
				pList.add(pDto);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find record");
			sq.printStackTrace();
		} finally {
			pool.putConnection(conn);
		}

		return pList;
	}
	
	public static ArrayList<Integer> findAllRightsId() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<Integer> rList = new ArrayList<Integer>();
		try {
			String sql = "SELECT process_id from rights";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				int rt = rs.getInt("process_id");
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

	public static ArrayList<String> findAllPages() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<String> rList = new ArrayList<String>();
		try {

			String sql = "SELECT page_name from process_pages where process_id in (SELECT process_id from process)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String rt = new String();
				rt = rs.getString("page_name");
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

	public static ArrayList<String> findPages(String userType) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<String> rList = new ArrayList<String>();
		try {
			String sql = new String();
			if (userType.equals("Accounts")) {
				sql = "SELECT page_name from process_pages where process_id in (SELECT process_id from rights where accounts= 'yes')";
			} else if (userType.equals("Data Entry")) {
				sql = "SELECT page_name from process_pages where process_id in (SELECT process_id from rights where data_entry= 'yes')";
			} else if (userType.equals("Reception")) {
				sql = "SELECT page_name from process_pages where process_id in (SELECT process_id from rights where reception= 'yes')";
			}
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String rt = new String();
				rt = rs.getString("page_name");
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
