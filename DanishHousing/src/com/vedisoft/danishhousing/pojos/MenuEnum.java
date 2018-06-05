package com.vedisoft.danishhousing.pojos;

public enum MenuEnum {
	 Master_Data("Master_Data"),
	 Forms("Forms"),
	 Payment("Payment"),
	 Reports("Reports"),
	 Rights("Rights");
	
private final String value;
	
	private MenuEnum(String value){
		this.value = value ;
	}
	
	public String getValue(){
		return value;
	}
	
	
}
