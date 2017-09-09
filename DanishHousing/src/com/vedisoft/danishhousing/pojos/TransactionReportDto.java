package com.vedisoft.danishhousing.pojos;

import java.util.Date;

public class TransactionReportDto {
	
	private int recNo;
	private Date date;
	private String particular;
	private String mode;
	private double credit;
	private double debit;
	public TransactionReportDto() {
		super();
	}
	public TransactionReportDto(int recNo, Date date, String particular, String mode, double credit, double debit) {
		super();
		this.recNo = recNo;
		this.date = date;
		this.particular = particular;
		this.mode = mode;
		this.credit = credit;
		this.debit = debit;
	}
	public int getRecNo() {
		return recNo;
	}
	public void setRecNo(int recNo) {
		this.recNo = recNo;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getParticular() {
		return particular;
	}
	public void setParticular(String particular) {
		this.particular = particular;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public double getCredit() {
		return credit;
	}
	public void setCredit(double credit) {
		this.credit = credit;
	}
	public double getDebit() {
		return debit;
	}
	public void setDebit(double debit) {
		this.debit = debit;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(credit);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		temp = Double.doubleToLongBits(debit);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((mode == null) ? 0 : mode.hashCode());
		result = prime * result + ((particular == null) ? 0 : particular.hashCode());
		result = prime * result + recNo;
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
		TransactionReportDto other = (TransactionReportDto) obj;
		if (Double.doubleToLongBits(credit) != Double.doubleToLongBits(other.credit))
			return false;
		if (date == null) {
			if (other.date != null)
				return false;
		} else if (!date.equals(other.date))
			return false;
		if (Double.doubleToLongBits(debit) != Double.doubleToLongBits(other.debit))
			return false;
		if (mode == null) {
			if (other.mode != null)
				return false;
		} else if (!mode.equals(other.mode))
			return false;
		if (particular == null) {
			if (other.particular != null)
				return false;
		} else if (!particular.equals(other.particular))
			return false;
		if (recNo != other.recNo)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "TransactionReportDto [recNo=" + recNo + ", date=" + date + ", particular=" + particular + ", mode="
				+ mode + ", credit=" + credit + ", debit=" + debit + "]";
	}
	
	
	

}
