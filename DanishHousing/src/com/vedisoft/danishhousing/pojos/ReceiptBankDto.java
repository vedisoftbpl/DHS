package com.vedisoft.danishhousing.pojos;

public class ReceiptBankDto {
	private ReceiptRecord receipt;
	private String bankName;
	
	public ReceiptBankDto(ReceiptRecord receipt, String bankName) {
		super();
		this.receipt = receipt;
		this.bankName = bankName;
	}

	public ReceiptBankDto() {
		super();
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

	@Override
	public String toString() {
		return "ReceiptBankDto [receipt=" + receipt + ", bankName=" + bankName + "]";
	}
	
	
}
