package com.vedisoft.danishhousing.pojos;

import java.util.ArrayList;

public class AllLedgerDto {
	private ArrayList<MonthlyTransactionReportDto> tranRecord;
	private String acCode;
	private String acName;
	public AllLedgerDto() {
		super();
	}
	public AllLedgerDto(ArrayList<MonthlyTransactionReportDto> tranRecord, String acCode, String acName) {
		super();
		this.tranRecord = tranRecord;
		this.acCode = acCode;
		this.acName = acName;
	}
	public ArrayList<MonthlyTransactionReportDto> getTranRecord() {
		return tranRecord;
	}
	public void setTranRecord(ArrayList<MonthlyTransactionReportDto> tranRecord) {
		this.tranRecord = tranRecord;
	}
	public String getAcCode() {
		return acCode;
	}
	public void setAcCode(String acCode) {
		this.acCode = acCode;
	}
	public String getAcName() {
		return acName;
	}
	public void setAcName(String acName) {
		this.acName = acName;
	}
	@Override
	public String toString() {
		return "AllLedgerDto [tranRecord=" + tranRecord + ", acCode=" + acCode + ", acName=" + acName + "]";
	}
	
	
}
