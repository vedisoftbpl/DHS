package com.vedisoft.danishhousing.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.vedisoft.danishhousing.config.ConnectionPool;
import com.vedisoft.danishhousing.pojos.Members;
import com.vedisoft.danishhousing.pojos.Supplier;

public class SupplierDao {
	public int create(Supplier supplier) {
		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "insert into supplier" + " (" + " suppl_name, suppl_add1, suppl_add2, suppl_add3, balance, bal_dt, "
					+ " pan_no, gst_no) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, supplier.getSupplName());
			ps.setString(2, supplier.getSupplAdd1());
			ps.setString(3, supplier.getSupplAdd2());
			ps.setString(4, supplier.getSupplAdd3());
			ps.setDouble(5, supplier.getBalance());
			java.sql.Date balDate = null;
			if(supplier.getBalDt() != null)
			balDate = new java.sql.Date(supplier.getBalDt().getTime());
			ps.setDate(6, balDate);
			ps.setString(7, supplier.getPanNo());
			ps.setString(8, supplier.getGstNo());
			int x = ps.executeUpdate();
			if (x == 0) {
				return 0;
			}
			ResultSet generatedKeys = ps.getGeneratedKeys();
			if (generatedKeys.next()) {
				id = generatedKeys.getInt(1);
			}
		} catch (SQLException sq) {
			sq.printStackTrace();
			return 0;
		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Record SuccessFully Added");
		return id;

	}
	public int createForImport(Supplier supplier) {
		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "insert into supplier" + " (" + " suppl_name, suppl_add1, suppl_add2, suppl_add3, balance, bal_dt, "
					+ " pan_no, gst_no, suppl_id) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, supplier.getSupplName());
			ps.setString(2, supplier.getSupplAdd1());
			ps.setString(3, supplier.getSupplAdd2());
			ps.setString(4, supplier.getSupplAdd3());
			ps.setDouble(5, supplier.getBalance());
			java.sql.Date balDate = null;
			if(supplier.getBalDt() != null)
			balDate = new java.sql.Date(supplier.getBalDt().getTime());
			ps.setDate(6, balDate);
			ps.setString(7, supplier.getPanNo());
			ps.setString(8, supplier.getGstNo());
			ps.setInt(9, supplier.getSupplId());
			int x = ps.executeUpdate();
			if (x == 0) {
				return 0;
			}
			ResultSet generatedKeys = ps.getGeneratedKeys();
			if (generatedKeys.next()) {
				id = generatedKeys.getInt(1);
			}
		} catch (SQLException sq) {
			sq.printStackTrace();
			return 0;
		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Record SuccessFully Added");
		return id;

	}
	public int edit(Supplier supplier) {
		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "update supplier set suppl_name = ?, suppl_add1 = ?, suppl_add2 = ?, suppl_add3 = ?, balance = ?, bal_dt = ?, "
					+ " pan_no = ?, gst_no = ? where  suppl_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, supplier.getSupplName());
			ps.setString(2, supplier.getSupplAdd1());
			ps.setString(3, supplier.getSupplAdd2());
			ps.setString(4, supplier.getSupplAdd3());
			ps.setDouble(5, supplier.getBalance());
			java.sql.Date balDate = null;
			if(supplier.getBalDt() != null)
			balDate = new java.sql.Date(supplier.getBalDt().getTime());
			ps.setDate(6, balDate);
			ps.setString(7, supplier.getPanNo());
			ps.setString(8, supplier.getGstNo());
			ps.setInt(9, supplier.getSupplId());
			int x = ps.executeUpdate();
			if (x == 0) {
				return 0;
			}
			ResultSet generatedKeys = ps.getGeneratedKeys();
			if (generatedKeys.next()) {
				id = generatedKeys.getInt(1);
			}
		} catch (SQLException sq) {
			System.out.println("Fail to Updated Record  Update");
			sq.printStackTrace();
			return 0;
		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Record SuccessFully Updated");
		return id;

	}
	public boolean remove(int supplId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "delete from supplier where  suppl_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, supplId);
			int x = ps.executeUpdate();
			if (x == 0) {
				return false;
			}
			
		} catch (SQLException sq) {
			System.out.println("Fail to delete Record  Update");
			sq.printStackTrace();
			return false;
		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Record SuccessFully Delete");
		return true;

	}
	public Supplier find(int supplId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		Supplier sup = new Supplier();
		try {
			String sql = "select * from supplier where  suppl_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, supplId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				sup.setSupplId(supplId);
				sup.setSupplName(rs.getString("suppl_name"));
				sup.setSupplAdd1(rs.getString("suppl_add1"));
				sup.setSupplAdd2(rs.getString("suppl_add2"));
				sup.setSupplAdd3(rs.getString("suppl_add3"));
				sup.setBalance(rs.getDouble("balance"));
				java.sql.Date balDate = null;
				if(rs.getDate("bal_dt") != null)
				balDate = rs.getDate("bal_dt");
				sup.setBalDt(new java.util.Date(balDate.getTime()));
				sup.setPanNo(rs.getString("pan_no"));
				sup.setGstNo(rs.getString("gst_no"));
			}
		} catch (SQLException sq) {
			System.out.println("Fail to find Record  ");
			sq.printStackTrace();
			
		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Record SuccessFully Delete");
		return sup;

	}
	public ArrayList<Supplier> findAll() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<Supplier> supList = new ArrayList<Supplier>();
		try {
			String sql = "select * from supplier";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Supplier sup = new Supplier();
				sup.setSupplId(rs.getInt("suppl_id"));
				sup.setSupplName(rs.getString("suppl_name"));
				sup.setSupplAdd1(rs.getString("suppl_add1"));
				sup.setSupplAdd2(rs.getString("suppl_add2"));
				sup.setSupplAdd3(rs.getString("suppl_add3"));
				sup.setBalance(rs.getDouble("balance"));
				java.sql.Date balDate = null;
				if (rs.getDate("bal_dt") != null)
					balDate = rs.getDate("bal_dt");
				sup.setBalDt(new java.util.Date(balDate.getTime()));
				sup.setPanNo(rs.getString("pan_no"));
				sup.setGstNo(rs.getString("gst_no"));
				supList.add(sup);
			}
		} catch (SQLException sq) {
			System.out.println("Fail to find Record  ");
			sq.printStackTrace();

		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Record SuccessFully Delete");
		return supList;
	}
	
	public ArrayList<Supplier> findAll(int start, int num) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<Supplier> supList = new ArrayList<Supplier>();
		try {
			String sql = "select * from supplier limit ? , ?";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, start);
			ps.setInt(2, num);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Supplier sup = new Supplier();
				sup.setSupplId(rs.getInt("suppl_id"));
				sup.setSupplName(rs.getString("suppl_name"));
				sup.setSupplAdd1(rs.getString("suppl_add1"));
				sup.setSupplAdd2(rs.getString("suppl_add2"));
				sup.setSupplAdd3(rs.getString("suppl_add3"));
				sup.setBalance(rs.getDouble("balance"));
				java.sql.Date balDate = null;
				if (rs.getDate("bal_dt") != null)
					balDate = rs.getDate("bal_dt");
				sup.setBalDt(new java.util.Date(balDate.getTime()));
				sup.setPanNo(rs.getString("pan_no"));
				sup.setGstNo(rs.getString("gst_no"));
				supList.add(sup);
			}
		} catch (SQLException sq) {
			System.out.println("Fail to find Record  ");
			sq.printStackTrace();

		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Record SuccessFully Delete");
		return supList;
	}
	
	public static int totalRows() {
		int id = -1;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "select count(*) as count from supplier";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				id = rs.getInt("count");
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find data ." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return id;

	}
	
	public static ArrayList<Supplier> findAll(int start, int num ,String s,String COLUMN_NAME, String DIRECTION ) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<Supplier> listSupplier = new ArrayList<Supplier>();
		String sqli = new String();
		String sql = new String();
		String globalSearch = " where suppl_id like '%" + s + "%'"
			    + "or suppl_name like '%" + s + "%'"
			    + "or balance like '%" + s+ "%'"
			    + "or bal_dt like '%" + s+ "%'"
			    + "or pan_no like  '%" + s+ "%'"
			    + "or gst_no like '%" + s+ "%'"
				+ "or suppl_add1 like '%" + s+ "%'"
				+ "or suppl_add2 like '%" + s+ "%'"
				+ "or suppl_add3 like '%" + s+ "%'";
		
		 sqli += " order by " + COLUMN_NAME + " " + DIRECTION;
		
		try {
			if(s != null){
				System.out.println("String : " + s);
				 sql = "select * from supplier " + globalSearch + sqli + " limit ? , ? " ;
			}
			else{
				 sql = "select * from supplier " + sqli + " limit ? , ? " ;
			}
			System.out.println(sql);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, num);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Supplier sup = new Supplier();
				sup.setSupplId(rs.getInt("suppl_id"));
				sup.setSupplName(rs.getString("suppl_name"));
				sup.setSupplAdd1(rs.getString("suppl_add1"));
				sup.setSupplAdd2(rs.getString("suppl_add2"));
				sup.setSupplAdd3(rs.getString("suppl_add3"));
				sup.setBalance(rs.getDouble("balance"));
				java.sql.Date balDate = null;
				if (rs.getDate("bal_dt") != null)
					balDate = rs.getDate("bal_dt");
				sup.setBalDt(new java.util.Date(balDate.getTime()));
				sup.setPanNo(rs.getString("pan_no"));
				sup.setGstNo(rs.getString("gst_no"));
				listSupplier.add(sup);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to create a new row.");
		} finally {
			pool.putConnection(conn);
		}
		return listSupplier;
	}

}
