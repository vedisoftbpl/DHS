package com.vedisoft.danishhousing.pojos;

import java.util.ArrayList;
import java.util.Date;

public class DailyTransactionDto {

	private ArrayList<CashBankBookDto> dailyTransaction;
	private ArrayList<TrialBalanceDto> openingBalance;
	private ArrayList<TrialBalanceDto> closingBalance;
	private double totalRec;
	private double totalPay;
	private Date currDate;

	public DailyTransactionDto() {
		super();
	}

	public DailyTransactionDto(ArrayList<CashBankBookDto> dailyTransaction, ArrayList<TrialBalanceDto> openingBalance,
			ArrayList<TrialBalanceDto> closingBalance, double totalRec, double totalPay, Date currDate) {
		super();
		this.dailyTransaction = dailyTransaction;
		this.openingBalance = openingBalance;
		this.closingBalance = closingBalance;
		this.totalRec = totalRec;
		this.totalPay = totalPay;
		this.currDate = currDate;
	}

	public ArrayList<CashBankBookDto> getDailyTransaction() {
		return dailyTransaction;
	}

	public void setDailyTransaction(ArrayList<CashBankBookDto> dailyTransaction) {
		this.dailyTransaction = dailyTransaction;
	}

	public ArrayList<TrialBalanceDto> getOpeningBalance() {
		return openingBalance;
	}

	public void setOpeningBalance(ArrayList<TrialBalanceDto> openingBalance) {
		this.openingBalance = openingBalance;
	}

	public ArrayList<TrialBalanceDto> getClosingBalance() {
		return closingBalance;
	}

	public void setClosingBalance(ArrayList<TrialBalanceDto> closingBalance) {
		this.closingBalance = closingBalance;
	}

	public double getTotalRec() {
		return totalRec;
	}

	public void setTotalRec(double totalRec) {
		this.totalRec = totalRec;
	}

	public double getTotalPay() {
		return totalPay;
	}

	public void setTotalPay(double totalPay) {
		this.totalPay = totalPay;
	}

	public Date getCurrDate() {
		return currDate;
	}

	public void setCurrDate(Date currDate) {
		this.currDate = currDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((closingBalance == null) ? 0 : closingBalance.hashCode());
		result = prime * result + ((currDate == null) ? 0 : currDate.hashCode());
		result = prime * result + ((dailyTransaction == null) ? 0 : dailyTransaction.hashCode());
		result = prime * result + ((openingBalance == null) ? 0 : openingBalance.hashCode());
		long temp;
		temp = Double.doubleToLongBits(totalPay);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(totalRec);
		result = prime * result + (int) (temp ^ (temp >>> 32));
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
		DailyTransactionDto other = (DailyTransactionDto) obj;
		if (closingBalance == null) {
			if (other.closingBalance != null)
				return false;
		} else if (!closingBalance.equals(other.closingBalance))
			return false;
		if (currDate == null) {
			if (other.currDate != null)
				return false;
		} else if (!currDate.equals(other.currDate))
			return false;
		if (dailyTransaction == null) {
			if (other.dailyTransaction != null)
				return false;
		} else if (!dailyTransaction.equals(other.dailyTransaction))
			return false;
		if (openingBalance == null) {
			if (other.openingBalance != null)
				return false;
		} else if (!openingBalance.equals(other.openingBalance))
			return false;
		if (Double.doubleToLongBits(totalPay) != Double.doubleToLongBits(other.totalPay))
			return false;
		if (Double.doubleToLongBits(totalRec) != Double.doubleToLongBits(other.totalRec))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "DailyTransactionDto [dailyTransaction=" + dailyTransaction + ", openingBalance=" + openingBalance
				+ ", closingBalance=" + closingBalance + ", totalRec=" + totalRec + ", totalPay=" + totalPay
				+ ", currDate=" + currDate + "]";
	}

	

	
}
