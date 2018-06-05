package com.vedisoft.danishhousing.pojos;

import java.util.Date;

public class RefundPayment {

	private String payType;
	private int memberNo;
	private double amount;
	private String transactionNo;
	private Date cdDate;
	private String remarks;
	private String pD;
	private int voucherNo;
	private int slNo;
	private String paymentmode;
	private String accode;
	public RefundPayment() {
		super();
	}
	public RefundPayment(String payType, int memberNo, double amount, String transactionNo, Date cdDate, String remarks,
			String pD, int voucherNo, int slNo, String paymentmode, String accode) {
		super();
		this.payType = payType;
		this.memberNo = memberNo;
		this.amount = amount;
		this.transactionNo = transactionNo;
		this.cdDate = cdDate;
		this.remarks = remarks;
		this.pD = pD;
		this.voucherNo = voucherNo;
		this.slNo = slNo;
		this.paymentmode = paymentmode;
		this.accode = accode;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getTransactionNo() {
		return transactionNo;
	}
	public void setTransactionNo(String transactionNo) {
		this.transactionNo = transactionNo;
	}
	public Date getCdDate() {
		return cdDate;
	}
	public void setCdDate(Date cdDate) {
		this.cdDate = cdDate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getpD() {
		return pD;
	}
	public void setpD(String pD) {
		this.pD = pD;
	}
	public int getVoucherNo() {
		return voucherNo;
	}
	public void setVoucherNo(int voucherNo) {
		this.voucherNo = voucherNo;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	public String getPaymentmode() {
		return paymentmode;
	}
	public void setPaymentmode(String paymentmode) {
		this.paymentmode = paymentmode;
	}
	public String getAccode() {
		return accode;
	}
	public void setAccode(String accode) {
		this.accode = accode;
	}
	@Override
	public String toString() {
		return "RefundPayment [payType=" + payType + ", memberNo=" + memberNo + ", amount=" + amount
				+ ", transactionNo=" + transactionNo + ", cdDate=" + cdDate + ", remarks=" + remarks + ", pD=" + pD
				+ ", voucherNo=" + voucherNo + ", slNo=" + slNo + ", paymentmode=" + paymentmode + ", accode=" + accode
				+ "]";
	}
	
	
	
	
	
	
	
	
	
}
