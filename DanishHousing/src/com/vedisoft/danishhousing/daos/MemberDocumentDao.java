package com.vedisoft.danishhousing.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import com.vedisoft.danishhousing.config.ConnectionPool;
import com.vedisoft.danishhousing.pojos.MemberDocument;

public class MemberDocumentDao {

	public int create(MemberDocument mDoc) {
		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "insert into members_documents (members_documents_title, "
					+ "members_documents_details, members_documents_file," + " lastupdate, userid,membno) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, mDoc.getMemberDocumentTitle());
			ps.setString(2, mDoc.getMemberDocumentDetails());

			ps.setString(3, mDoc.getMemberDocumentFile());
			java.sql.Date lastUpdate = new java.sql.Date(mDoc.getLastUpdate().getTime());
			ps.setDate(4, lastUpdate);
			ps.setInt(5, mDoc.getUserId());
			ps.setInt(6, mDoc.getMembno());

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

	public boolean edit(MemberDocument mDoc) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "update members_documents set members_documents_title =?, "
					+ "members_documents_details=?, members_documents_file=?,"
					+ " lastupdate=?, userid=? membno=? where members_documents_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, mDoc.getMemberDocumentTitle());

			ps.setString(2, mDoc.getMemberDocumentDetails());
			ps.setString(3, mDoc.getMemberDocumentFile());

			java.sql.Date lastUpdate = new java.sql.Date(mDoc.getLastUpdate().getTime());
			ps.setDate(4, lastUpdate);

			ps.setInt(5, mDoc.getUserId());
			ps.setInt(6, mDoc.getMembno());
			ps.setInt(7, mDoc.getMemberDocumentId());

			int x = ps.executeUpdate();
			if (x == 0)
				return false;
		} catch (SQLException sq) {
			sq.printStackTrace();
			return false;
		} finally {
			pool.putConnection(conn);
		}
		System.out.println("Record SuccessFully Updated");
		return true;
	}

	public boolean remove(int mDocId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "delete from members_documents where members_documents_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, mDocId);
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

	public MemberDocument find(int mDocId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		MemberDocument cd = new MemberDocument();
		try {
			String sql = "select * from members_documents where members_documents_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, mDocId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				cd.setMemberDocumentId(mDocId);
				cd.setMemberDocumentDetails(rs.getString("members_documents_details"));
				cd.setMemberDocumentFile(rs.getString("members_documents_file"));

				cd.setMemberDocumentTitle(rs.getString("members_documents_title"));

				java.sql.Date lastUpdate = rs.getDate("lastupdate");
				cd.setLastUpdate(new java.util.Date(lastUpdate.getTime()));

				cd.setUserId(rs.getInt("userid"));
				cd.setMembno(rs.getInt("membno"));

			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a new row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return cd;
	}

	public ArrayList<MemberDocument> findAll() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<MemberDocument> list = new ArrayList<MemberDocument>();
		try {
			String sql = "select * from members_documents";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MemberDocument cd = new MemberDocument();
				cd.setMemberDocumentId(rs.getInt("members_documents_id"));
				cd.setMemberDocumentDetails(rs.getString("members_documents_details"));
				cd.setMemberDocumentFile(rs.getString("members_documents_file"));

				cd.setMemberDocumentTitle(rs.getString("members_documents_title"));

				java.sql.Date lastUpdate = rs.getDate("lastupdate");
				cd.setLastUpdate(new java.util.Date(lastUpdate.getTime()));

				cd.setUserId(rs.getInt("userid"));
				cd.setMembno(rs.getInt("membno"));
				list.add(cd);
			}
		} catch (SQLException sq) {
			sq.printStackTrace();
			System.out.println("Unable to find any  row.");
		} finally {
			pool.putConnection(conn);
		}
		return list;
	}

	public ArrayList<MemberDocument> findAll(int start, int num) {

		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<MemberDocument> list = new ArrayList<MemberDocument>();
		try {
			String sql = "select * from members_documents limit ? , ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, start - 1);
			ps.setInt(2, num);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MemberDocument cd = new MemberDocument();
				cd.setMemberDocumentId(rs.getInt("members_documents_id"));
				cd.setMemberDocumentDetails(rs.getString("members_documents_details"));
				cd.setMemberDocumentFile(rs.getString("members_documents_file"));

				cd.setMemberDocumentTitle(rs.getString("members_documents_title"));

				java.sql.Date lastUpdate = rs.getDate("lastupdate");
				cd.setLastUpdate(new java.util.Date(lastUpdate.getTime()));

				cd.setUserId(rs.getInt("userid"));
				cd.setMembno(rs.getInt("membno"));
				list.add(cd);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find selected rows.");
		} finally {
			pool.putConnection(conn);
		}
		return list;

	}

	public ArrayList<MemberDocument> findDocOfMember(int membno) {

		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<MemberDocument> list = new ArrayList<MemberDocument>();
		try {
			String sql = "select * from members_documents where membno = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, membno);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MemberDocument cd = new MemberDocument();
				cd.setMemberDocumentId(rs.getInt("members_documents_id"));
				cd.setMemberDocumentDetails(rs.getString("members_documents_details"));
				cd.setMemberDocumentFile(rs.getString("members_documents_file"));

				cd.setMemberDocumentTitle(rs.getString("members_documents_title"));

				java.sql.Date lastUpdate = rs.getDate("lastupdate");
				cd.setLastUpdate(new java.util.Date(lastUpdate.getTime()));
				cd.setMembno(rs.getInt("membno"));
				cd.setUserId(rs.getInt("userid"));

				list.add(cd);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find selected rows.");
		} finally {
			pool.putConnection(conn);
		}
		return list;

	}

	public String findFileFromTitle(int mDocId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		String memDoc = new String();
		try {
			String sql = "select members_documents_file from members_documents where members_documents_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, mDocId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				memDoc = rs.getString("members_documents_file");
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a new row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return memDoc;
	}

	public static void main(String[] args) {
		MemberDocumentDao dao = new MemberDocumentDao();
		// MemberDocument cd = new MemberDocument();
		// cd.setMemberDocumentDetails("Document Details");
		// cd.setMemberDocumentFile("Documents File");
		// cd.setMemberDocumentTitle("Document Title");
		// cd.setLastUpdate(new Date());
		// cd.setUserId(6);
		// dao.create(cd);

		// MemberDocument cd = new MemberDocument();
		// cd.setMemberDocumentId(2);
		// cd.setMemberDocumentDetails("Document Details 2");
		// cd.setMemberDocumentFile("Documents File 2");
		// cd.setMemberDocumentTitle("Document Title 2");
		// cd.setLastUpdate(new Date());
		// cd.setUserId(3);
		// dao.edit(cd);
		//
		// dao.remove(4);

		// MemberDocument cd = dao.find(2);
		// System.out.println(cd);
		//
		// ArrayList<MemberDocument> list = dao.findAll();
		// for(MemberDocument cd: list)
		// System.out.println(cd);
		//
		//
		// ArrayList<MemberDocument> list = dao.findAll(1,3);
		// for(MemberDocument cd: list)
		// System.out.println(cd);
	}

}
