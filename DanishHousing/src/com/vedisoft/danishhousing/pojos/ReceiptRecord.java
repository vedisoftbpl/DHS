package com.vedisoft.danishhousing.pojos;

import java.util.Date;

public class ReceiptRecord {
	
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
	private Double amount;
	
	private Double balChq;
	private String cDd;
	private Date cDdte;
	private String fullPay;
	private String inst1;
	private String inst2;
	private String inst3;
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
	private String dC;
	private Date wLrDt;
	private int userId;
	private Date lastUpdate;
	private String city;
	
	public ReceiptRecord() {
		super();
	}
	public ReceiptRecord( char payType, int slno, Date recDte, int receno, String prefix, String membNme,
			int membNo, String fHNme, String mad1, String mad2, String mad3, Double amount,
			Double balChq, String cDd, Date cDdte, String fullPay, String inst1, String inst2, String inst3, int chalNo,
			Date chalDte, String plSize, String plNo, int projCd, String chqDhr, String flag, char trCode,
			String remarks, char rC, String pD, String accode, String branch, String dC, Date wLrDt,int userId, Date lastUpdate , String city) {
		
	
	
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
	
		this.amount = amount;
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
		this.city = city;
	}
	
	public ReceiptRecord( char payType, int slno, Date recDte, int receno, int membNo,
			Double amount, String cDd, Date cDdte, String plSize, String plNo, int projCd, char trCode,
			String remarks, char rC, String pD, String accode, String branch, String dC,int userId, Date lastUpdate, String city) {
		super();
		
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
		this.amount =amount;
		this.balChq = 0.0;
		this.cDd = cDd;
		this.cDdte = cDdte;
		this.fullPay = "N";
		this.inst1 = "";
		this.inst2 = "";
		this.inst3 = "";
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
		this.city = city;
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

	public void setAmount(Double amount) {
		this.amount = amount;
	}
	
	public double getAmount() {
		return amount;
	}
	public Double getBalChq() {
		return balChq;
	}
	public void setBalChq(Double balChq) {
		this.balChq = balChq;
	}
	public String getcDd() {
		return cDd;
	}
	public void setcDd(String cDd) {
		this.cDd = cDd;
	}
	public Date getcDdte() {
		return cDdte;
	}
	public void setcDdte(Date cDdte) {
		this.cDdte = cDdte;
	}
	public String getFullPay() {
		return fullPay;
	}
	public void setFullPay(String fullPay) {
		this.fullPay = fullPay;
	}
	public String getInst1() {
		return inst1;
	}
	public void setInst1(String inst1) {
		this.inst1 = inst1;
	}
	public String getInst2() {
		return inst2;
	}
	public void setInst2(String inst2) {
		this.inst2 = inst2;
	}
	public String getInst3() {
		return inst3;
	}
	public void setInst3(String inst3) {
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
	public String getdC() {
		return dC;
	}
	public void setdC(String dC) {
		this.dC = dC;
	}
	public Date getwLrDt() {
		return wLrDt;
	}
	public void setwLrDt(Date wLrDt) {
		this.wLrDt = wLrDt;
	}
	
	
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	@Override
	public String toString() {
		return "ReceiptRecord [ sNo=" + sNo + ", payType=" + payType + ", slno=" + slno
				+ ", recDte=" + recDte + ", receno=" + receno + ", prefix=" + prefix + ", membNme=" + membNme
				+ ", membNo=" + membNo + ", fHNme=" + fHNme + ", mad1=" + mad1 + ", mad2=" + mad2 + ", mad3=" + mad3
				+ ", Amount=" + amount  + ", balChq=" + balChq + ", cDd=" + cDd + ", cDdte="
				+ cDdte + ", fullPay=" + fullPay + ", inst1=" + inst1 + ", inst2=" + inst2 + ", inst3=" + inst3
				+ ", chalNo=" + chalNo + ", chalDte=" + chalDte + ", plSize=" + plSize + ", plNo=" + plNo + ", projCd="
				+ projCd + ", chqDhr=" + chqDhr + ", flag=" + flag + ", trCode=" + trCode + ", remarks=" + remarks
				+ ", rC=" + rC + ", pD=" + pD + ", accode=" + accode + ", branch=" + branch + ", dC(Transaction Type)=" + dC + ", wLrDt="
				+ wLrDt + "]";
	}

	
	
	
	
	
	

}
