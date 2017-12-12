package com.vedisoft.danishhousing.pojos;

import java.util.Date;

public class Projects {
	
	private int projectId;
	private String projectName;
	private String bungProject;
	private Date opDate;
	private String pad1;
	private String pad2;
	private String pad3;
	public Projects() {
		super();
	}
	
	public Projects(int projectId, String projectName, String bungProject, Date opDate, String pad1, String pad2,
			String pad3) {
		super();
		this.projectId = projectId;
		this.projectName = projectName;
		this.bungProject = bungProject;
		this.opDate = opDate;
		this.pad1 = pad1;
		this.pad2 = pad2;
		this.pad3 = pad3;
	}
	public Projects(String projectName, String bungProject, Date opDate, String pad1, String pad2,
			String pad3) {
		super();
		this.projectName = projectName;
		this.bungProject = bungProject;
		this.opDate = opDate;
		this.pad1 = pad1;
		this.pad2 = pad2;
		this.pad3 = pad3;
	}
	

	public Projects(String projectName, String bungProject, Date opDate) {
		super();
		this.projectName = projectName;
		this.bungProject = bungProject;
		this.opDate = opDate;
	}
	public Projects(int projectId, String projectName, String bungProject, Date opDate) {
		super();
		this.projectId = projectId;
		this.projectName = projectName;
		this.bungProject = bungProject;
		this.opDate = opDate;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getBungProject() {
		return bungProject;
	}

	public void setBungProject(String bungProject) {
		this.bungProject = bungProject;
	}

	public Date getOpDate() {
		return opDate;
	}

	public void setOpDate(Date opDate) {
		this.opDate = opDate;
	}

	public String getPad1() {
		return pad1;
	}

	public void setPad1(String pad1) {
		this.pad1 = pad1;
	}

	public String getPad2() {
		return pad2;
	}

	public void setPad2(String pad2) {
		this.pad2 = pad2;
	}

	public String getPad3() {
		return pad3;
	}

	public void setPad3(String pad3) {
		this.pad3 = pad3;
	}

	@Override
	public String toString() {
		return "Projects [projectId=" + projectId + ", projectName=" + projectName + ", bungProject=" + bungProject
				+ ", opDate=" + opDate + ", pad1=" + pad1 + ", pad2=" + pad2 + ", pad3=" + pad3 + "]";
	}
	
	
	

}
