package com.vedisoft.danishhousing.pojos;

import java.util.Date;

public class CashBankBookDto {
	
	private int docNo;
	private String accNo;
	private String accName;
	private String remarks;
	private double amount;
	private double adjustment;
	private int membNo;
	private String chqNo;
	private Date chDate;
	
	
	public CashBankBookDto() {
		super();
	}

	public CashBankBookDto(int docNo, String accNo, String accName, String remarks, double amount, double adjustment,
			int membNo, String chqNo, Date chDate) {
		super();
		this.docNo = docNo;
		this.accNo = accNo;
		this.accName = accName;
		this.remarks = remarks;
		this.amount = amount;
		this.adjustment = adjustment;
		this.membNo = membNo;
		this.chqNo = chqNo;
		this.chDate = chDate;
	}

	

	public int getDocNo() {
		return docNo;
	}

	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public String getAccName() {
		return accName;
	}

	public void setAccName(String accName) {
		this.accName = accName;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public double getAdjustment() {
		return adjustment;
	}

	public void setAdjustment(double adjustment) {
		this.adjustment = adjustment;
	}

	public int getMembNo() {
		return membNo;
	}

	public void setMembNo(int membNo) {
		this.membNo = membNo;
	}

	
	public String getChqNo() {
		return chqNo;
	}

	public void setChqNo(String chqNo) {
		this.chqNo = chqNo;
	}

	public Date getChDate() {
		return chDate;
	}

	public void setChDate(Date chDate) {
		this.chDate = chDate;
	}

	@Override
	public String toString() {
		return "CashBankBookDto [docNo=" + docNo + ", accNo=" + accNo + ", accName=" + accName + ", remarks=" + remarks
				+ ", amount=" + amount + ", adjustment=" + adjustment + ", membNo=" + membNo + ", chqNo=" + chqNo + ", chDate=" + chDate + "]";
	}

	
	
	

}
