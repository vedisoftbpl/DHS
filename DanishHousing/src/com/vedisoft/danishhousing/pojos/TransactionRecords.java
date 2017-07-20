package com.vedisoft.danishhousing.pojos;

import java.io.Serializable;
import java.util.Date;

public class TransactionRecords implements Serializable{

	private int trId;		//1
	private int sNo;		//2
	private int docno;		//3
	private int sIno;		//4
	private Date docdte;	//5
	private String doctype;	//6
	private String accode;	//7
	private int bkcode;	//8
	private int chqno;		//9
	private Date chDate;	//10
	private String bankBr;	//11
	private int membno;	//12
	private double amt;	//13
	private String parti;	//14
	private String aP;		//15
	private int flag;		//16
	private String vrNo;	//17
	private String sno;		//18
	private String sr;		//19
	private String docnoo;	//20
	private int projcd;	//21
	private Date wcLrDt;	//22
	private Date chClDt;	//23
	private String cFlag;	//24
	private int partyCd;	//25
	public int getTrId() {
		return trId;
	}
	public void setTrId(int trId) {
		this.trId = trId;
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public int getDocno() {
		return docno;
	}
	public void setDocno(int docno) {
		this.docno = docno;
	}
	public int getsIno() {
		return sIno;
	}
	public void setsIno(int sIno) {
		this.sIno = sIno;
	}
	public Date getDocdte() {
		return docdte;
	}
	public void setDocdte(Date docdte) {
		this.docdte = docdte;
	}
	public String getDoctype() {
		return doctype;
	}
	public void setDoctype(String doctype) {
		this.doctype = doctype;
	}
	public String getAccode() {
		return accode;
	}
	public void setAccode(String accode) {
		this.accode = accode;
	}
	public int getBkcode() {
		return bkcode;
	}
	public void setBkcode(int bkcode) {
		this.bkcode = bkcode;
	}
	public int getChqno() {
		return chqno;
	}
	public void setChqno(int chqno) {
		this.chqno = chqno;
	}
	public Date getChDate() {
		return chDate;
	}
	public void setChDate(Date chDate) {
		this.chDate = chDate;
	}
	public String getBankBr() {
		return bankBr;
	}
	public void setBankBr(String bankBr) {
		this.bankBr = bankBr;
	}
	public int getMembno() {
		return membno;
	}
	public void setMembno(int membno) {
		this.membno = membno;
	}
	public double getAmt() {
		return amt;
	}
	public void setAmt(double amt) {
		this.amt = amt;
	}
	public String getParti() {
		return parti;
	}
	public void setParti(String parti) {
		this.parti = parti;
	}
	public String getaP() {
		return aP;
	}
	public void setaP(String aP) {
		this.aP = aP;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getVrNo() {
		return vrNo;
	}
	public void setVrNo(String vrNo) {
		this.vrNo = vrNo;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSr() {
		return sr;
	}
	public void setSr(String sr) {
		this.sr = sr;
	}
	public String getDocnoo() {
		return docnoo;
	}
	public void setDocnoo(String docnoo) {
		this.docnoo = docnoo;
	}
	public int getProjcd() {
		return projcd;
	}
	public void setProjcd(int projcd) {
		this.projcd = projcd;
	}
	public Date getWcLrDt() {
		return wcLrDt;
	}
	public void setWcLrDt(Date wcLrDt) {
		this.wcLrDt = wcLrDt;
	}
	public Date getChClDt() {
		return chClDt;
	}
	public void setChClDt(Date chClDt) {
		this.chClDt = chClDt;
	}
	public String getcFlag() {
		return cFlag;
	}
	public void setcFlag(String cFlag) {
		this.cFlag = cFlag;
	}
	public int getPartyCd() {
		return partyCd;
	}
	public void setPartyCd(int partyCd) {
		this.partyCd = partyCd;
	}
	@Override
	public String toString() {
		return "TransactionRecords [trId=" + trId + ", sNo=" + sNo + ", docno=" + docno + ", sIno=" + sIno + ", docdte="
				+ docdte + ", doctype=" + doctype + ", accode=" + accode + ", bkcode=" + bkcode + ", chqno=" + chqno
				+ ", chDate=" + chDate + ", bankBr=" + bankBr + ", membno=" + membno + ", amt=" + amt + ", parti="
				+ parti + ", aP=" + aP + ", flag=" + flag + ", vrNo=" + vrNo + ", sno=" + sno + ", sr=" + sr
				+ ", docnoo=" + docnoo + ", projcd=" + projcd + ", wcLrDt=" + wcLrDt + ", chClDt=" + chClDt + ", cFlag="
				+ cFlag + ", partyCd=" + partyCd + "]";
	}
	
	
}
