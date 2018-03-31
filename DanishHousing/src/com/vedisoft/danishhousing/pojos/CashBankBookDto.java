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
	private String membName;
	private String chqNo;
	private Date docDate;
	private String bkCode;
	private String docType;
	
	
	public CashBankBookDto() {
		super();
	}

	public CashBankBookDto(int docNo, String accNo, String accName, String remarks, double amount, double adjustment,
			int membNo, String membName, String chqNo, Date docDate, String bkCode, String docType) {
		super();
		this.docNo = docNo;
		this.accNo = accNo;
		this.accName = accName;
		this.remarks = remarks;
		this.amount = amount;
		this.adjustment = adjustment;
		this.membNo = membNo;
		this.membName = membName;
		this.chqNo = chqNo;
		this.docDate = docDate;
		this.bkCode = bkCode;
		this.docType = docType;
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


	public Date getDocDate() {
		return docDate;
	}


	public void setDocDate(Date docDate) {
		this.docDate = docDate;
	}


	public String getBkCode() {
		return bkCode;
	}


	public void setBkCode(String bkCode) {
		this.bkCode = bkCode;
	}


	public String getDocType() {
		return docType;
	}


	public void setDocType(String docType) {
		this.docType = docType;
	}


	public String getMembName() {
		return membName;
	}

	public void setMembName(String membName) {
		this.membName = membName;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((accName == null) ? 0 : accName.hashCode());
		result = prime * result + ((accNo == null) ? 0 : accNo.hashCode());
		long temp;
		temp = Double.doubleToLongBits(adjustment);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(amount);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((bkCode == null) ? 0 : bkCode.hashCode());
		result = prime * result + ((chqNo == null) ? 0 : chqNo.hashCode());
		result = prime * result + ((docDate == null) ? 0 : docDate.hashCode());
		result = prime * result + docNo;
		result = prime * result + ((docType == null) ? 0 : docType.hashCode());
		result = prime * result + ((membName == null) ? 0 : membName.hashCode());
		result = prime * result + membNo;
		result = prime * result + ((remarks == null) ? 0 : remarks.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CashBankBookDto other = (CashBankBookDto) obj;
		if (accName == null) {
			if (other.accName != null)
				return false;
		} else if (!accName.equals(other.accName))
			return false;
		if (accNo == null) {
			if (other.accNo != null)
				return false;
		} else if (!accNo.equals(other.accNo))
			return false;
		if (Double.doubleToLongBits(adjustment) != Double.doubleToLongBits(other.adjustment))
			return false;
		if (Double.doubleToLongBits(amount) != Double.doubleToLongBits(other.amount))
			return false;
		if (bkCode == null) {
			if (other.bkCode != null)
				return false;
		} else if (!bkCode.equals(other.bkCode))
			return false;
		if (chqNo == null) {
			if (other.chqNo != null)
				return false;
		} else if (!chqNo.equals(other.chqNo))
			return false;
		if (docDate == null) {
			if (other.docDate != null)
				return false;
		} else if (!docDate.equals(other.docDate))
			return false;
		if (docNo != other.docNo)
			return false;
		if (docType == null) {
			if (other.docType != null)
				return false;
		} else if (!docType.equals(other.docType))
			return false;
		if (membName == null) {
			if (other.membName != null)
				return false;
		} else if (!membName.equals(other.membName))
			return false;
		if (membNo != other.membNo)
			return false;
		if (remarks == null) {
			if (other.remarks != null)
				return false;
		} else if (!remarks.equals(other.remarks))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CashBankBookDto [docNo=" + docNo + ", accNo=" + accNo + ", accName=" + accName + ", remarks=" + remarks
				+ ", amount=" + amount + ", adjustment=" + adjustment + ", membNo=" + membNo + ", membName=" + membName
				+ ", chqNo=" + chqNo + ", docDate=" + docDate + ", bkCode=" + bkCode + ", docType=" + docType + "]";
	}

	

	
	

}
