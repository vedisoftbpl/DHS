package com.vedisoft.danishhousing.pojos;

public enum DocumentCategoriesEnum {
	ID_Proof("ID Proof"),
	Membership_Form("Membership_Form"),
	Registration("Registration"),
	Legal("Legal"),
	Others("Others");
	
	private final String value;
	private DocumentCategoriesEnum(String value) {
		this.value = value;
	}
	
	public String getValue(){
		return value;
	}

}
