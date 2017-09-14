package com.vedisoft.danishhousing.pojos;

public class CashBankBookDto {
	
	int docNo;
	String accNo;
	String accName;
	String remarks;
	double amount;
	double adjustment;
	
	
	public CashBankBookDto() {
		super();
	}

	public CashBankBookDto(int docNo, String accNo, String accName, String remarks, double amount, double adjustment) {
		super();
		this.docNo = docNo;
		this.accNo = accNo;
		this.accName = accName;
		this.remarks = remarks;
		this.amount = amount;
		this.adjustment = adjustment;
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

	@Override
	public String toString() {
		return "CashBankBookDto [docNo=" + docNo + ", accNo=" + accNo + ", accName=" + accName + ", remarks=" + remarks
				+ ", amount=" + amount + ", adjustment=" + adjustment + "]";
	}
	
	

}
