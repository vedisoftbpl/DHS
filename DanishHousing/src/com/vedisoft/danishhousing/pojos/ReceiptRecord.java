package com.vedisoft.danishhousing.pojos;

import java.util.Date;

public class ReceiptRecord {
	private int recordId;
	private int sNo;
	private char payType;
	private int slno;
	private Date recDte;
	private int receno;
	private String prefix;
	private String membNme;
	private int membNo;
	private String fHNme;
	private String mad1;
	private String mad2;
	private String mad3;
	private Double cashAmt;
	private Double chqAmt;
	private Double balChq;
	private int cDd;
	private Date cDdte;
	private Double fullPay;
	private Double inst1;
	private Double inst2;
	private Double inst3;
	private int chalNo;
	private Date chalDte;
	private String plSize;
	private String plNo;
	private int projCd;
	private String chqDhr;
	private String flag;
	private char trCode;
	private String remarks;
	private char rC;
	private String pD;
	private String accode;
	private String branch;
	private char dC;
	private Date wLrDt;
	private int userId;
	private Date lastUpdate;
	public ReceiptRecord() {
		super();
	}
	public ReceiptRecord(int sNo, char payType, int slno, Date recDte, int receno, String prefix, String membNme,
			int membNo, String fHNme, String mad1, String mad2, String mad3, Double cashAmt, Double chqAmt,
			Double balChq, int cDd, Date cDdte, Double fullPay, Double inst1, Double inst2, Double inst3, int chalNo,
			Date chalDte, String plSize, String plNo, int projCd, String chqDhr, String flag, char trCode,
			String remarks, char rC, String pD, String accode, String branch, char dC, Date wLrDt,int userId, Date lastUpdate) {
		super();
		this.sNo = sNo;
		this.payType = payType;
		this.slno = slno;
		this.recDte = recDte;
		this.receno = receno;
		this.prefix = prefix;
		this.membNme = membNme;
		this.membNo = membNo;
		this.fHNme = fHNme;
		this.mad1 = mad1;
		this.mad2 = mad2;
		this.mad3 = mad3;
		this.cashAmt = cashAmt;
		this.chqAmt = chqAmt;
		this.balChq = balChq;
		this.cDd = cDd;
		this.cDdte = cDdte;
		this.fullPay = fullPay;
		this.inst1 = inst1;
		this.inst2 = inst2;
		this.inst3 = inst3;
		this.chalNo = chalNo;
		this.chalDte = chalDte;
		this.plSize = plSize;
		this.plNo = plNo;
		this.projCd = projCd;
		this.chqDhr = chqDhr;
		this.flag = flag;
		this.trCode = trCode;
		this.remarks = remarks;
		this.rC = rC;
		this.pD = pD;
		this.accode = accode;
		this.branch = branch;
		this.dC = dC;
		this.wLrDt = wLrDt;
		this.userId = userId;
		this.lastUpdate = lastUpdate;
	}
	public ReceiptRecord( int sNo, char payType, int slno, Date recDte, int receno, int membNo,
			Double cashAmt, Double chqAmt, int cDd, Date cDdte, String plSize, String plNo, int projCd, char trCode,
			String remarks, char rC, String pD, String accode, String branch, char dC,int userId, Date lastUpdate) {
		super();
		this.sNo = sNo;
		this.payType = payType;
		this.slno = slno;
		this.recDte = recDte;
		this.receno = receno;
		this.prefix = " ";
		this.membNme = " ";
		this.membNo = membNo;
		this.fHNme = " ";
		this.mad1 = " ";
		this.mad2 = " ";
		this.mad3 = " ";
		this.cashAmt = cashAmt;
		this.chqAmt = chqAmt;
		this.balChq = 0.0;
		this.cDd = cDd;
		this.cDdte = cDdte;
		this.fullPay = 0.0;
		this.inst1 = 0.0;
		this.inst2 = 0.0;
		this.inst3 = 0.0;
		this.chalNo = 0;
		this.chalDte = null;
		this.plSize = plSize;
		this.plNo = plNo;
		this.projCd = projCd;
		this.chqDhr = " ";
		this.flag = " ";
		this.trCode = trCode;
		this.remarks = remarks;
		this.rC = rC;
		this.pD = pD;
		this.accode = accode;
		this.branch = branch;
		this.dC = dC;
		this.wLrDt = null;
		this.userId = userId;
		this.lastUpdate = lastUpdate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	public int getRecordId() {
		return recordId;
	}
	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public char getPayType() {
		return payType;
	}
	public void setPayType(char payType) {
		this.payType = payType;
	}
	public int getSlno() {
		return slno;
	}
	public void setSlno(int slno) {
		this.slno = slno;
	}
	public Date getRecDte() {
		return recDte;
	}
	public void setRecDte(Date recDte) {
		this.recDte = recDte;
	}
	public int getReceno() {
		return receno;
	}
	public void setReceno(int receno) {
		this.receno = receno;
	}
	public String getPrefix() {
		return prefix;
	}
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	public String getMembNme() {
		return membNme;
	}
	public void setMembNme(String membNme) {
		this.membNme = membNme;
	}
	public int getMembNo() {
		return membNo;
	}
	public void setMembNo(int membNo) {
		this.membNo = membNo;
	}
	public String getfHNme() {
		return fHNme;
	}
	public void setfHNme(String fHNme) {
		this.fHNme = fHNme;
	}
	public String getMad1() {
		return mad1;
	}
	public void setMad1(String mad1) {
		this.mad1 = mad1;
	}
	public String getMad2() {
		return mad2;
	}
	public void setMad2(String mad2) {
		this.mad2 = mad2;
	}
	public String getMad3() {
		return mad3;
	}
	public void setMad3(String mad3) {
		this.mad3 = mad3;
	}
	public Double getCashAmt() {
		return cashAmt;
	}
	public void setCashAmt(Double cashAmt) {
		this.cashAmt = cashAmt;
	}
	public Double getChqAmt() {
		return chqAmt;
	}
	public void setChqAmt(Double chqAmt) {
		this.chqAmt = chqAmt;
	}
	public Double getBalChq() {
		return balChq;
	}
	public void setBalChq(Double balChq) {
		this.balChq = balChq;
	}
	public int getcDd() {
		return cDd;
	}
	public void setcDd(int cDd) {
		this.cDd = cDd;
	}
	public Date getcDdte() {
		return cDdte;
	}
	public void setcDdte(Date cDdte) {
		this.cDdte = cDdte;
	}
	public Double getFullPay() {
		return fullPay;
	}
	public void setFullPay(Double fullPay) {
		this.fullPay = fullPay;
	}
	public Double getInst1() {
		return inst1;
	}
	public void setInst1(Double inst1) {
		this.inst1 = inst1;
	}
	public Double getInst2() {
		return inst2;
	}
	public void setInst2(Double inst2) {
		this.inst2 = inst2;
	}
	public Double getInst3() {
		return inst3;
	}
	public void setInst3(Double inst3) {
		this.inst3 = inst3;
	}
	public int getChalNo() {
		return chalNo;
	}
	public void setChalNo(int chalNo) {
		this.chalNo = chalNo;
	}
	public Date getChalDte() {
		return chalDte;
	}
	public void setChalDte(Date chalDte) {
		this.chalDte = chalDte;
	}
	public String getPlSize() {
		return plSize;
	}
	public void setPlSize(String plSize) {
		this.plSize = plSize;
	}
	public String getPlNo() {
		return plNo;
	}
	public void setPlNo(String plNo) {
		this.plNo = plNo;
	}
	public int getProjCd() {
		return projCd;
	}
	public void setProjCd(int projCd) {
		this.projCd = projCd;
	}
	public String getChqDhr() {
		return chqDhr;
	}
	public void setChqDhr(String chqDhr) {
		this.chqDhr = chqDhr;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public char getTrCode() {
		return trCode;
	}
	public void setTrCode(char trCode) {
		this.trCode = trCode;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public char getrC() {
		return rC;
	}
	public void setrC(char rC) {
		this.rC = rC;
	}
	public String getpD() {
		return pD;
	}
	public void setpD(String pD) {
		this.pD = pD;
	}
	public String getAccode() {
		return accode;
	}
	public void setAccode(String accode) {
		this.accode = accode;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public char getdC() {
		return dC;
	}
	public void setdC(char dC) {
		this.dC = dC;
	}
	public Date getwLrDt() {
		return wLrDt;
	}
	public void setwLrDt(Date wLrDt) {
		this.wLrDt = wLrDt;
	}
	@Override
	public String toString() {
		return "ReceiptRecord [recordId=" + recordId + ", sNo=" + sNo + ", payType=" + payType + ", slno=" + slno
				+ ", recDte=" + recDte + ", receno=" + receno + ", prefix=" + prefix + ", membNme=" + membNme
				+ ", membNo=" + membNo + ", fHNme=" + fHNme + ", mad1=" + mad1 + ", mad2=" + mad2 + ", mad3=" + mad3
				+ ", cashAmt=" + cashAmt + ", chqAmt=" + chqAmt + ", balChq=" + balChq + ", cDd=" + cDd + ", cDdte="
				+ cDdte + ", fullPay=" + fullPay + ", inst1=" + inst1 + ", inst2=" + inst2 + ", inst3=" + inst3
				+ ", chalNo=" + chalNo + ", chalDte=" + chalDte + ", plSize=" + plSize + ", plNo=" + plNo + ", projCd="
				+ projCd + ", chqDhr=" + chqDhr + ", flag=" + flag + ", trCode=" + trCode + ", remarks=" + remarks
				+ ", rC=" + rC + ", pD=" + pD + ", accode=" + accode + ", branch=" + branch + ", dC=" + dC + ", wLrDt="
				+ wLrDt + "]";
	}

	
	
	
	
	
	

}
