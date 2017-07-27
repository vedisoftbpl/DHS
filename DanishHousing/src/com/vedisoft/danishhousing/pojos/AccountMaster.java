package com.vedisoft.danishhousing.pojos;

import java.util.Date;

public class AccountMaster {
	
	private int masterAccountId;	
	private int anxCd;
	private String acCode;
	private String acName;
	private String address;
	private String acClass;
	private Date opdte;
	private double opBal;
	private double mBal;
	private String pexp;
	private String ixpge;
	private String flag;
	private int projCd;
	public AccountMaster() {
		super();
	}
	
	public AccountMaster(int anxCd, String acCode, String acName, String address, String acClass, String ixpge,
			String flag, int projCd) {
		super();
		this.anxCd = anxCd;
		this.acCode = acCode;
		this.acName = acName;
		this.address = address;
		this.acClass = acClass;
		this.ixpge = ixpge;
		this.flag = flag;
		this.projCd = projCd;
		this.opdte = null;
		this.opBal = 0;
		this.mBal = 0;
	}

	public AccountMaster(int anxCd, String acCode, String acName, String address, String acClass, Date opdte,
			double opBal, double mBal, String pexp, String ixpge, String flag, int projCd) {
		super();
		this.anxCd = anxCd;
		this.acCode = acCode;
		this.acName = acName;
		this.address = address;
		this.acClass = acClass;
		this.opdte = opdte;
		this.opBal = opBal;
		this.mBal = mBal;
		this.pexp = pexp;
		this.ixpge = ixpge;
		this.flag = flag;
		this.projCd = projCd;
	}
	public AccountMaster(int masterAccountId, int anxCd, String acCode, String acName, String address, String acClass,
			Date opdte, double opBal, double mBal, String pexp, String ixpge, String flag, int projCd) {
		super();
		this.masterAccountId = masterAccountId;
		this.anxCd = anxCd;
		this.acCode = acCode;
		this.acName = acName;
		this.address = address;
		this.acClass = acClass;
		this.opdte = opdte;
		this.opBal = opBal;
		this.mBal = mBal;
		this.pexp = pexp;
		this.ixpge = ixpge;
		this.flag = flag;
		this.projCd = projCd;
	}
	public int getMasterAccountId() {
		return masterAccountId;
	}
	public void setMasterAccountId(int masterAccountId) {
		this.masterAccountId = masterAccountId;
	}
	public int getAnxCd() {
		return anxCd;
	}
	public void setAnxCd(int anxCd) {
		this.anxCd = anxCd;
	}
	public String getAcCode() {
		return acCode;
	}
	public void setAcCode(String acCode) {
		this.acCode = acCode;
	}
	public String getAcName() {
		return acName;
	}
	public void setAcName(String acName) {
		this.acName = acName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAcClass() {
		return acClass;
	}
	public void setAcClass(String acClass) {
		this.acClass = acClass;
	}
	public Date getOpdte() {
		return opdte;
	}
	public void setOpdte(Date opdte) {
		this.opdte = opdte;
	}
	public double getOpBal() {
		return opBal;
	}
	public void setOpBal(double opBal) {
		this.opBal = opBal;
	}
	public double getmBal() {
		return mBal;
	}
	public void setmBal(double mBal) {
		this.mBal = mBal;
	}
	public String getPexp() {
		return pexp;
	}
	public void setPexp(String pexp) {
		this.pexp = pexp;
	}
	public String getIxpge() {
		return ixpge;
	}
	public void setIxpge(String ixpge) {
		this.ixpge = ixpge;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public int getProjCd() {
		return projCd;
	}
	public void setProjCd(int projCd) {
		this.projCd = projCd;
	}
	@Override
	public String toString() {
		return "MasterAccount [masterAccountId=" + masterAccountId + ", anxCd=" + anxCd + ", acCode=" + acCode
				+ ", acName=" + acName + ", address=" + address + ", acClass=" + acClass + ", opdte=" + opdte
				+ ", opBal=" + opBal + ", mBal=" + mBal + ", pexp=" + pexp + ", ixpge=" + ixpge + ", flag=" + flag
				+ ", projCd=" + projCd + "]";
	}
	
	

}
