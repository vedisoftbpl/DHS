package com.vedisoft.danishhousing.pojos;

public enum ProjectTypeEnum {
	Bungalows("B"),
	Plots_R("P-R"),
	Plots_C("P-C"),
	Shops("SH"),
	Flats("F"),
	School("SC"),
	Hospital("H"),
	CommunityHall("CH"),
	Others("O");
	
	private final String value;
	
	private ProjectTypeEnum(String value){
		this.value = value ;
	}
	
	public String getValue(){
		return value;
	}
	

}
