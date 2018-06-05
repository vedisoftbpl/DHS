package com.vedisoft.danishhousing.pojos;

import java.io.Serializable;

public class ProcessDto implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	protected String processName;
	protected String menu;
	protected String controller;
	public ProcessDto() {
		super();
	}
	public ProcessDto(String processName, String menu, String controller) {
		super();
		this.processName = processName;
		this.menu = menu;
		this.controller = controller;
	}
	public String getProcessName() {
		return processName;
	}
	public void setProcessName(String processName) {
		this.processName = processName;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getController() {
		return controller;
	}
	public void setController(String controller) {
		this.controller = controller;
	}
	@Override
	public String toString() {
		return "ProcessDto [process=" + processName + ", menu=" + menu + ", controller=" + controller + "]";
	}
	
	
}
