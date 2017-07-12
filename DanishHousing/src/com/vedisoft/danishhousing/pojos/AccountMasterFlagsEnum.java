package com.vedisoft.danishhousing.pojos;

public enum AccountMasterFlagsEnum {
	Developement("D"),
	Maintainance("M"),
	Plot("P"),
	Others("O"),
	WaterSuply("W"),
	ShareCapital("S");
	
	private final String value;
	private AccountMasterFlagsEnum(String value) {
		this.value = value;
	}
	
	public String getValue(){
		return value;
	}

	
}
