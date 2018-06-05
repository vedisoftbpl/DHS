package com.vedisoft.danishhousing.pojos;

import java.io.Serializable;
import java.util.ArrayList;

public class MenuProcessDto implements Serializable{
	private static final long serialVersionUID = 1L;
	
	protected ArrayList<ProcessDto> subMenu;
	protected String menu;

	public MenuProcessDto() {
		super();
	}

	public MenuProcessDto(ArrayList<ProcessDto> subMenu, String menu) {
		super();
		this.subMenu = subMenu;
		this.menu = menu;
	}

	public ArrayList<ProcessDto> getSubMenu() {
		return subMenu;
	}

	public void setSubMenu(ArrayList<ProcessDto> subMenu) {
		this.subMenu = subMenu;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

}
