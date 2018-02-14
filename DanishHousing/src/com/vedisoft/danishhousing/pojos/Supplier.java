package com.vedisoft.danishhousing.pojos;

import java.util.Date;

public class Supplier {
	private int supplId;
	private String supplName;
	private String supplAdd1;
	private String supplAdd2;
	private String supplAdd3;
	private double balance;
	private Date balDt;
	private String panNo;
	private String gstNo;
	
	
	public Supplier() {
		super();
	}

	public Supplier(String supplName, String supplAdd1, String supplAdd2, String supplAdd3, double balance, Date balDt,
			String panNo, String gstNo) {
		super();
		this.supplName = supplName;
		this.supplAdd1 = supplAdd1;
		this.supplAdd2 = supplAdd2;
		this.supplAdd3 = supplAdd3;
		this.balance = balance;
		this.balDt = balDt;
		this.panNo = panNo;
		this.gstNo = gstNo;
	}

	public Supplier(int supplId, String supplName, String supplAdd1, String supplAdd2, String supplAdd3, double balance,
			Date balDt, String panNo, String gstNo) {
		super();
		this.supplId = supplId;
		this.supplName = supplName;
		this.supplAdd1 = supplAdd1;
		this.supplAdd2 = supplAdd2;
		this.supplAdd3 = supplAdd3;
		this.balance = balance;
		this.balDt = balDt;
		this.panNo = panNo;
		this.gstNo = gstNo;
	}

	public int getSupplId() {
		return supplId;
	}

	public void setSupplId(int supplId) {
		this.supplId = supplId;
	}

	public String getSupplName() {
		return supplName;
	}

	public void setSupplName(String supplName) {
		this.supplName = supplName;
	}

	public String getSupplAdd1() {
		return supplAdd1;
	}

	public void setSupplAdd1(String supplAdd1) {
		this.supplAdd1 = supplAdd1;
	}

	public String getSupplAdd2() {
		return supplAdd2;
	}

	public void setSupplAdd2(String supplAdd2) {
		this.supplAdd2 = supplAdd2;
	}

	public String getSupplAdd3() {
		return supplAdd3;
	}

	public void setSupplAdd3(String supplAdd3) {
		this.supplAdd3 = supplAdd3;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public Date getBalDt() {
		return balDt;
	}

	public void setBalDt(Date balDt) {
		this.balDt = balDt;
	}

	public String getPanNo() {
		return panNo;
	}

	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}

	public String getGstNo() {
		return gstNo;
	}

	public void setGstNo(String gstNo) {
		this.gstNo = gstNo;
	}

	@Override
	public String toString() {
		return "Supplier [supplId=" + supplId + ", supplName=" + supplName + ", supplAdd1=" + supplAdd1 + ", supplAdd2="
				+ supplAdd2 + ", supplAdd3=" + supplAdd3 + ", balance=" + balance + ", balDt=" + balDt + ", panNo="
				+ panNo + ", gstNo=" + gstNo + "]";
	}
	
	
}
