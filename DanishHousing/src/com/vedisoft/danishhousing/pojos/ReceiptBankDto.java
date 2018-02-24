package com.vedisoft.danishhousing.pojos;

public class ReceiptBankDto {
	private ReceiptRecord receipt;
	private String bankName;
	private String bankCode;
	public ReceiptBankDto() {
		super();
	}
	public ReceiptBankDto(ReceiptRecord receipt, String bankName, String bankCode) {
		super();
		this.receipt = receipt;
		this.bankName = bankName;
		this.bankCode = bankCode;
	}
	public ReceiptRecord getReceipt() {
		return receipt;
	}
	public void setReceipt(ReceiptRecord receipt) {
		this.receipt = receipt;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	@Override
	public String toString() {
		return "ReceiptBankDto [receipt=" + receipt + ", bankName=" + bankName + ", bankCode=" + bankCode + "]";
	}
	
	
}
