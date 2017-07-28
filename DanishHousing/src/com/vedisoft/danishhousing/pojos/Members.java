package com.vedisoft.danishhousing.pojos;

import java.util.Date;

public class Members {

	private int memberId;
	private int projectCd;
	private int memberNo;
	private String plotSize;
	private float netPlotSize;
	private String regCor;
	private String plotNo;
	private String tempPlotNo;
	private String prefix;
	private String memName;
	private String address1;
	private String address2;
	private String address3;
	private String memOccupation;
	private int age;
	private String fHRelation;
	private String fHRelName;
	private String nomineeRelation;
	private String nomineeName;
	private int memFee;
	private int memEntryFee;
	private Date receiptdt;
	private String fullPay;
	private String inst1;
	private String inst2;
	private String inst3;
	private String transf;
	private double opBal;
	private String waterConn;
	private String secDep;
	private Date waterConnDate;
	private Date opDt;
	private String regi;
	private Date regDt;
	private String regNo;
	private char rC;
	private Date nocDt;
	private char liveDead;
	private Date refDt;
	private double diversion;
	private String maint;
	private String water;
	private Date watSupplyDt;
	private double finalAmount;
	private String establ;
	private Date wcLrDt;
	private String watChg;
	private double extraAmount;
	private double cost;
	private String mobile;
	private String email;
	private Date dob;
	private String photo;
	private String addProof;
	private String aadhar;
	private Date lastUpdate;
	private int userId;
	private String col1;
	private String col2;
	private String col3;
	private String col4;
	private String buildFlag;
	private String mNominal;
	private int mutaNo1;
	private Date mutaDt1;
	private String gender;
	private String category;
	private String defaulter;
	private String motherName;
	private String panNo;
	private String eliInl;

	public Members(int memberId, int projectCd, int memberNo, String plotSize, float netPlotSize, String regCor,
			String plotNo, String tempPlotNo, String prefix, String memName, String address1, String address2,
			String address3, String memOccupation, int age, String fHRelation, String fHRelName, String nomineeRelation,
			String nomineeName, int memFee, int memEntryFee, Date receiptdt, String fullPay, String inst1, String inst2,
			String inst3, String transf, double opBal, String waterConn, String secDep, Date waterConnDate, Date opDt,
			String regi, Date regDt, String regNo, char rC, Date nocDt, char liveDead, Date refDt, double diversion,
			String maint, String water, Date watSupplyDt, double finalAmount, String establ, Date wcLrDt, String watChg,
			double extraAmount, double cost, String mobile, String email, Date dob, String photo, String addProof,
			String aadhar, Date lastUpdate, int userId, String col1, String col2, String col3, String col4,
			String buildFlag, String mNominal, int mutaNo1, Date mutaDt1, String gender, String category,
			String defaulter, String motherName, String panNo, String eliInl) {
		super();
		this.memberId = memberId;
		this.projectCd = projectCd;
		this.memberNo = memberNo;
		this.plotSize = plotSize;
		this.netPlotSize = netPlotSize;
		this.regCor = regCor;
		this.plotNo = plotNo;
		this.tempPlotNo = tempPlotNo;
		this.prefix = prefix;
		this.memName = memName;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.memOccupation = memOccupation;
		this.age = age;
		this.fHRelation = fHRelation;
		this.fHRelName = fHRelName;
		this.nomineeRelation = nomineeRelation;
		this.nomineeName = nomineeName;
		this.memFee = memFee;
		this.memEntryFee = memEntryFee;
		this.receiptdt = receiptdt;
		this.fullPay = fullPay;
		this.inst1 = inst1;
		this.inst2 = inst2;
		this.inst3 = inst3;
		this.transf = transf;
		this.opBal = opBal;
		this.waterConn = waterConn;
		this.secDep = secDep;
		this.waterConnDate = waterConnDate;
		this.opDt = opDt;
		this.regi = regi;
		this.regDt = regDt;
		this.regNo = regNo;
		this.rC = rC;
		this.nocDt = nocDt;
		this.liveDead = liveDead;
		this.refDt = refDt;
		this.diversion = diversion;
		this.maint = maint;
		this.water = water;
		this.watSupplyDt = watSupplyDt;
		this.finalAmount = finalAmount;
		this.establ = establ;
		this.wcLrDt = wcLrDt;
		this.watChg = watChg;
		this.extraAmount = extraAmount;
		this.cost = cost;
		this.mobile = mobile;
		this.email = email;
		this.dob = dob;
		this.photo = photo;
		this.addProof = addProof;
		this.aadhar = aadhar;
		this.lastUpdate = lastUpdate;
		this.userId = userId;
		this.col1 = col1;
		this.col2 = col2;
		this.col3 = col3;
		this.col4 = col4;
		this.buildFlag = buildFlag;
		this.mNominal = mNominal;
		this.mutaNo1 = mutaNo1;
		this.mutaDt1 = mutaDt1;
		this.gender = gender;
		this.category = category;
		this.defaulter = defaulter;
		this.motherName = motherName;
		this.panNo = panNo;
		this.eliInl = eliInl;
	}

	public Members(int projectCd, int memberNo, String plotSize, float netPlotSize, String regCor, String plotNo,
			String tempPlotNo, String prefix, String memName, String address1, String address2, String address3,
			String memOccupation, int age, String fHRelation, String fHRelName, String nomineeRelation,
			String nomineeName, int memFee, int memEntryFee, Date receiptdt, String fullPay, String inst1, String inst2,
			String inst3, String transf, double opBal, String waterConn, String secDep, Date waterConnDate, Date opDt,
			String regi, Date regDt, String regNo, char rC, Date nocDt, char liveDead, Date refDt, double diversion,
			String maint, String water, Date watSupplyDt, double finalAmount, String establ, Date wcLrDt, String watChg,
			double extraAmount, double cost, String mobile, String email, Date dob, String photo, String addProof,
			String aadhar, Date lastUpdate, int userId, String col1, String col2, String col3, String col4,
			String buildFlag, String mNominal, int mutaNo1, Date mutaDt1, String gender, String category,
			String defaulter, String motherName, String panNo, String eliInl) {
		super();
		this.projectCd = projectCd;
		this.memberNo = memberNo;
		this.plotSize = plotSize;
		this.netPlotSize = netPlotSize;
		this.regCor = regCor;
		this.plotNo = plotNo;
		this.tempPlotNo = tempPlotNo;
		this.prefix = prefix;
		this.memName = memName;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.memOccupation = memOccupation;
		this.age = age;
		this.fHRelation = fHRelation;
		this.fHRelName = fHRelName;
		this.nomineeRelation = nomineeRelation;
		this.nomineeName = nomineeName;
		this.memFee = memFee;
		this.memEntryFee = memEntryFee;
		this.receiptdt = receiptdt;
		this.fullPay = fullPay;
		this.inst1 = inst1;
		this.inst2 = inst2;
		this.inst3 = inst3;
		this.transf = transf;
		this.opBal = opBal;
		this.waterConn = waterConn;
		this.secDep = secDep;
		this.waterConnDate = waterConnDate;
		this.opDt = opDt;
		this.regi = regi;
		this.regDt = regDt;
		this.regNo = regNo;
		this.rC = rC;
		this.nocDt = nocDt;
		this.liveDead = liveDead;
		this.refDt = refDt;
		this.diversion = diversion;
		this.maint = maint;
		this.water = water;
		this.watSupplyDt = watSupplyDt;
		this.finalAmount = finalAmount;
		this.establ = establ;
		this.wcLrDt = wcLrDt;
		this.watChg = watChg;
		this.extraAmount = extraAmount;
		this.cost = cost;
		this.mobile = mobile;
		this.email = email;
		this.dob = dob;
		this.photo = photo;
		this.addProof = addProof;
		this.aadhar = aadhar;
		this.lastUpdate = lastUpdate;
		this.userId = userId;
		this.col1 = col1;
		this.col2 = col2;
		this.col3 = col3;
		this.col4 = col4;
		this.buildFlag = buildFlag;
		this.mNominal = mNominal;
		this.mutaNo1 = mutaNo1;
		this.mutaDt1 = mutaDt1;
		this.gender = gender;
		this.category = category;
		this.defaulter = defaulter;
		this.motherName = motherName;
		this.panNo = panNo;
		this.eliInl = eliInl;
	}

	public Members(int projectCd, int memberNo, String plotSize, float netPlotSize, String plotNo, String prefix,
			String memName, String address1, String address2, String address3, String memOccupation, int age,
			String fHRelation, String fHRelName, String nomineeRelation, String nomineeName, int memFee,
			int memEntryFee, Date receiptdt, char rC, char liveDead, double diversion, double extraAmount, double cost,
			String mobile, String email, Date dob, String photo, String addProof, String aadhar, Date lastUpdate,
			int userId) {
		super();
		this.projectCd = projectCd;
		this.memberNo = memberNo;
		this.plotSize = plotSize;
		this.netPlotSize = netPlotSize;
		this.plotNo = plotNo;
		this.prefix = prefix;
		this.memName = memName;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.memOccupation = memOccupation;
		this.age = age;
		this.fHRelation = fHRelation;
		this.fHRelName = fHRelName;
		this.nomineeRelation = nomineeRelation;
		this.nomineeName = nomineeName;
		this.memFee = memFee;
		this.memEntryFee = memEntryFee;
		this.receiptdt = receiptdt;
		this.rC = rC;
		this.liveDead = liveDead;
		this.diversion = diversion;
		this.extraAmount = extraAmount;
		this.cost = cost;
		this.mobile = mobile;
		this.email = email;
		this.dob = dob;
		this.photo = photo;
		this.addProof = addProof;
		this.aadhar = aadhar;
		this.lastUpdate = lastUpdate;
		this.userId = userId;
	}

	public Members(int memberId, int projectCd, String plotSize, float netPlotSize, String plotNo, String prefix,
			String memName, String address1, String address2, String address3, String memOccupation, String fHRelation,
			String fHRelName, String nomineeRelation, String nomineeName, int memFee, int memEntryFee, Date receiptdt,
			char rC, char liveDead, double diversion, double extraAmount, double cost, String mobile, String email,
			Date dob, String photo, String addProof, String aadhar,int userId,Date lastUpdate) {
		super();
		this.memberId = memberId;
		this.projectCd = projectCd;
		this.plotSize = plotSize;
		this.netPlotSize = netPlotSize;
		this.plotNo = plotNo;
		this.prefix = prefix;
		this.memName = memName;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.memOccupation = memOccupation;
		this.fHRelation = fHRelation;
		this.fHRelName = fHRelName;
		this.nomineeRelation = nomineeRelation;
		this.nomineeName = nomineeName;
		this.memFee = memFee;
		this.memEntryFee = memEntryFee;
		this.receiptdt = receiptdt;
		this.rC = rC;
		this.liveDead = liveDead;
		this.diversion = diversion;
		this.extraAmount = extraAmount;
		this.cost = cost;
		this.mobile = mobile;
		this.email = email;
		this.dob = dob;
		this.photo = photo;
		this.addProof = addProof;
		this.aadhar = aadhar;
		this.userId = userId;
		this.lastUpdate = lastUpdate;

	}

	

	public Members(String prefix, String memName, String address1, String address2, String address3,
			String memOccupation, String fHRelation, String fHRelName, String nomineeRelation, String nomineeName,
			int memFee, int memEntryFee, Date receiptdt, char liveDead, String mobile, String email, Date dob,
			String photo, String addProof, String aadhar, Date lastUpdate, int userId) {
		super();
		this.projectCd = 0;
		this.memberNo = 0;
		this.plotSize = "";
		this.netPlotSize = 0;
		this.regCor = "";
		this.plotNo = "";
		this.tempPlotNo = "";
		this.prefix = prefix;
		this.memName = memName;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.memOccupation = memOccupation;
		this.age = 0;
		this.fHRelation = fHRelation;
		this.fHRelName = fHRelName;
		this.nomineeRelation = nomineeRelation;
		this.nomineeName = nomineeName;
		this.memFee = memFee;
		this.memEntryFee = memEntryFee;
		this.receiptdt = receiptdt;
		this.fullPay = "";
		this.inst1 = "";
		this.inst2 = "";
		this.inst3 = "";
		this.transf = "";
		this.opBal = 0.0;
		this.waterConn = null;
		this.secDep = "";
		this.waterConnDate = null;
		this.opDt = null;
		this.regi = "";
		this.regDt = null;
		this.regNo = "";
		this.rC = ' ';
		this.nocDt = null;
		this.liveDead = liveDead;
		this.refDt = null;
		this.diversion = 0.0;
		this.maint = "";
		this.water = "";
		this.watSupplyDt = null;
		this.finalAmount = 0.0;
		this.establ = "";
		this.wcLrDt = null;
		this.watChg = "";
		this.extraAmount = 0.0;
		this.cost = 0.0;
		this.mobile = mobile;
		this.email = email;
		this.dob = dob;
		this.photo = photo;
		this.addProof = addProof;
		this.aadhar = aadhar;
		this.lastUpdate = lastUpdate;
		this.userId = userId;
		this.col1 = "";
		this.col2 = "";
		this.col3 = "";
		this.col4 = "";
		this.buildFlag = "";
		this.mNominal = "";
		this.mutaNo1 = 0;
		this.mutaDt1 = null;
		this.gender = "";
		this.category = "";
		this.defaulter = "";
		this.motherName = "";
		this.panNo = "";
		this.eliInl = "";

	}

	public Members() {
		super();
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getProjectCd() {
		return projectCd;
	}

	public void setProjectCd(int projectCd) {
		this.projectCd = projectCd;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getPlotSize() {
		return plotSize;
	}

	public void setPlotSize(String plotSize) {
		this.plotSize = plotSize;
	}

	public float getNetPlotSize() {
		return netPlotSize;
	}

	public void setNetPlotSize(float netPlotSize) {
		this.netPlotSize = netPlotSize;
	}

	public String getRegCor() {
		return regCor;
	}

	public void setRegCor(String regCor) {
		this.regCor = regCor;
	}

	public String getPlotNo() {
		return plotNo;
	}

	public void setPlotNo(String plotNo) {
		this.plotNo = plotNo;
	}

	public String getTempPlotNo() {
		return tempPlotNo;
	}

	public void setTempPlotNo(String tempPlotNo) {
		this.tempPlotNo = tempPlotNo;
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getMemOccupation() {
		return memOccupation;
	}

	public void setMemOccupation(String memOccupation) {
		this.memOccupation = memOccupation;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getfHRelation() {
		return fHRelation;
	}

	public void setfHRelation(String fHRelation) {
		this.fHRelation = fHRelation;
	}

	public String getfHRelName() {
		return fHRelName;
	}

	public void setfHRelName(String fHRelName) {
		this.fHRelName = fHRelName;
	}

	public String getNomineeRelation() {
		return nomineeRelation;
	}

	public void setNomineeRelation(String nomineeRelation) {
		this.nomineeRelation = nomineeRelation;
	}

	public String getNomineeName() {
		return nomineeName;
	}

	public void setNomineeName(String nomineeName) {
		this.nomineeName = nomineeName;
	}

	public int getMemFee() {
		return memFee;
	}

	public void setMemFee(int memFee) {
		this.memFee = memFee;
	}

	public int getMemEntryFee() {
		return memEntryFee;
	}

	public void setMemEntryFee(int memEntryFee) {
		this.memEntryFee = memEntryFee;
	}

	public Date getReceiptdt() {
		return receiptdt;
	}

	public void setReceiptdt(Date receiptdt) {
		this.receiptdt = receiptdt;
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

	public String getTransf() {
		return transf;
	}

	public void setTransf(String transf) {
		this.transf = transf;
	}

	public double getOpBal() {
		return opBal;
	}

	public void setOpBal(double opBal) {
		this.opBal = opBal;
	}

	public String getWaterConn() {
		return waterConn;
	}

	public void setWaterConn(String waterConn) {
		this.waterConn = waterConn;
	}

	public String getSecDep() {
		return secDep;
	}

	public void setSecDep(String secDep) {
		this.secDep = secDep;
	}

	public Date getWaterConnDate() {
		return waterConnDate;
	}

	public void setWaterConnDate(Date waterConnDate) {
		this.waterConnDate = waterConnDate;
	}

	public Date getOpDt() {
		return opDt;
	}

	public void setOpDt(Date opDt) {
		this.opDt = opDt;
	}

	public String getRegi() {
		return regi;
	}

	public void setRegi(String regi) {
		this.regi = regi;
	}

	public Date getRegDt() {
		return regDt;
	}

	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}

	public String getRegNo() {
		return regNo;
	}

	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}

	public char getrC() {
		return rC;
	}

	public void setrC(char rC) {
		this.rC = rC;
	}

	public Date getNocDt() {
		return nocDt;
	}

	public void setNocDt(Date nocDt) {
		this.nocDt = nocDt;
	}

	public char getLiveDead() {
		return liveDead;
	}

	public void setLiveDead(char liveDead) {
		this.liveDead = liveDead;
	}

	public Date getRefDt() {
		return refDt;
	}

	public void setRefDt(Date refDt) {
		this.refDt = refDt;
	}

	public double getDiversion() {
		return diversion;
	}

	public void setDiversion(double diversion) {
		this.diversion = diversion;
	}

	public String getMaint() {
		return maint;
	}

	public void setMaint(String maint) {
		this.maint = maint;
	}

	public String getWater() {
		return water;
	}

	public void setWater(String water) {
		this.water = water;
	}

	public Date getWatSupplyDt() {
		return watSupplyDt;
	}

	public void setWatSupplyDt(Date watSupplyDt) {
		this.watSupplyDt = watSupplyDt;
	}

	public double getFinalAmount() {
		return finalAmount;
	}

	public void setFinalAmount(double finalAmount) {
		this.finalAmount = finalAmount;
	}

	public String getEstabl() {
		return establ;
	}

	public void setEstabl(String establ) {
		this.establ = establ;
	}

	public Date getWcLrDt() {
		return wcLrDt;
	}

	public void setWcLrDt(Date wcLrDt) {
		this.wcLrDt = wcLrDt;
	}

	public String getWatChg() {
		return watChg;
	}

	public void setWatChg(String watChg) {
		this.watChg = watChg;
	}

	public double getExtraAmount() {
		return extraAmount;
	}

	public void setExtraAmount(double extraAmount) {
		this.extraAmount = extraAmount;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getAddProof() {
		return addProof;
	}

	public void setAddProof(String addProof) {
		this.addProof = addProof;
	}

	public String getAadhar() {
		return aadhar;
	}

	public void setAadhar(String aadhar) {
		this.aadhar = aadhar;
	}

	public Date getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getCol1() {
		return col1;
	}

	public void setCol1(String col1) {
		this.col1 = col1;
	}

	public String getCol2() {
		return col2;
	}

	public void setCol2(String col2) {
		this.col2 = col2;
	}

	public String getCol3() {
		return col3;
	}

	public void setCol3(String col3) {
		this.col3 = col3;
	}

	public String getCol4() {
		return col4;
	}

	public void setCol4(String col4) {
		this.col4 = col4;
	}

	public String getBuildFlag() {
		return buildFlag;
	}

	public void setBuildFlag(String buildFlag) {
		this.buildFlag = buildFlag;
	}

	public String getmNominal() {
		return mNominal;
	}

	public void setmNominal(String mNominal) {
		this.mNominal = mNominal;
	}

	public int getMutaNo1() {
		return mutaNo1;
	}

	public void setMutaNo1(int mutaNo1) {
		this.mutaNo1 = mutaNo1;
	}

	public Date getMutaDt1() {
		return mutaDt1;
	}

	public void setMutaDt1(Date mutaDt1) {
		this.mutaDt1 = mutaDt1;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDefaulter() {
		return defaulter;
	}

	public void setDefaulter(String defaulter) {
		this.defaulter = defaulter;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	public String getPanNo() {
		return panNo;
	}

	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}

	public String getEliInl() {
		return eliInl;
	}

	public void setEliInl(String eliInl) {
		this.eliInl = eliInl;
	}

	@Override
	public String toString() {
		return "Members [memberId=" + memberId + ", projectCd=" + projectCd + ", memberNo=" + memberNo + ", plotSize="
				+ plotSize + ", netPlotSize=" + netPlotSize + ", regCor=" + regCor + ", plotNo=" + plotNo
				+ ", tempPlotNo=" + tempPlotNo + ", prefix=" + prefix + ", memName=" + memName + ", address1="
				+ address1 + ", address2=" + address2 + ", address3=" + address3 + ", memOccupation=" + memOccupation
				+ ", age=" + age + ", fHRelation=" + fHRelation + ", fHRelName=" + fHRelName + ", nomineeRelation="
				+ nomineeRelation + ", nomineeName=" + nomineeName + ", memFee=" + memFee + ", memEntryFee="
				+ memEntryFee + ", receiptdt=" + receiptdt + ", fullPay=" + fullPay + ", inst1=" + inst1 + ", inst2="
				+ inst2 + ", inst3=" + inst3 + ", transf=" + transf + ", opBal=" + opBal + ", waterConn=" + waterConn
				+ ", secDep=" + secDep + ", waterConnDate=" + waterConnDate + ", opDt=" + opDt + ", regi=" + regi
				+ ", regDt=" + regDt + ", regNo=" + regNo + ", rC=" + rC + ", nocDt=" + nocDt + ", liveDead=" + liveDead
				+ ", refDt=" + refDt + ", diversion=" + diversion + ", maint=" + maint + ", water=" + water
				+ ", watSupplyDt=" + watSupplyDt + ", finalAmount=" + finalAmount + ", establ=" + establ + ", wcLrDt="
				+ wcLrDt + ", watChg=" + watChg + ", extraAmount=" + extraAmount + ", cost=" + cost + ", mobile="
				+ mobile + ", email=" + email + ", dob=" + dob + ", photo=" + photo + ", addProof=" + addProof
				+ ", aadhar=" + aadhar + ", lastUpdate=" + lastUpdate + ", userId=" + userId + ", col1=" + col1
				+ ", col2=" + col2 + ", col3=" + col3 + ", col4=" + col4 + ", buildFlag=" + buildFlag + ", mNominal="
				+ mNominal + ", mutaNo1=" + mutaNo1 + ", mutaDt1=" + mutaDt1 + ", gender=" + gender + ", category="
				+ category + ", defaulter=" + defaulter + ", motherName=" + motherName + ", panNo=" + panNo
				+ ", eliInl=" + eliInl + "]";
	}

	

}
