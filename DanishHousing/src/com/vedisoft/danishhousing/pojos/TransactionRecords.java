package com.vedisoft.danishhousing.pojos;

import java.util.Date;

public class TransactionRecords {
	private int trId;
	private int sNo;
	private int docNo;
	private int slno;
	private Date  docDte;
	private String docType;
	private String acCode;
	private String bkCode;
	private int chqNo;
	private Date chDate;
	private String bankBr;
	private int  membNo;
	private double  amt;
	private String parti;
	private String aP;
	private int flag;
	private String vrNo;
	private String sN;
	private String sR;
	private String docNoo;
	private int projCd;
	private Date wcLrDt;
	private Date chClDt;
	private String cFlag;
	private int partyCd;
	private int userId;
	private Date lastUpdate;
	
	public TransactionRecords(int sNo, int docNo, int slno, Date docDte, String docType, String acCode, String bkCode,
			int chqNo, Date chDate, String bankBr, int membNo, double amt, String parti, String aP, int flag,
			String vrNo, String sN, String sR, String docNoo, int projCd, Date wcLrDt, Date chClDt, String cFlag,
			int partyCd,int userId, Date lastUpdate) {
		super();
		this.sNo = sNo;
		this.docNo = docNo;
		this.slno = slno;
		this.docDte = docDte;
		this.docType = docType;
		this.acCode = acCode;
		this.bkCode = bkCode;
		this.chqNo = chqNo;
		this.chDate = chDate;
		this.bankBr = bankBr;
		this.membNo = membNo;
		this.amt = amt;
		this.parti = parti;
		this.aP = aP;
		this.flag = flag;
		this.vrNo = vrNo;
		this.sN = sN;
		this.sR = sR;
		this.docNoo = docNoo;
		this.projCd = projCd;
		this.wcLrDt = wcLrDt;
		this.chClDt = chClDt;
		this.cFlag = cFlag;
		this.partyCd = partyCd;
		this.userId = userId;
		this.lastUpdate = lastUpdate;
	}
	public TransactionRecords(int sNo, int docNo, int slno, Date docDte, String docType, String acCode, String bkCode,
			int chqNo, Date chDate, String bankBr, int membNo, double amt, String parti, int flag, String vrNo,
			int projCd, int userId, Date lastUpdate) {
		super();
		this.sNo = sNo;
		this.docNo = docNo;
		this.slno = slno;
		this.docDte = docDte;
		this.docType = docType;
		this.acCode = acCode;
		this.bkCode = bkCode;
		this.chqNo = chqNo;
		this.chDate = chDate;
		this.bankBr = bankBr;
		this.membNo = membNo;
		this.amt = amt;
		this.parti = parti;
		this.flag = flag;
		this.vrNo = vrNo;
		this.projCd = projCd;
		this.userId = userId;
		this.lastUpdate = lastUpdate;
	}
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
	public int getDocNo() {
		return docNo;
	}
	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}
	public int getSlno() {
		return slno;
	}
	public void setSlno(int slno) {
		this.slno = slno;
	}
	public Date getDocDte() {
		return docDte;
	}
	public void setDocDte(Date docDte) {
		this.docDte = docDte;
	}
	public String getDocType() {
		return docType;
	}
	public void setDocType(String docType) {
		this.docType = docType;
	}
	public String getAcCode() {
		return acCode;
	}
	public void setAcCode(String acCode) {
		this.acCode = acCode;
	}
	public String getBkCode() {
		return bkCode;
	}
	public void setBkCode(String bkCode) {
		this.bkCode = bkCode;
	}
	public int getChqNo() {
		return chqNo;
	}
	public void setChqNo(int chqNo) {
		this.chqNo = chqNo;
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
	public int getMembNo() {
		return membNo;
	}
	public void setMembNo(int membNo) {
		this.membNo = membNo;
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
	public String getsN() {
		return sN;
	}
	public void setsN(String sN) {
		this.sN = sN;
	}
	public String getsR() {
		return sR;
	}
	public void setsR(String sR) {
		this.sR = sR;
	}
	public String getDocNoo() {
		return docNoo;
	}
	public void setDocNoo(String docNoo) {
		this.docNoo = docNoo;
	}
	public int getProjCd() {
		return projCd;
	}
	public void setProjCd(int projCd) {
		this.projCd = projCd;
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
	public TransactionRecords() {
		super();
	}
	@Override
	public String toString() {
		return "TransactionRecords [trId=" + trId + ", sNo=" + sNo + ", docNo=" + docNo + ", slno=" + slno + ", docDte="
				+ docDte + ", docType=" + docType + ", acCode=" + acCode + ", bkCode=" + bkCode + ", chqNo=" + chqNo
				+ ", chDate=" + chDate + ", bankBr=" + bankBr + ", membNo=" + membNo + ", amt=" + amt + ", parti="
				+ parti + ", aP=" + aP + ", flag=" + flag + ", vrNo=" + vrNo + ", sN=" + sN + ", sR=" + sR + ", docNoo="
				+ docNoo + ", projCd=" + projCd + ", wcLrDt=" + wcLrDt + ", chClDt=" + chClDt + ", cFlag=" + cFlag
				+ ", partyCd=" + partyCd + "]";
	}
	
	
	
	

}
