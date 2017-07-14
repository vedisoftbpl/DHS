package com.vedisoft.danishhousing.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import com.vedisoft.danishhousing.config.ConnectionPool;
import com.vedisoft.danishhousing.pojos.Members;;

public class MembersDao {
	public int create(Members member) {
		int id = 0;
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "insert into members" + " ("
					+ "prefix, membnme,f_h_rel,f_h_name,dob,email,moccu,mobile,aadhar,photo,"
					+ "mad1,mad2,mad3,adressproof,nome_name,nome_rela,membfee,entrfee,live_dead, userid,lastupdate) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, member.getPrefix());
			ps.setString(2, member.getMemName());
			ps.setString(3, member.getfHRelation());
			ps.setString(4, member.getfHRelName());
			java.sql.Date dob = null;
			if (member.getDob() != null)
				dob = new java.sql.Date(member.getDob().getTime());
			ps.setDate(5, dob);
			ps.setString(6, member.getEmail());
			ps.setString(7, member.getMemOccupation());
			ps.setString(8, member.getMobile());
			ps.setString(9, member.getAadhar());
			ps.setString(10, member.getPhoto());
			ps.setString(11, member.getAddress1());
			ps.setString(12, member.getAddress2());
			ps.setString(13, member.getAddress3());
			ps.setString(14, member.getAddProof());
			ps.setString(15, member.getNomineeName());
			ps.setString(16, member.getNomineeRelation());
			ps.setInt(17, member.getMemFee());
			ps.setInt(18, member.getMemEntryFee());
			ps.setString(19, String.valueOf(member.getLiveDead()));
			ps.setInt(20, member.getUserId());
			java.sql.Date lastUpdate = null;
			if (member.getLastUpdate() != null)
				lastUpdate = new java.sql.Date(member.getLastUpdate().getTime());
			ps.setDate(21, lastUpdate);
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

	public boolean edit(Members member) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "update members set prefix = ?, membnme= ?,f_h_rel= ?,f_h_name= ?,dob= ?,email= ?,moccu= ?,mobile= ?,aadhar= ?,photo= ?,"
					+ "mad1= ?,mad2= ?,mad3= ?,adressproof= ?,nome_name= ?,nome_rela= ?,membfee= ?,entrfee= ?,userid= ?,lastupdate= ?,membno= ?,projcd= ?"
					+ ",plsize= ?,nplsize= ?,reg_cor= ?,plno= ?,tplno= ?,mage= ?,recedte= ?,fullpay= ?,inst1= ?,inst2= ?,inst3= ?,transf= ?,opbal= ?,"
					+ "water_con= ?,sec_dep= ?,wt_cn_dt= ?,opdte= ?,regi= ?,regdte= ?,regno= ?,r_c= ?,nocdte= ?,live_dead= ?,refdte= ?,diversion= ?,finalamt= ?"
					+ ",maint= ?,water= ?,wsupdte= ?,establ= ?,wc_lr_dt= ?,wat_chg= ?,extamt= ?,cost= ? where member_id = ? ";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, member.getPrefix());
			ps.setString(2, member.getMemName());
			ps.setString(3, member.getfHRelation());
			ps.setString(4, member.getfHRelName());
			java.sql.Date dob = null;
			if (member.getDob() != null)
				dob = new java.sql.Date(member.getDob().getTime());
			ps.setDate(5, dob);
			ps.setString(6, member.getEmail());
			ps.setString(7, member.getMemOccupation());
			ps.setString(8, member.getMobile());
			ps.setString(9, member.getAadhar());
			ps.setString(10, member.getPhoto());
			ps.setString(11, member.getAddress1());
			ps.setString(12, member.getAddress2());
			ps.setString(13, member.getAddress3());
			ps.setString(14, member.getAddProof());
			ps.setString(15, member.getNomineeName());
			ps.setString(16, member.getNomineeRelation());
			ps.setInt(17, member.getMemFee());
			ps.setInt(18, member.getMemEntryFee());
			ps.setInt(19, member.getUserId());
			java.sql.Date lastUpdate = null;
			if (member.getLastUpdate() != null)
				lastUpdate = new java.sql.Date(member.getLastUpdate().getTime());
			ps.setDate(20, lastUpdate);
			ps.setInt(21, member.getMemberNo());
			ps.setInt(22, member.getProjectCd());
			ps.setString(23, member.getPlotSize());
			ps.setDouble(24, member.getNetPlotSize());
			ps.setString(25, member.getRegCor());
			ps.setString(26, member.getPlotNo());
			ps.setString(27, member.getTempPlotNo());
			ps.setInt(28, member.getAge());
			java.sql.Date recDte = null;
			if (member.getReceiptdt() != null)
				recDte = new java.sql.Date(member.getReceiptdt().getTime());
			ps.setDate(29, recDte);
			ps.setString(30, member.getFullPay());
			ps.setInt(31, member.getInst1());
			ps.setInt(32, member.getInst2());
			ps.setInt(33, member.getInst3());
			ps.setString(34, member.getTransf());
			ps.setDouble(35, member.getOpBal());
			ps.setString(36, member.getWaterConn());
			ps.setString(37, member.getSecDep());
			java.sql.Date wtCnDte = null;
			if (member.getWaterConnDate() != null)
				wtCnDte = new java.sql.Date(member.getWaterConnDate().getTime());
			ps.setDate(38, wtCnDte);
			java.sql.Date opDte = null;
			if (member.getOpDt() != null)
				opDte = new java.sql.Date(member.getOpDt().getTime());
			ps.setDate(39, opDte);
			ps.setString(40, member.getRegi());
			java.sql.Date regDt = null;
			if (member.getRegDt() != null)
				regDt = new java.sql.Date(member.getRegDt().getTime());
			ps.setDate(41, regDt);
			ps.setString(42, member.getRegNo());
			ps.setString(43, "" + member.getrC());
			java.sql.Date nocDte = null;
			if (member.getNocDt() != null)
				nocDte = new java.sql.Date(member.getNocDt().getTime());
			ps.setDate(44, nocDte);
			ps.setString(45, "" + member.getLiveDead());
			java.sql.Date refDte = null;
			if (member.getRefDt() != null)
				refDte = new java.sql.Date(member.getRefDt().getTime());
			ps.setDate(46, refDte);
			ps.setDouble(47, member.getDiversion());
			ps.setDouble(48, member.getFinalAmount());
			ps.setString(49, member.getMaint());
			ps.setString(50, member.getWater());
			java.sql.Date wSupDate = null;
			if (member.getWatSupplyDt() != null)
				wSupDate = new java.sql.Date(member.getWatSupplyDt().getTime());
			ps.setDate(51, wSupDate);
			ps.setString(52, member.getEstabl());
			java.sql.Date wcLrDt = null;
			if (member.getWcLrDt() != null)
				wcLrDt = new java.sql.Date(member.getWcLrDt().getTime());
			ps.setDate(53, wcLrDt);
			ps.setString(54, member.getWatChg());
			ps.setDouble(55, member.getExtraAmount());
			ps.setDouble(56, member.getCost());
			ps.setInt(57 , member.getMemberId());
			
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

	public boolean remove(int memberId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		try {
			String sql = "delete from members where member_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, memberId);
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

	public Members find(int memberId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		Members member = new Members();
		try {
			String sql = "select * from members where member_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, memberId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				member.setMemberId(memberId);
				member.setPrefix(rs.getString("prefix"));
				member.setMemName(rs.getString("membnme"));
				member.setfHRelation(rs.getString("f_h_rel"));
				member.setfHRelName(rs.getString("f_h_name"));
				java.sql.Date dob = rs.getDate("dob");
				if (dob != null)
					member.setDob(new java.util.Date((dob).getTime()));
				else
					member.setDob(dob);
				member.setEmail(rs.getString("email"));
				member.setMemOccupation(rs.getString("moccu"));
				member.setMobile(rs.getString("mobile"));
				member.setAadhar(rs.getString("aadhar"));
				member.setPhoto(rs.getString("photo"));
				member.setAddress1(rs.getString("mad1"));
				member.setAddress2(rs.getString("mad2"));
				member.setAddress3(rs.getString("mad3"));
				member.setAddProof(rs.getString("adressproof"));
				member.setNomineeName(rs.getString("nome_name"));
				member.setNomineeRelation(rs.getString("nome_rela"));
				member.setMemFee(rs.getInt("membfee"));
				member.setMemEntryFee(rs.getInt("entrfee"));
				member.setUserId(rs.getInt("userid"));
				java.sql.Date lupdt = rs.getDate("lastupdate");
				if (lupdt != null)
					member.setLastUpdate(new java.util.Date((lupdt).getTime()));
				else
					member.setLastUpdate(lupdt);
				member.setMemberNo(rs.getInt("membno"));
				member.setProjectCd(rs.getInt("projcd"));
				member.setPlotSize(rs.getString("plsize"));
				member.setNetPlotSize(rs.getFloat("nplsize")); // npl : float
																// not double
				member.setRegCor(rs.getString("reg_cor"));
				member.setPlotNo(rs.getString("plno"));
				member.setTempPlotNo(rs.getString("tplno"));
				member.setAge(rs.getInt("mage"));
				java.sql.Date recDte = rs.getDate("recedte");
				if (recDte != null)
					member.setReceiptdt(new java.util.Date((recDte).getTime()));
				else
					member.setReceiptdt(recDte);
				member.setFullPay(rs.getString("fullpay"));
				member.setInst1(rs.getInt("inst1"));
				member.setInst2(rs.getInt("inst2"));
				member.setInst3(rs.getInt("inst3"));
				member.setTransf(rs.getString("transf"));
				member.setOpBal(rs.getDouble("opbal"));
				member.setWaterConn(rs.getString("water_con"));
				member.setSecDep(rs.getString("sec_dep"));
				java.sql.Date wtCnDte = rs.getDate("wt_cn_dt");
				if (wtCnDte != null)
					member.setWaterConnDate(new java.util.Date((wtCnDte).getTime()));
				else
					member.setWaterConnDate(wtCnDte);
				java.sql.Date opDte = rs.getDate("opdte");
				if (opDte != null)
					member.setOpDt(new java.util.Date((opDte).getTime()));
				else
					member.setOpDt(opDte);
				member.setRegi(rs.getString("regi"));
				java.sql.Date regDt = rs.getDate("regdte");
				if (regDt != null)
					member.setRegDt(new java.util.Date((regDt).getTime()));
				else
					member.setRegDt(regDt);
				member.setRegNo(rs.getString("regno"));
				String r_c = rs.getString("r_c");
				if (r_c != null)
					member.setrC(rs.getString("r_c").charAt(0));
				java.sql.Date nocDte = rs.getDate("nocdte");
				if (nocDte != null)
					member.setNocDt(new java.util.Date((nocDte).getTime()));
				else
					member.setNocDt(nocDte);
				String live_dead = rs.getString("live_dead");
				System.out.println(live_dead + "111");
				if (live_dead != null)
					member.setLiveDead(rs.getString("live_dead").charAt(0));
				java.sql.Date refDte = rs.getDate("refdte");
				if (refDte != null)
					member.setRefDt(new java.util.Date((refDte).getTime()));
				else
					member.setRefDt(refDte);
				member.setDiversion(rs.getDouble("diversion"));
				member.setFinalAmount(rs.getDouble("finalamt"));
				member.setMaint(rs.getString("maint"));
				member.setWater(rs.getString("water"));
				java.sql.Date wSupDate = rs.getDate("wsupdte");
				if (wSupDate != null)
					member.setWatSupplyDt(new java.util.Date((wSupDate).getTime()));
				else
					member.setWatSupplyDt(wSupDate);
				member.setEstabl(rs.getString("establ"));
				java.sql.Date wcLrDt = rs.getDate("wc_lr_dt");
				if (wcLrDt != null)
					member.setWcLrDt(new java.util.Date((wcLrDt).getTime()));
				else
					member.setWcLrDt(wcLrDt);
				member.setWatChg(rs.getString("wat_chg"));
				member.setExtraAmount(rs.getDouble("extamt"));
				member.setCost(rs.getDouble("cost"));
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find a row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return member;
	}

	public ArrayList<Members> findAll() {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<Members> listMembers = new ArrayList<Members>();
		try {
			String sql = "select * from members ";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Members member = new Members();
				member.setMemberId(rs.getInt("member_id"));
				member.setPrefix(rs.getString("prefix"));
				member.setMemName(rs.getString("membnme"));
				member.setfHRelation(rs.getString("f_h_rel"));
				member.setfHRelName(rs.getString("f_h_name"));
				java.sql.Date dob = rs.getDate("dob");
				if (dob != null)
					member.setDob(new java.util.Date((dob).getTime()));
				else
					member.setDob(dob);
				member.setEmail(rs.getString("email"));
				member.setMemOccupation(rs.getString("moccu"));
				member.setMobile(rs.getString("mobile"));
				member.setAadhar(rs.getString("aadhar"));
				member.setPhoto(rs.getString("photo"));
				member.setAddress1(rs.getString("mad1"));
				member.setAddress2(rs.getString("mad2"));
				member.setAddress3(rs.getString("mad3"));
				member.setAddProof(rs.getString("adressproof"));
				member.setNomineeName(rs.getString("nome_name"));
				member.setNomineeRelation(rs.getString("nome_rela"));
				member.setMemFee(rs.getInt("membfee"));
				member.setMemEntryFee(rs.getInt("entrfee"));
				member.setUserId(rs.getInt("userid"));
				java.sql.Date lupdt = rs.getDate("lastupdate");
				if (lupdt != null)
					member.setLastUpdate(new java.util.Date((lupdt).getTime()));
				else
					member.setLastUpdate(lupdt);
				member.setMemberNo(rs.getInt("membno"));
				member.setProjectCd(rs.getInt("projcd"));
				member.setPlotSize(rs.getString("plsize"));
				member.setNetPlotSize(rs.getFloat("nplsize")); // npl : float
																// not double
				member.setRegCor(rs.getString("reg_cor"));
				member.setPlotNo(rs.getString("plno"));
				member.setTempPlotNo(rs.getString("tplno"));
				member.setAge(rs.getInt("mage"));
				java.sql.Date recDte = rs.getDate("recedte");
				if (recDte != null)
					member.setReceiptdt(new java.util.Date((recDte).getTime()));
				else
					member.setReceiptdt(recDte);
				member.setFullPay(rs.getString("fullpay"));
				member.setInst1(rs.getInt("inst1"));
				member.setInst2(rs.getInt("inst2"));
				member.setInst3(rs.getInt("inst3"));
				member.setTransf(rs.getString("transf"));
				member.setOpBal(rs.getDouble("opbal"));
				member.setWaterConn(rs.getString("water_con"));
				member.setSecDep(rs.getString("sec_dep"));
				java.sql.Date wtCnDte = rs.getDate("wt_cn_dt");
				if (wtCnDte != null)
					member.setWaterConnDate(new java.util.Date((wtCnDte).getTime()));
				else
					member.setWaterConnDate(wtCnDte);
				java.sql.Date opDte = rs.getDate("opdte");
				if (opDte != null)
					member.setOpDt(new java.util.Date((opDte).getTime()));
				else
					member.setOpDt(opDte);
				member.setRegi(rs.getString("regi"));
				java.sql.Date regDt = rs.getDate("regdte");
				if (regDt != null)
					member.setRegDt(new java.util.Date((regDt).getTime()));
				else
					member.setRegDt(regDt);
				member.setRegNo(rs.getString("regno"));
				String r_c = rs.getString("r_c");
				if (r_c != null)
					member.setrC(rs.getString("r_c").charAt(0));
				java.sql.Date nocDte = rs.getDate("nocdte");
				if (nocDte != null)
					member.setNocDt(new java.util.Date((nocDte).getTime()));
				else
					member.setNocDt(nocDte);
				String live_dead = rs.getString("live_dead");
				System.out.println(live_dead + "111");
				if (live_dead != null)
					member.setLiveDead(rs.getString("live_dead").charAt(0));
				java.sql.Date refDte = rs.getDate("refdte");
				if (refDte != null)
					member.setRefDt(new java.util.Date((refDte).getTime()));
				else
					member.setRefDt(refDte);
				member.setDiversion(rs.getDouble("diversion"));
				member.setFinalAmount(rs.getDouble("finalamt"));
				member.setMaint(rs.getString("maint"));
				member.setWater(rs.getString("water"));
				java.sql.Date wSupDate = rs.getDate("wsupdte");
				if (wSupDate != null)
					member.setWatSupplyDt(new java.util.Date((wSupDate).getTime()));
				else
					member.setWatSupplyDt(wSupDate);
				member.setEstabl(rs.getString("establ"));
				java.sql.Date wcLrDt = rs.getDate("wc_lr_dt");
				if (wcLrDt != null)
					member.setWcLrDt(new java.util.Date((wcLrDt).getTime()));
				else
					member.setWcLrDt(wcLrDt);
				member.setWatChg(rs.getString("wat_chg"));
				member.setExtraAmount(rs.getDouble("extamt"));
				member.setCost(rs.getDouble("cost"));
				listMembers.add(member);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find all row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return listMembers;
	}

	public ArrayList<Members> findAll(int start, int num) {
		ConnectionPool pool = ConnectionPool.getInstance();
		pool.initialize();
		Connection conn = pool.getConnection();
		ArrayList<Members> listMembers = new ArrayList<Members>();
		try {
			String sql = "select * from members limit ? , ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, start - 1);
			ps.setInt(2, num);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Members member = new Members();
				member.setMemberId(rs.getInt("member_id"));
				member.setPrefix(rs.getString("prefix"));
				member.setMemName(rs.getString("membnme"));
				member.setfHRelation(rs.getString("f_h_rel"));
				member.setfHRelName(rs.getString("f_h_name"));
				java.sql.Date dob = rs.getDate("dob");
				if (dob != null)
					member.setDob(new java.util.Date((dob).getTime()));
				else
					member.setDob(dob);
				member.setEmail(rs.getString("email"));
				member.setMemOccupation(rs.getString("moccu"));
				member.setMobile(rs.getString("mobile"));
				member.setAadhar(rs.getString("aadhar"));
				member.setPhoto(rs.getString("photo"));
				member.setAddress1(rs.getString("mad1"));
				member.setAddress2(rs.getString("mad2"));
				member.setAddress3(rs.getString("mad3"));
				member.setAddProof(rs.getString("adressproof"));
				member.setNomineeName(rs.getString("nome_name"));
				member.setNomineeRelation(rs.getString("nome_rela"));
				member.setMemFee(rs.getInt("membfee"));
				member.setMemEntryFee(rs.getInt("entrfee"));
				member.setUserId(rs.getInt("userid"));
				java.sql.Date lupdt = rs.getDate("lastupdate");
				if (lupdt != null)
					member.setLastUpdate(new java.util.Date((lupdt).getTime()));
				else
					member.setLastUpdate(lupdt);
				member.setMemberNo(rs.getInt("membno"));
				member.setProjectCd(rs.getInt("projcd"));
				member.setPlotSize(rs.getString("plsize"));
				member.setNetPlotSize(rs.getFloat("nplsize")); // npl : float
																// not double
				member.setRegCor(rs.getString("reg_cor"));
				member.setPlotNo(rs.getString("plno"));
				member.setTempPlotNo(rs.getString("tplno"));
				member.setAge(rs.getInt("mage"));
				java.sql.Date recDte = rs.getDate("recedte");
				if (recDte != null)
					member.setReceiptdt(new java.util.Date((recDte).getTime()));
				else
					member.setReceiptdt(recDte);
				member.setFullPay(rs.getString("fullpay"));
				member.setInst1(rs.getInt("inst1"));
				member.setInst2(rs.getInt("inst2"));
				member.setInst3(rs.getInt("inst3"));
				member.setTransf(rs.getString("transf"));
				member.setOpBal(rs.getDouble("opbal"));
				member.setWaterConn(rs.getString("water_con"));
				member.setSecDep(rs.getString("sec_dep"));
				java.sql.Date wtCnDte = rs.getDate("wt_cn_dt");
				if (wtCnDte != null)
					member.setWaterConnDate(new java.util.Date((wtCnDte).getTime()));
				else
					member.setWaterConnDate(wtCnDte);
				java.sql.Date opDte = rs.getDate("opdte");
				if (opDte != null)
					member.setOpDt(new java.util.Date((opDte).getTime()));
				else
					member.setOpDt(opDte);
				member.setRegi(rs.getString("regi"));
				java.sql.Date regDt = rs.getDate("regdte");
				if (regDt != null)
					member.setRegDt(new java.util.Date((regDt).getTime()));
				else
					member.setRegDt(regDt);
				member.setRegNo(rs.getString("regno"));
				String r_c = rs.getString("r_c");
				if (r_c != null)
					member.setrC(rs.getString("r_c").charAt(0));
				java.sql.Date nocDte = rs.getDate("nocdte");
				if (nocDte != null)
					member.setNocDt(new java.util.Date((nocDte).getTime()));
				else
					member.setNocDt(nocDte);
				String live_dead = rs.getString("live_dead");
				System.out.println(live_dead + "111");
				if (live_dead != null)
					member.setLiveDead(rs.getString("live_dead").charAt(0));
				java.sql.Date refDte = rs.getDate("refdte");
				if (refDte != null)
					member.setRefDt(new java.util.Date((refDte).getTime()));
				else
					member.setRefDt(refDte);
				member.setDiversion(rs.getDouble("diversion"));
				member.setFinalAmount(rs.getDouble("finalamt"));
				member.setMaint(rs.getString("maint"));
				member.setWater(rs.getString("water"));
				java.sql.Date wSupDate = rs.getDate("wsupdte");
				if (wSupDate != null)
					member.setWatSupplyDt(new java.util.Date((wSupDate).getTime()));
				else
					member.setWatSupplyDt(wSupDate);
				member.setEstabl(rs.getString("establ"));
				java.sql.Date wcLrDt = rs.getDate("wc_lr_dt");
				if (wcLrDt != null)
					member.setWcLrDt(new java.util.Date((wcLrDt).getTime()));
				else
					member.setWcLrDt(wcLrDt);
				member.setWatChg(rs.getString("wat_chg"));
				member.setExtraAmount(rs.getDouble("extamt"));
				member.setCost(rs.getDouble("cost"));
				listMembers.add(member);
			}
		} catch (SQLException sq) {
			System.out.println("Unable to find all row." + sq);
		} finally {
			pool.putConnection(conn);
		}
		return listMembers;

	}

	public static void main(String a[]) {
		MembersDao dao = new MembersDao();
		Members m = dao.find(1);
		System.out.println(m);
	}

}
