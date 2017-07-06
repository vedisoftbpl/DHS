package com.vedisoft.danishhousing.pojos;

import java.util.Date;

public class Account {
	
	private int accountId;
	private String coCode;
	private String bkCode;
	private String bkName;
	private Date opDate;
	private double opBal;
	private double receipt;
	private double payment;
	private double clBal;
	private String ifsc;
	private String branch;
	public Account() {
		super();
	}
	public Account(String coCode, String bkCode, String bkName, Date opDate, double opBal, double receipt,
			double payment, double clBal, String ifsc, String branch) {
		super();
		this.coCode = coCode;
		this.bkCode = bkCode;
		this.bkName = bkName;
		this.opDate = opDate;
		this.opBal = opBal;
		this.receipt = receipt;
		this.payment = payment;
		this.clBal = clBal;
		this.ifsc = ifsc;
		this.branch = branch;
	}
	public Account(int accountId, String coCode, String bkCode, String bkName, Date opDate, double opBal,
			double receipt, double payment, double clBal, String ifsc, String branch) {
		super();
		this.accountId = accountId;
		this.coCode = coCode;
		this.bkCode = bkCode;
		this.bkName = bkName;
		this.opDate = opDate;
		this.opBal = opBal;
		this.receipt = receipt;
		this.payment = payment;
		this.clBal = clBal;
		this.ifsc = ifsc;
		this.branch = branch;
	}
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public String getCoCode() {
		return coCode;
	}
	public void setCoCode(String coCode) {
		this.coCode = coCode;
	}
	public String getBkCode() {
		return bkCode;
	}
	public void setBkCode(String bkCode) {
		this.bkCode = bkCode;
	}
	public String getBkName() {
		return bkName;
	}
	public void setBkName(String bkName) {
		this.bkName = bkName;
	}
	public Date getOpDate() {
		return opDate;
	}
	public void setOpDate(Date opDate) {
		this.opDate = opDate;
	}
	public double getOpBal() {
		return opBal;
	}
	public void setOpBal(double opBal) {
		this.opBal = opBal;
	}
	public double getReceipt() {
		return receipt;
	}
	public void setReceipt(double receipt) {
		this.receipt = receipt;
	}
	public double getPayment() {
		return payment;
	}
	public void setPayment(double payment) {
		this.payment = payment;
	}
	public double getClBal() {
		return clBal;
	}
	public void setClBal(double clBal) {
		this.clBal = clBal;
	}
	public String getIfsc() {
		return ifsc;
	}
	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	@Override
	public String toString() {
		return "Account [accountId=" + accountId + ", coCode=" + coCode + ", bkCode=" + bkCode + ", bkName=" + bkName
				+ ", opDate=" + opDate + ", opBal=" + opBal + ", receipt=" + receipt + ", payment=" + payment
				+ ", clBal=" + clBal + ", ifsc=" + ifsc + ", branch=" + branch + "]";
	}
	
	
	

}
