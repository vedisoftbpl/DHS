package com.vedisoft.danishhousing.pojos;

import java.util.ArrayList;

public class MonthlyTransactionReportDto {
private ArrayList<TransactionReportDto> tdto;
private double monthlyDebit;
private double monthlyCredit;
private double monthlyBalance;
public MonthlyTransactionReportDto() {
	super();
}
public MonthlyTransactionReportDto(ArrayList<TransactionReportDto> tdto, double monthlyDebit, double monthlyCredit,
		double monthlyBalance) {
	super();
	this.tdto = tdto;
	this.monthlyDebit = monthlyDebit;
	this.monthlyCredit = monthlyCredit;
	this.monthlyBalance = monthlyBalance;
}
public ArrayList<TransactionReportDto> getTdto() {
	return tdto;
}
public void setTdto(ArrayList<TransactionReportDto> tdto) {
	this.tdto = tdto;
}
public double getMonthlyDebit() {
	return monthlyDebit;
}
public void setMonthlyDebit(double monthlyDebit) {
	this.monthlyDebit = monthlyDebit;
}
public double getMonthlyCredit() {
	return monthlyCredit;
}
public void setMonthlyCredit(double monthlyCredit) {
	this.monthlyCredit = monthlyCredit;
}
public double getMonthlyBalance() {
	return monthlyBalance;
}
public void setMonthlyBalance(double monthlyBalance) {
	this.monthlyBalance = monthlyBalance;
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	long temp;
	temp = Double.doubleToLongBits(monthlyBalance);
	result = prime * result + (int) (temp ^ (temp >>> 32));
	temp = Double.doubleToLongBits(monthlyCredit);
	result = prime * result + (int) (temp ^ (temp >>> 32));
	temp = Double.doubleToLongBits(monthlyDebit);
	result = prime * result + (int) (temp ^ (temp >>> 32));
	result = prime * result + ((tdto == null) ? 0 : tdto.hashCode());
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
	MonthlyTransactionReportDto other = (MonthlyTransactionReportDto) obj;
	if (Double.doubleToLongBits(monthlyBalance) != Double.doubleToLongBits(other.monthlyBalance))
		return false;
	if (Double.doubleToLongBits(monthlyCredit) != Double.doubleToLongBits(other.monthlyCredit))
		return false;
	if (Double.doubleToLongBits(monthlyDebit) != Double.doubleToLongBits(other.monthlyDebit))
		return false;
	if (tdto == null) {
		if (other.tdto != null)
			return false;
	} else if (!tdto.equals(other.tdto))
		return false;
	return true;
}
@Override
public String toString() {
	return "MonthlyTransactionReportDto [tdto=" + tdto + ", monthlyDebit=" + monthlyDebit + ", monthlyCredit="
			+ monthlyCredit + ", monthlyBalance=" + monthlyBalance + "]";
}

}