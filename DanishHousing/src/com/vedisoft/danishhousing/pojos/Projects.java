package com.vedisoft.danishhousing.pojos;

import java.util.Date;

public class Projects {
	
	private int projectId;
	private String projectName;
	private String bungProject;
	private Date opDate;
	public Projects() {
		super();
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
	
	public Date getOpDate() {
		return opDate;
	}
	public void setOpDate(Date opDate) {
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
	@Override
	public String toString() {
		return "Projects [projectId=" + projectId + ", projectName=" + projectName + ", bungProject=" + bungProject
				+ ", opDate=" + opDate + "]";
	}
	
	
	

}
