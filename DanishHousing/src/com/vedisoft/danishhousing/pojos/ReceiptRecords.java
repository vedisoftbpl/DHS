package com.vedisoft.danishhousing.pojos;

import java.io.Serializable;
import java.util.Date;

public class ReceiptRecords implements Serializable{

	private int recordId; 		//1
	private int sNo;			//2	
	private char payType;		//3
	private int sIno;			//4
	private Date recdte;		//5
	private int receno;		//6
	private String prefix;		//7
	private String membnme;		//8
	private int membno;		//9
	private String fHNme;		//10
	private String mad1;		//11
	private String mad2;		//12
	private String mad3;		//13
	private double cashamt;	//14
	private double chqamt;		//15
	private double balchq;		//16
	private int cDd;			//17
	private Date cDdte;			//18
	private double fullpay	;	//19
	private double inst1;		//20
	private double inst2;		//21
	private double inst3;		//22
	private int chalno;		//23
	private Date chaldte;		//24
	private String plSize;		//25
	private String plno;		//26
	private int projcd;		//27
	private String chqdhr;		//28
	private String flag;		//29
	private char trcode;		//30
	private String remarks;		//31
	private char rC;			//32
	private String pD;			//33
	private String accode;		//34
	private String branch;		//35
	private char dC;			//36
	private Date wcLrDc;		//37
	private String rcflcol;		//38
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
	public int getsIno() {
		return sIno;
	}
	public void setsIno(int sIno) {
		this.sIno = sIno;
	}
	public Date getRecdte() {
		return recdte;
	}
	public void setRecdte(Date recdte) {
		this.recdte = recdte;
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
	public String getMembnme() {
		return membnme;
	}
	public void setMembnme(String membnme) {
		this.membnme = membnme;
	}
	public int getMembno() {
		return membno;
	}
	public void setMembno(int membno) {
		this.membno = membno;
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
	public double getCashamt() {
		return cashamt;
	}
	public void setCashamt(double cashamt) {
		this.cashamt = cashamt;
	}
	public double getChqamt() {
		return chqamt;
	}
	public void setChqamt(double chqamt) {
		this.chqamt = chqamt;
	}
	public double getBalchq() {
		return balchq;
	}
	public void setBalchq(double balchq) {
		this.balchq = balchq;
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
	public double getFullpay() {
		return fullpay;
	}
	public void setFullpay(double fullpay) {
		this.fullpay = fullpay;
	}
	public double getInst1() {
		return inst1;
	}
	public void setInst1(double inst1) {
		this.inst1 = inst1;
	}
	public double getInst2() {
		return inst2;
	}
	public void setInst2(double inst2) {
		this.inst2 = inst2;
	}
	public double getInst3() {
		return inst3;
	}
	public void setInst3(double inst3) {
		this.inst3 = inst3;
	}
	public int getChalno() {
		return chalno;
	}
	public void setChalno(int chalno) {
		this.chalno = chalno;
	}
	public Date getChaldte() {
		return chaldte;
	}
	public void setChaldte(Date chaldte) {
		this.chaldte = chaldte;
	}
	public String getPlSize() {
		return plSize;
	}
	public void setPlSize(String plSize) {
		this.plSize = plSize;
	}
	public String getPlno() {
		return plno;
	}
	public void setPlno(String plno) {
		this.plno = plno;
	}
	public int getProjcd() {
		return projcd;
	}
	public void setProjcd(int projcd) {
		this.projcd = projcd;
	}
	public String getChqdhr() {
		return chqdhr;
	}
	public void setChqdhr(String chqdhr) {
		this.chqdhr = chqdhr;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public char getTrcode() {
		return trcode;
	}
	public void setTrcode(char trcode) {
		this.trcode = trcode;
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
	public Date getWcLrDc() {
		return wcLrDc;
	}
	public void setWcLrDc(Date wcLrDc) {
		this.wcLrDc = wcLrDc;
	}
	public String getRcflcol() {
		return rcflcol;
	}
	public void setRcflcol(String rcflcol) {
		this.rcflcol = rcflcol;
	}
	@Override
	public String toString() {
		return "ReceiptRecords [recordId=" + recordId + ", sNo=" + sNo + ", payType=" + payType + ", sIno=" + sIno
				+ ", recdte=" + recdte + ", receno=" + receno + ", prefix=" + prefix + ", membnme=" + membnme
				+ ", membno=" + membno + ", fHNme=" + fHNme + ", mad1=" + mad1 + ", mad2=" + mad2 + ", mad3=" + mad3
				+ ", cashamt=" + cashamt + ", chqamt=" + chqamt + ", balchq=" + balchq + ", cDd=" + cDd + ", cDdte="
				+ cDdte + ", fullpay=" + fullpay + ", inst1=" + inst1 + ", inst2=" + inst2 + ", inst3=" + inst3
				+ ", chalno=" + chalno + ", chaldte=" + chaldte + ", plSize=" + plSize + ", plno=" + plno + ", projcd="
				+ projcd + ", chqdhr=" + chqdhr + ", flag=" + flag + ", trcode=" + trcode + ", remarks=" + remarks
				+ ", rC=" + rC + ", pD=" + pD + ", accode=" + accode + ", branch=" + branch + ", dC=" + dC + ", wcLrDc="
				+ wcLrDc + ", rcflcol=" + rcflcol + "]";
	}
	
	
	
}
