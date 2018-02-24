package com.vedisoft.danishhousing.pojos;

public class Rights {
private int rightsId;
private String rightsName;
private String accounts;
private String dataEntry;
private String reception;
public Rights() {
	super();
}
public Rights(int rightsId, String rightsName, String accounts, String dataEntry, String reception) {
	super();
	this.rightsId = rightsId;
	this.rightsName = rightsName;
	this.accounts = accounts;
	this.dataEntry = dataEntry;
	this.reception = reception;
}
public Rights(String rightsName, String accounts, String dataEntry, String reception) {
	super();
	this.rightsName = rightsName;
	this.accounts = accounts;
	this.dataEntry = dataEntry;
	this.reception = reception;
}
public int getRightsId() {
	return rightsId;
}
public void setRightsId(int rightsId) {
	this.rightsId = rightsId;
}
public String getRightsName() {
	return rightsName;
}
public void setRightsName(String rightsName) {
	this.rightsName = rightsName;
}
public String getAccounts() {
	return accounts;
}
public void setAccounts(String accounts) {
	this.accounts = accounts;
}
public String getDataEntry() {
	return dataEntry;
}
public void setDataEntry(String dataEntry) {
	this.dataEntry = dataEntry;
}
public String getReception() {
	return reception;
}
public void setReception(String reception) {
	this.reception = reception;
}
@Override
public String toString() {
	return "Rights [rightsId=" + rightsId + ", rightsName=" + rightsName + ", accounts=" + accounts + ", dataEntry="
			+ dataEntry + ", reception=" + reception + "]";
}


}
