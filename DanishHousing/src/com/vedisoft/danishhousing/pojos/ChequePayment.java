package com.vedisoft.danishhousing.pojos;

import java.util.Date;

public class ChequePayment {

	private int docno;
	private Date docDate;
	private String bankCode;
	private String paymentMode;
	private String transactionNo;
	private Date chequeDate;
	private Double amount;
	private Date cheqClDate;
	public ChequePayment() {
		super();
	}
	public ChequePayment(int docno, Date docDate, String bankCode, String paymentMode, String transactionNo,
			Date chequeDate, Double amount, Date cheqClDate) {
		super();
		this.docno = docno;
		this.docDate = docDate;
		this.bankCode = bankCode;
		this.paymentMode = paymentMode;
		this.transactionNo = transactionNo;
		this.chequeDate = chequeDate;
		this.amount = amount;
		this.cheqClDate = cheqClDate;
	}
	public int getDocno() {
		return docno;
	}
	public void setDocno(int docno) {
		this.docno = docno;
	}
	public Date getDocDate() {
		return docDate;
	}
	public void setDocDate(Date docDate) {
		this.docDate = docDate;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public String getTransactionNo() {
		return transactionNo;
	}
	public void setTransactionNo(String transactionNo) {
		this.transactionNo = transactionNo;
	}
	public Date getChequeDate() {
		return chequeDate;
	}
	public void setChequeDate(Date chequeDate) {
		this.chequeDate = chequeDate;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public Date getCheqClDate() {
		return cheqClDate;
	}
	public void setCheqClDate(Date cheqClDate) {
		this.cheqClDate = cheqClDate;
	}
	@Override
	public String toString() {
		return "ChequePayment [docno=" + docno + ", docDate=" + docDate + ", bankCode=" + bankCode + ", paymentMode="
				+ paymentMode + ", transactionNo=" + transactionNo + ", chequeDate=" + chequeDate + ", amount=" + amount
				+ ", cheqClDate=" + cheqClDate + "]";
	}
	
	
}
